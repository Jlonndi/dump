local cfgVehicles = module("cfg/vehicles")

local vehicles = {}

local mod_protected = cfgVehicles.mod_protected
local police_fleet = cfgVehicles.policeFleetVehicles

function tvRP.initVehicles(characterNumber)
  if vehicles[characterNumber] == nil then
    vehicles[characterNumber] = {}
  end
end

function tvRP.isInProtectedVeh()
  local ped = PlayerPedId()
  if IsPedSittingInAnyVehicle(ped) then
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 then
      if mod_protected[tostring(GetEntityModel(veh))] then
        return true
      end
      return false
    end
  end
  return false
end

local emergency_vehicles = cfgVehicles.emergency_vehicles

RegisterNetEvent('vRP:spawnGarageVehicle')
AddEventHandler('vRP:spawnGarageVehicle', function(net_id, vtype,name,options,plateNum)
  tvRP.spawnGarageVehicle(net_id, vtype,name,options,plateNum)
end)

function tvRP.spawnGarageVehicle(net_id, vtype,name,options,plateNum,vehDamage,dealerSpawn) -- vtype is the vehicle type (one vehicle per type allowed at the same time)
  local entity_id = 0
  if NetworkDoesNetworkIdExist(net_id) then
    NetworkRequestControlOfNetworkId(net_id) -- We have to do this
    entity_id = NetworkGetEntityFromNetworkId(net_id)
  end
  local sanity_check = GetGameTimer() + 5000
  while entity_id == 0 do
    print('Waiting until vehicle is registered')
    if NetworkDoesNetworkIdExist(net_id) then
      NetworkRequestControlOfNetworkId(net_id) -- We have to do this
      entity_id = NetworkGetEntityFromNetworkId(net_id)
    end
    if sanity_check < GetGameTimer() and entity_id == 0 then
      TriggerEvent('vrp:client:notify', 'Failed to handshake vehicle')
      TriggerServerEvent('core:server:deleteNetworkedEntity', net_id)
      return print('ERROR: spawnVehicle called with invalid network ID')
    end
    Citizen.Wait(200)
  end
  -- TODO ask why dealerSpawn was inside here and how I need to take it into consideration
  if dealerSpawn == nil then dealerSpawn = false end
  local vehicle = entity_id
  tvRP.addPlateToList(plateNum, name, net_id) -- TODO adjust here?

  -- We cant do this precheck anymore because vehicle will already be spawned
  --if vehicle and not IsVehicleDriveable(vehicle[3]) then -- precheck if vehicle is undriveable
  --  -- despawn vehicle
  --  print('spawned vehicle is not drivable, despawning')
  --  SetVehicleHasBeenOwnedByPlayer(vehicle[3],false)
  --  SetEntityAsMissionEntity(vehicle[3], false, true)
  --  SetVehicleAsNoLongerNeeded(Citizen.PointerValueIntInitialized(vehicle[3]))
  --  DeleteVehicle(Citizen.PointerValueIntInitialized(vehicle[3]))
  --  print('vehicle being removed from client')
  --  vehicles[characterNumber][plateNum] = nil
  --end

  local veh = vehicle
  local carModel = GetEntityModel(veh)
  local carName = string.lower(GetDisplayNameFromVehicleModel(carModel))
  vRPserver.registerVehicleID({plateNum,name,net_id})
  DecorSetFloat(veh,"VehicleID",net_id)
  SetVehicleOnGroundProperly(veh)
  SetEntityInvincible(veh,false)
  SetVehicleNumberPlateText(veh, plateNum)

  local nid = net_id
  --SetNetworkIdCanMigrate(nid, true)
  --SetEntityAsMissionEntity(veh, true, false)
  SetVehicleHasBeenOwnedByPlayer(veh, true)

  SetVehicleModKit(veh, 0)

  -- Register car with blrp_core
  TriggerServerEvent('core:server:registerOwnedVehicle', {
    registration = plateNum,
    network_id = nid,
    local_entity_id = veh,
    character_id = characterNumber,
    type = vtype,
    name = name,
    is_dealer_only = dealerSpawn
  })

  local protected = false
  if mod_protected[tostring(carModel)] then
    protected = true
  end
  if not protected then
    SetVehicleModColor_1(veh, 0, 0, 0)
    SetVehicleModColor_2(veh, 0, 0, 0)
    SetVehicleColours(veh, tonumber(options.main_colour), tonumber(options.secondary_colour))
    SetVehicleExtraColours(veh, tonumber(options.ecolor), tonumber(options.ecolorextra))
  end

  SetVehicleWindowTint(veh, options.windows)

  if name == "cvpi" then
    SetVehicleWindowTint(veh, 4)
    if tvRP.getCopLevel() >= 4 then
      SetVehicleLivery(veh, 3) -- Supervisor
    else
      local rnd = math.random(1,2)
      SetVehicleLivery(veh, rnd) -- Patrol
    end
  elseif name == "charger" then
    SetVehicleWindowTint(veh, 4)
    if tvRP.getCopLevel() >= 4 then
      SetVehicleLivery(veh, 4) -- Supervisor
    else
      local rnd = math.random(1,2)
      SetVehicleLivery(veh, rnd) -- Patrol
    end
    SetVehicleExtra(veh,1,0) -- Radar
    SetVehicleExtra(veh,2,0) -- Dash Cam
    SetVehicleExtra(veh,3,1) -- GPS Antenna
    SetVehicleExtra(veh,4,0) -- Light Bar
    SetVehicleExtra(veh,8,1) -- Files on Passenger Seat
    SetVehicleExtra(veh,11,0) -- Push Bar
  elseif name == "f350" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,0)
    SetVehicleExtra(veh,6,1)
    SetVehicleExtra(veh,7,1)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,10,0)
    SetVehicleExtra(veh,11,0)
    SetVehicleExtra(veh,12,1)
  elseif name == "tahoe" then --TODO review current set
    SetVehicleWindowTint(veh, 4)
    if tvRP.getCopLevel() >= 4 then
      SetVehicleLivery(veh, 5) -- Supervisor
    else
      local rnd = math.random(1,2)
      SetVehicleLivery(veh, rnd) -- Patrol
    end
    SetVehicleExtra(veh,1,0) -- Light Bar
    SetVehicleExtra(veh,2,0) -- Partition
    SetVehicleExtra(veh,3,0) -- Radar
    SetVehicleExtra(veh,4,0) -- Push Bar
    SetVehicleExtra(veh,5,0) -- Dash Cam
    SetVehicleExtra(veh,6,1) -- Spotlight
  elseif name == "policeb2" then
    vRPserver.hasPermission_client({ 'lspd.service' }, function(is_lspd)
      vRPserver.hasPermission_client({ 'sheriff.service' }, function(is_sheriff)
        if is_sheriff then
          SetVehicleLivery(veh, 0)
        else
          SetVehicleLivery(veh, 1)
        end
      end)
    end)

    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0) -- Upper Lights
    SetVehicleExtra(veh,2,0) -- Lower Lights
    SetVehicleExtra(veh,3,1) -- Radar Gun
  elseif name == "polmav2" then
    vRPserver.hasPermission_client({ 'lspd.service' }, function(is_lspd)
      vRPserver.hasPermission_client({ 'sheriff.service' }, function(is_sheriff)
        if is_sheriff then
          SetVehicleLivery(veh, 1)
        else
          SetVehicleLivery(veh, 0)
        end
      end)
    end)

    --SetVehicleLivery(veh, 2)
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,10,0)
  elseif name == "rbptvan" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleLivery(veh, 0)
    SetVehicleExtra(veh,1,0) -- Upper Lights
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,0)
    SetVehicleExtra(veh,6,0)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,9,0)
    SetVehicleExtra(veh,10,0)
  elseif name == "uccvpi" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0) -- Spotlight
    SetVehicleExtra(veh,2,0) -- Back Antennas
    SetVehicleExtra(veh,7,0) -- Dashcam & Radar
    SetVehicleExtra(veh,8,0) -- Push Bar
    SetVehicleExtra(veh,11,1) -- Wrap Around Push Bar Center
    SetVehicleExtra(veh,12,1) -- Wrap Around Push Bar Sides
  elseif name == "explorer" then
    SetVehicleWindowTint(veh, 4)
    if tvRP.getCopLevel() >= 4 then
      SetVehicleLivery(veh, 3) -- Supervisor
    else
      local rnd = math.random(1,2)
      SetVehicleLivery(veh, rnd) -- Patrol
    end
    SetVehicleExtra(veh,2,0) -- Spotlight
    SetVehicleExtra(veh,3,0) -- Push Bar
    SetVehicleExtra(veh,5,0) -- Partition
    SetVehicleExtra(veh,10,0) -- Dashcam
    SetVehicleExtra(veh,12,0) -- Radar
  elseif name == "fpis" then
    SetVehicleWindowTint(veh, 4)
    if tvRP.isDoj() then
      SetVehicleLivery(veh, 4) -- Courts
      SetVehicleExtra(veh,2,1) -- Spotlight
      SetVehicleExtra(veh,5,1) -- Partition
      SetVehicleExtra(veh,7,1) -- Push Bar
      SetVehicleExtra(veh,10,1) -- Dashcam
      SetVehicleExtra(veh,12,1) -- Radar
    else
      if tvRP.getCopLevel() >= 4 then
        SetVehicleLivery(veh, 2) -- Supervisor
      else
        SetVehicleLivery(veh, 1) -- Patrol
      end
      SetVehicleExtra(veh,2,0) -- Spotlight
      SetVehicleExtra(veh,5,0) -- Partition
      SetVehicleExtra(veh,7,0) -- Push Bar
      SetVehicleExtra(veh,10,0) -- Dashcam
      SetVehicleExtra(veh,12,0) -- Radar
    end
  elseif name == "GTFsubrb" then
    --SetVehicleWindowTint(veh, 4) -- Fix for Windows Tint not saving
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,10,0)
  elseif name == "bearcat" then
    --SetVehicleWindowTint(veh, 4) -- Fix for Windows Tint not saving
    SetVehicleMod(veh,4,0) -- Fix for the playdough wheels
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,4,1)
    SetVehicleExtra(veh,5,1)
    SetVehicleExtra(veh,6,0)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,9,0)
  elseif name == "demon" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,1)
    SetVehicleExtra(veh,5,1)
    SetVehicleExtra(veh,6,1)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,8,1)
    SetVehicleExtra(veh,9,0)
    SetVehicleExtra(veh,10,0)
    SetVehicleExtra(veh,11,0)
    SetVehicleExtra(veh,12,1)
    SetVehicleLivery(veh, 0)
  elseif name == "camaro" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,1) -- white lights
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,1) -- Front lights that cause indivisible hit box
    SetVehicleExtra(veh,6,0)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,9,1)
    SetVehicleExtra(veh,10,1)
    SetVehicleExtra(veh,11,1)
    SetVehicleExtra(veh,12,1)
    SetVehicleLivery(veh, 0)
  elseif name == "explorer2" then
    SetVehicleWindowTint(veh, 4)
    if tvRP.getCopLevel() >= 5 then
      SetVehicleLivery(veh, 2) -- Ghost
    else
      SetVehicleLivery(veh, 1) -- Patrol
    end
    SetVehicleExtra(veh,2,0) -- Spotlight
    SetVehicleExtra(veh,3,0) -- Push Bar
    SetVehicleExtra(veh,5,0) -- Partition
    SetVehicleExtra(veh,10,0) -- Dashcam
    SetVehicleExtra(veh,12,0) -- Radar
  elseif name == "uccharger" then
    SetVehicleWindowTint(veh, 4)
    SetVehicleExtra(veh,1,0) -- Push Bar
    SetVehicleExtra(veh,2,0) -- Wrap Around Push Bar
    SetVehicleExtra(veh,3,0) -- Back Radar
    SetVehicleExtra(veh,4,0) -- Dash Cam
    SetVehicleExtra(veh,5,0) -- Radar
    SetVehicleExtra(veh,6,0) -- Garmin
    SetVehicleExtra(veh,7,0) -- Spotlight

  elseif name == "asstchief" then
    local rankT = tvRP.getEmergencyLevel()
    if rankT >= 4 then
      SetVehicleLivery(veh, 1)
      SetVehicleExtra(veh,4,1)
    else
      SetVehicleLivery(veh, 0)
      SetVehicleExtra(veh,4,0)
    end
    SetVehicleExtra(veh,1,1)
    SetVehicleExtra(veh,2,1)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,8,1)
    SetVehicleExtra(veh,11,1)
    SetVehicleWindowTint(veh,4)
  elseif name == "chiefpara" then
    SetVehicleLivery(veh, 0)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,5,1)
  elseif name == "pengine" then
    SetVehicleLivery(veh, 0)
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,1)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,4,1)
    SetVehicleExtra(veh,5,1)
    SetVehicleExtra(veh,6,0)
    SetVehicleExtra(veh,7,1)
  elseif name == "ambulance" then
    SetVehicleLivery(veh, 0)
    SetVehicleExtra(veh,1,1)
    SetVehicleExtra(veh,2,1)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,1)
    SetVehicleExtra(veh,6,1)
    SetVehicleExtra(veh,7,1)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,9,1)
    SetVehicleExtra(veh,10,0)
    SetVehicleExtra(veh,11,1)
    SetVehicleExtra(veh,12,1)
  elseif name == "firesuv" then
    local rankT = tvRP.getEmergencyLevel()
    if rankT >= 4 then
      SetVehicleLivery(veh, 2)
    elseif rankT > 1 then
        SetVehicleLivery(veh, 1)
    else
        SetVehicleLivery(veh, 0)
    end
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,4,1)
  elseif name == "fdjeep" then
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
  elseif name == "gator" then
    vRPserver.hasPermission_client({ 'sheriff.service' }, function(is_sheriff)
      vRPserver.hasPermission_client({ 'doc.service' }, function(is_doc)
        if is_sheriff then
          SetVehicleLivery(veh, 1)
        else
          SetVehicleLivery(veh, 0)
        end
      end)
    end)

    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,0)
    SetVehicleExtra(veh,6,0)
    SetVehicleExtra(veh,7,0)
    SetVehicleExtra(veh,8,0)
    SetVehicleExtra(veh,9,0)
  elseif name == "firesuv2" then
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,0)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
    SetVehicleExtra(veh,5,0)
    SetVehicleExtra(veh,6,0)
  elseif name == "raptor2" then
    SetVehicleExtra(veh,1,0)
    SetVehicleExtra(veh,2,1)
    SetVehicleExtra(veh,3,0)
    SetVehicleExtra(veh,4,0)
  elseif name == "polmav" then
    if tvRP.isCop() then
      SetVehicleLivery(veh, 2)
    elseif tvRP.isMedic() then
      SetVehicleLivery(veh, 1)
    end
  elseif name == "fordf150" then
    SetVehicleExtra(veh,1,1)
    SetVehicleExtra(veh,2,1)
  elseif name == "rumpo" then
    SetVehicleLivery(veh, 2)
  elseif name == "rmodsupra" then
    SetVehicleLivery(veh, 1)
  elseif name == "bisonn" then
    SetVehicleExtra(veh,2,1)
    SetVehicleExtra(veh,3,1)
    SetVehicleExtra(veh,4,1)
    SetVehicleExtra(veh,5,0)
    SetVehicleExtra(veh,6,1)
    SetVehicleExtra(veh,7,0)
  elseif name == 'ctsv16' then
    SetVehicleExtra(veh,11,0)
  elseif name == "cvpi13" then
    SetVehicleExtra(veh, 12, 1)
  elseif name == "apoliceu" then
    SetVehicleExtra(veh, 1, 1)
  elseif name == "apolice7" then
    SetVehicleExtra(veh, 1, 1)
  elseif name == 'taco2' then
    SetVehicleExtra(veh, 1, 0) -- Roof sign

    vRPserver.hasPermission_client({ 'yellowjack.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 0)
      end
    end)

    vRPserver.hasPermission_client({ 'chihuahua.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 1)
      end
    end)

    vRPserver.hasPermission_client({ 'mojito.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 2)
      end
    end)

    vRPserver.hasPermission_client({ 'panda.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 3)
      end
    end)

    vRPserver.hasPermission_client({ 'burgershot.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 4)
      end
    end)

    vRPserver.hasPermission_client({ 'tonypizza.employee' }, function(has_permission)
      if has_permission then
        SetVehicleLivery(veh, 5)
      end
    end)
  else
    if not police_fleet[tostring(carModel)] then
      SetVehicleLivery(veh, 0)
    end
  end

  -- New police fleet 2021

  if police_fleet[tostring(carModel)] then
    SetVehicleNumberPlateTextIndex(veh, 4) -- SA Exempt license plate

    vRPserver.hasPermission_client({ 'lspd.service' }, function(is_lspd)
      vRPserver.hasPermission_client({ 'sheriff.service' }, function(is_sheriff)
        if is_sheriff then
          SetVehicleLivery(veh, 0)
        else
          SetVehicleLivery(veh, 1)
        end
      end)
    end)

    SetVehicleExtra(veh, 1, 0) -- Roof Lightbar
    SetVehicleExtra(veh, 2, 1) -- Dashboard Light
    SetVehicleExtra(veh, 3, 0) -- Grill Lights
    SetVehicleExtra(veh, 4, 0) -- Rear Lightbar
    SetVehicleExtra(veh, 5, 0) -- Skirt Lights
    SetVehicleExtra(veh, 6, 1) -- Visor Lights
    SetVehicleExtra(veh, 7, 0) -- Marked Assets

    if name == 'fpiu16' then
      SetVehicleExtra(veh, 8, 1) -- Push Bumper
    else
      SetVehicleExtra(veh, 8, 0) -- Push Bumper
    end
  end

  if not police_fleet[tostring(carModel)] then
    SetVehicleNumberPlateTextIndex(veh, options.platetype)
  end

  SetVehicleDirtLevel(veh, 0)
  SetVehicleEngineOn(veh, true, true)

  if options.mods then
    options.mods = json.decode(options.mods)
    if type(options.mods) == "table" then
      for k,v in pairs(options.mods) do
        if k == "18" or k == "22" then --support toggle mods like headlights/turbo
          ToggleVehicleMod(veh, tonumber(k), tonumber(v.mod))
        elseif k == "23" then -- custom tires
          SetVehicleMod(veh,tonumber(k),tonumber(v.mod),false)
          SetVehicleWheelType(veh, tonumber(options.wheels))
        elseif k == "20" then  -- tire smoke
          ToggleVehicleMod(veh,20,true)
          SetVehicleTyreSmokeColor(veh, tonumber(options.smokecolor1),tonumber(options.smokecolor2),tonumber(options.smokecolor3))
        elseif k == "0" then -- spoiler
          if name ~= 'hellion' then -- hellion has bulletproof window panels
            SetVehicleMod(veh,tonumber(k),tonumber(v.mod),false)
          end
        else
          SetVehicleMod(veh,tonumber(k),tonumber(v.mod),false)
        end
      end
    end
  end


  if tonumber(options.neon) == 0 then
    --SetVehicleNeonLightsColour(veh,255,255,255)
    SetVehicleNeonLightEnabled(veh,0,false)
    SetVehicleNeonLightEnabled(veh,1,false)
    SetVehicleNeonLightEnabled(veh,2,false)
    SetVehicleNeonLightEnabled(veh,3,false)
  else
    SetVehicleNeonLightsColour(veh,tonumber(options.neoncolor1),tonumber(options.neoncolor2),tonumber(options.neoncolor3))
    SetVehicleNeonLightEnabled(veh,0,true)
    SetVehicleNeonLightEnabled(veh,1,true)
    SetVehicleNeonLightEnabled(veh,2,true)
    SetVehicleNeonLightEnabled(veh,3,true)
  end

  vehicles[characterNumber][plateNum] = {vtype,name,veh,net_id} -- set current vehicule

  local blip = AddBlipForEntity(veh)
  SetBlipSprite(blip, 225)
  SetBlipScale(blip, 0.7)

  SetModelAsNoLongerNeeded(mhash)

  if emergency_vehicles[tostring(carModel)] then
    SetVehRadioStation(veh, "OFF")
  end
  if vehDamage ~= nil then
    Citizen.Trace(vehDamage.engineDamage.." "..vehDamage.bodyDamage.." "..vehDamage.fuelDamage)
    SetVehicleEngineHealth(veh,vehDamage.engineDamage + 0.0001)
    SetVehicleBodyHealth(veh,vehDamage.bodyDamage + 0.0001)
    SetVehiclePetrolTankHealth(veh,vehDamage.fuelDamage + 0.0001)
    local doorDamage = vehDamage.doorDamage
    doorDamage = json.decode(doorDamage)
    if doorDamage ~= nil and doorDamage.doorCount ~= nil and doorDamage.doorCount > 0 and doorDamage.list ~= nil then
      for i = 0, doorDamage.doorCount, 1 do
        if doorDamage.list[tostring(i)] ~= nil and doorDamage.list[tostring(i)] then
          SetVehicleDoorBroken(veh, i, true)
        end
      end
    end
  end
  if name ~= "stretcher" then
    SetPedIntoVehicle(PlayerPedId(),veh,-1) -- put player inside
  else
    vRPserver.serverVehicleDoorLocks({nid, 2})
  end
end

function tvRP.recoverVehicleOwnership(vtype,name,veh,plateNum,netId)
  if vtype ~= nil and name ~= nil and veh ~= nil and netId ~= nil then
    if vehicles[characterNumber] ~= nil then
      vehicles[characterNumber][plateNum] = {vtype,name,veh,netId}
    end
  end
end

function tvRP.deleteVehicle_cl(netId)
  if netId ~= nil and NetworkDoesEntityExistWithNetworkId(netId) then
    local netVehicle = NetworkGetEntityFromNetworkId(netId)
    if netVehicle ~= nil then
      SetEntityAsMissionEntity(netVehicle, true, true)
      DeleteVehicle(netVehicle)
    end
  end
end

function tvRP.removeOutVehicle(characterNumber,plateNum)
  vehicles[characterNumber][plateNum] = nil
end

function tvRP.despawnGarageVehicle(vtype,max_range,shopId)
  local garageCat = ""
  tvRP.selectTargetVehicle(max_range, function(vehicle)
    if vehicle ~= -1 then
      if IsEntityAVehicle(vehicle) then
        if shopId ~= nil then
          garageCat = string.sub(shopId, 1, 1)
        end
        if garageCat == "h" and GetVehicleClass(vehicle) ~= 18 and not string.match(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)), 'pbike') then
          tvRP.notify("You vehicle cannot be stored here.")
        elseif garageCat == "m" then
          carModel = GetEntityModel(vehicle)
          carName = GetDisplayNameFromVehicleModel(carModel)
          if string.match(carName, "BOXVILLE") then
            storeVehicle(vehicle, shopId)
          else
            tvRP.notify("Your vehicle cannot be stored here.")
          end
        else
          storeVehicle(vehicle, shopId)
        end
      else
        tvRP.notify("No vehicle found to store.")
      end
    else
      tvRP.notify("No vehicle found to store.")
    end
  end)
end

function storeVehicle(vehicle, shopId)
  plate = GetVehicleNumberPlateText(vehicle)
  args = tvRP.stringsplit(plate)
  if args ~= nil then
    plate = args[1]
    carModel = GetEntityModel(vehicle)
    carName = GetDisplayNameFromVehicleModel(carModel)
    local nid = NetworkGetNetworkIdFromEntity(vehicle)
    if tvRP.getIsVehicleOwnerByNetId(nid,plate) then
      tvRP.saveVehicleDamage(vehicle)
      TriggerServerEvent('core:server:unregisterOwnedVehicle', plate)
      TriggerServerEvent('core:server:tryRemoveFromTrunk', 'self', plate)
      tvRP.notify("Attempting to store vehicle.")
      --SetEntityAsMissionEntity(vehicle, true, true)
      --DeleteVehicle(vehicle)
      vRPserver.deleteVehicle_sv({nid})
      vRPserver.setVehicleOutStatusPlateGarage({plate,string.lower(carName),0,0,shopId})
      tvRP.removePlateFromList(plate)
      -- check if the vehicle failed to impound. This happens if another player is nearby
      Citizen.Wait(2000)
      --local vehicle_out = tvRP.searchForVeh(PlayerPedId(),10,plate,carName)
      if not vehicle then
        vehicles[characterNumber][plate] = nil
        tvRP.notify("Your vehicle has been stored in the garage.")
      else
        vRPserver.setVehicleOutStatusPlate({plate,string.lower(carName),1,0})
      end
    end
  else
    tvRP.notify("No vehicle found to store.")
  end
end

function tvRP.saveVehicleDamage(vehicle)
  if vehicle ~= nil then
    local carModel = GetEntityModel(vehicle)
    local carName = GetDisplayNameFromVehicleModel(carModel)
    local engineDamage = GetVehicleEngineHealth(vehicle) or 1000
    local bodyDamage = GetVehicleBodyHealth(vehicle) or 1000
    local fuelDamage = GetVehiclePetrolTankHealth(vehicle) or 1000
    local doorDamage = {}
    doorDamage.list = {}
    local numDoors = GetNumberOfVehicleDoors(vehicle)
    if numDoors > 0 then
      doorDamage.doorCount = numDoors - 1
      for i = 0, doorDamage.doorCount, 1 do
        if IsVehicleDoorDamaged(vehicle, i) then
          doorDamage.list[tostring(i)] = true
        else
          doorDamage.list[tostring(i)] = false
        end
      end
    else
      doorDamage.doorCount = 0
    end

    local windowDamage = {}
    for i = 0, 5, 1 do
      if IsVehicleWindowIntact(vehicle, i) then
        windowDamage[tostring(i)] = true
      else
        windowDamage[tostring(i)] = false
      end
    end

    if engineDamage < 25 then
      engineDamage = 25
    end
    if bodyDamage < 25 then
      bodyDamage = 25
    end
    if fuelDamage < 25 then
      fuelDamage = 25
    end
    vRPserver.saveVehicleDamage({engineDamage,bodyDamage,fuelDamage,carName,json.encode(doorDamage),json.encode(windowDamage)})
  end
end

-- (experimental) this function return the nearest vehicle
-- (don't work with all vehicles, but aim to)
-- TODO review all calls this function so they check for -1
function tvRP.getNearestVehicle(radius)
  local ped = PlayerPedId()
  if IsPedSittingInAnyVehicle(ped) then
    return GetVehiclePedIsIn(ped, true)
  else
    local veh = GetClosestVehicle(radius)
    return veh
  end
end

-- try to get a vehicle at a specific position (using raycast)
function tvRP.getVehicleAtPosition(x,y,z)
  x = x+0.0001
  y = y+0.0001
  z = z+0.0001

  local ray = CastRayPointToPoint(x,y,z,x,y,z+4,10,PlayerPedId(),0)
  local a, b, c, d, ent = GetRaycastResult(ray)
  return ent
end

function tvRP.getVehicleAtRaycast(radius)
  local player = PlayerPedId()
  local pos = GetEntityCoords(player)
  local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, radius+0.00001, 0.0)

  local rayHandle = StartShapeTestCapsule( pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, radius+0.00001, 10, player, 7 )
  local a, b, c, d, vehicleHandle = GetShapeTestResult(rayHandle)

  return vehicleHandle
end

function tvRP.getNearestEmergencyVehicle(radius)
  local vehicle = nil
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  else
    vehicle = GetClosestVehicle(radius)
  end

  if vehicle ~= nil and vehicle ~= -1 then
    vehicleClass = GetVehicleClass(vehicle)
    if vehicleClass ==  18 then
      return true,"default",string.lower(vehicleClass)
    end
  end

  return false,"",""
end

function tvRP.applySpeedBombSyncDecor(vehicle_network_id)
  local vehicle = NetworkGetEntityFromNetworkId(vehicle_network_id)
  if DoesEntityExist(vehicle) then
    DecorSetInt(vehicle, "SpeedBomb", 1)
  end
end

function tvRP.applySpeedBomb()
	local mechanic = mechanic
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped, false) then
		local vehicle = tvRP.getVehicleAtRaycast(2)
		if vehicle ~= nil and vehicle ~= 0 and IsEntityAVehicle(vehicle) then
			Citizen.CreateThread(function()
				local pos = GetEntityCoords(PlayerPedId())
				tvRP.playAnim(false, {task="CODE_HUMAN_MEDIC_TEND_TO_DEAD"}, false)
				tvRP.setActionLock(true)
				Citizen.Wait(1000)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK",pos.x, pos.y, pos.z,10})
				Citizen.Wait(200)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK",pos.x, pos.y, pos.z,10})
				Citizen.Wait(400)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK_BAD",pos.x, pos.y, pos.z,10})
				Citizen.Wait(1200)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK",pos.x, pos.y, pos.z,10})
				Citizen.Wait(200)
				vRPserver.broadcastSpatializedSound({0,"HACKING_MOVE_CURSOR",pos.x, pos.y, pos.z,10})
				Citizen.Wait(400)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK_GOOD",pos.x, pos.y, pos.z,10})
				Citizen.Wait(1200)
				Citizen.Wait(200)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK",pos.x, pos.y, pos.z,10})
				Citizen.Wait(400)
				vRPserver.broadcastSpatializedSound({0,"HACKING_CLICK_GOOD",pos.x, pos.y, pos.z,10})
				Citizen.Wait(1200)
				vRPserver.broadcastSpatializedSound({"DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS","Hack_Success",pos.x, pos.y, pos.z,10})
				tvRP.stopAnim(false)
				tvRP.setActionLock(false)
                local net_id = NetworkGetNetworkIdFromEntity(vehicle)
              vRPserver.syncSpeedBombAllClients({net_id})
				tvRP.notify("SpeedBomb applied to vehicle!")
			end)
			return true
		else
			tvRP.notify("There are no vehicles nearby.")
		end
	else
		tvRP.notify("You must be outside of the vehicle.")
	end
	return false
end

RegisterNetEvent('vrp:client:getNearestPlayerVehicle')
AddEventHandler('vrp:client:getNearestPlayerVehicle', function(radius, callback)
  local isNearVehicle, v_type, car_name, plate = tvRP.getNearestOwnedVehicle(radius, callback)
  if isNearVehicle then
    callback({
      car_name = car_name,
      plate = plate,
    })
    return
  else
    callback(false)
    return
  end
end)

-- return ok,vtype,name
function tvRP.getNearestOwnedVehicle(radius)
  local vehicle = nil
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  else
    vehicle = GetClosestVehicle(radius)
  end

  if vehicle ~= nil and vehicle ~= -1 then
    local netId = NetworkGetNetworkIdFromEntity(vehicle)
    plate = GetVehicleNumberPlateText(vehicle)
    args = tvRP.stringsplit(plate)
    if args ~= nil then
      plate = args[1]
      if tvRP.getIsVehicleOwnerByNetId(netId,plate) then
        carModel = GetEntityModel(vehicle)
        carName = GetDisplayNameFromVehicleModel(carModel)
        tvRP.recoverVehicleOwnership("default",string.lower(carName),vehicle,plate,netId)
        return true,"default",string.lower(carName),plate
      end
    end
  end

  return false,"","",""
end

function tvRP.getNearestOwnedVehiclePlate(radius)
  local vehicle = nil
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  else
    vehicle = tvRP.getNearestVehicle(radius)
  end

  if vehicle ~= nil and vehicle ~= -1 then
    plate = GetVehicleNumberPlateText(vehicle)
    args = tvRP.stringsplit(plate)
    if args ~= nil then
      plate = args[1]
      carModel = GetEntityModel(vehicle)
      carName = GetDisplayNameFromVehicleModel(carModel)
      return true,"default",string.lower(carName),plate
    end
  end

  return false,"",""
end

function tvRP.getNearestOwnedVehicleID(radius)
  local vehicle = nil
  if IsPedInAnyVehicle(PlayerPedId(), false) then
    vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
  else
    vehicle = GetClosestVehicle(radius)
  end

  if vehicle ~= nil and vehicle ~= -1 then
    plate = GetVehicleNumberPlateText(vehicle)

    args = tvRP.stringsplit(plate)
    if args ~= nil then
      plate = args[1]
      carModel = GetEntityModel(vehicle)
      carName = GetDisplayNameFromVehicleModel(carModel)
      local decor = DecorGetFloat(vehicle, "VehicleID")
      return true,"default",string.lower(carName),plate,decor
    end
  end

  return false,"",""
end

-- return ok,x,y,z
function tvRP.getAnyOwnedVehiclePosition()
  for k,v in pairs(vehicles) do
    if IsEntityAVehicle(v[3]) then
      local x,y,z = table.unpack(GetEntityCoords(v[3],true))
      return true,x,y,z
    end
  end

  return false,0,0,0
end

-- return ok, vehicule network id
function tvRP.getOwnedVehicleId(plate)
  local vehicle = vehicles[characterNumber][plate]
  if vehicle then
    return true, NetworkGetNetworkIdFromEntity(vehicle[3])
  else
    return false, 0
  end
end

-- eject the ped from the vehicle


function tvRP.ejectVehicle()
  print('starting eject vehicle -----------------------------------')
  local ped = PlayerPedId()
  if IsPedInAnyVehicle(ped, false) then
    local veh = GetVehiclePedIsIn(ped,false)
    if tvRP.isInComa() then
      TaskLeaveVehicle(ped, veh, 16)
    else
      -- A dead player can't do this, so EMS + cops /etc will always have problems with ded people
      TaskLeaveVehicle(ped, veh, 4160)
    end
    SetTimeout(2000, function()
        if tvRP.isHandcuffed() then
          if tvRP.getAllowMovement() then
            tvRP.playAnim(false,{{"mp_arresting","idle",1}},true)
          else
            tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
          end
        end
    end)
  end
end

function tvRP.ejectVehicleByEmsOrPD()
  local allowed_cars = {
    'ambulance',
    'firetruk',
    'pengine',
    'lguard',
    'lguard',
    'firesuv',
    'fdjeep',
    'chiefpara',
    'asstchief',
    'raptor2',
  }
  local ped = PlayerPedId()
  if IsPedInAnyVehicle(ped, false) then
    local veh = GetVehiclePedIsIn(ped,false)
    local plate = GetVehicleNumberPlateText(veh)
    local name = tvRP.getVehicleNameByPlate(plate)
    if not allowed_cars[name] then
      print('Someone tried to take you out of the car - car is not allowed to be taken out of')
      return false
    end
    if tvRP.isInComa() then
      TaskLeaveVehicle(ped, veh, 16)
    else
      -- A dead player can't do this, so EMS + cops /etc will always have problems with ded people
      TaskLeaveVehicle(ped, veh, 4160)
    end
    SetTimeout(2000, function()
        if tvRP.isHandcuffed() then
          if tvRP.getAllowMovement() then
            tvRP.playAnim(false,{{"mp_arresting","idle",1}},true)
          else
            tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
          end
        end
    end)
  end
end

RegisterNetEvent('vrp:client:basic_garage:openDoor')
AddEventHandler('vrp:client:basic_garage:openDoor', function(name, door_index)
  tvRP.vc_openDoor(name, door_index)
end)

RegisterNetEvent('vrp:client:basic_garage:closeDoor')
AddEventHandler('vrp:client:basic_garage:closeDoor', function(name, door_index)
  tvRP.vc_closeDoor(name, door_index)
end)

-- vehicle commands
function tvRP.vc_openDoor(name, door_index)
  local vehicle = GetClosestVehicle(5)
  if vehicle ~= -1 then
    SetVehicleDoorOpen(vehicle,door_index,0,false)
  end
end

function tvRP.vc_closeDoor(name, door_index)
  local vehicle = GetClosestVehicle(5)
  if vehicle ~= -1 then
    SetVehicleDoorShut(vehicle,door_index)
  end
end

function tvRP.vc_detachTrailer(name)
  local vehicle = vehicles[characterNumber][name]
  if vehicle then
    DetachVehicleFromTrailer(vehicle[3])
  end
end

function tvRP.vc_TowTruck()
  TriggerEvent("tow")
end

function tvRP.vc_detachCargobob(name)
  local vehicle = vehicles[characterNumber][name]
  if vehicle then
    local ent = GetVehicleAttachedToCargobob(vehicle[3])
    if IsEntityAVehicle(ent) then
      DetachVehicleFromCargobob(vehicle[3],ent)
    end
  end
end

-- Thread to monitor Vehcile lock/unlock keypress
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if IsControlJustPressed(1, 303) then -- U pressed
      tvRP.newLockToggle()
    end
  end
end)

function tvRP.newLockToggle()
  if not tvRP.isInComa() and not tvRP.isHandcuffed() then
    local vehicle = nil
    local player = GetPlayerPed(-1)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
      vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    else
      local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 5.0, 0.0)
      local coords = GetEntityCoords(player)
      local rayHandle = CastRayPointToPoint(coords["x"], coords["y"], coords["z"], entityWorld.x, entityWorld.y, entityWorld.z, 10, player, 0)
      local a, b, c, d, targetVehicle = GetRaycastResult(rayHandle)
      if (targetVehicle ~= nil and targetVehicle ~= 0) then
  			vehicle = targetVehicle
  		else
  			vehicle = GetClosestVehicle(5)
  		end
    end
    if vehicle ~= -1 and vehicle ~= nil then
      local plate = GetVehicleNumberPlateText(vehicle)
      local carModel = GetEntityModel(vehicle)
      local carName = GetDisplayNameFromVehicleModel(carModel)
      local netId = NetworkGetNetworkIdFromEntity(vehicle)
      local vehicleClass = GetVehicleClass(vehicle)
      if plate ~= nil and netId ~= nil and carName ~= "stretcher" then
        args = tvRP.stringsplit(plate)
        if args ~= nil then
          plate = args[1]
          if tvRP.getIsVehicleOwnerByNetId(netId,plate) or tvRP.hasKey(carName, plate) or (vehicleClass == 18 and (tvRP.isCop() or tvRP.isMedic())) then
            local locked = GetVehicleDoorLockStatus(vehicle) >= 2
            if locked then -- unlock
              SetBoatAnchor(vehicle, false)
              vRPserver.serverVehicleDoorLocks({netId, 1})
              lockToggleAnim()
              tvRP.notify("Vehicle unlocked.")
              TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4, 'unlock', 0.2)
            else -- lock
              SetBoatAnchor(vehicle, true)
              SetVehicleDoorShut(vehicle, 0, false)
              SetVehicleDoorShut(vehicle, 1, false)
              SetVehicleDoorShut(vehicle, 2, false)
              SetVehicleDoorShut(vehicle, 3, false)
              vRPserver.serverVehicleDoorLocks({netId, 2})
              lockToggleAnim()
              tvRP.notify("Vehicle locked.")
              TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4, 'lock', 0.2)
            end
          end
        end
      end
    end
  end
end

-- Lock animations for vehicles
function lockToggleAnim()
  if not tvRP.isHandcuffed() and not tvRP.isInComa() then
    tvRP.playAnim(true, {{"anim@mp_player_intmenu@key_fob@", "fob_click", 1}}, false)
    Citizen.Wait(500)
  end
end

-- Only active for non medics
local emsVehiclesBlacklist = cfgVehicles.emsVehiclesBlacklist

local airVehicles = cfgVehicles.airVehicles

local carblacklist = cfgVehicles.carblacklist

local restrictedNotified = false
pilotlicense = false
driverschool = false

function tvRP.set_driverschool(completed)
   driverschool = completed
end
function tvRP.set_pilotlicense(completed)
   pilotlicense = completed
end

-- Check the vehicle player is driving
-- Check for licenses and blacklists
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPed = PlayerPedId()
    if playerPed then
      local veh = GetVehiclePedIsIn(playerPed, false)
      if veh then
        checkCar(veh, playerPed)
      end
    end
  end
end)

-- Removed and replaced with event based license handling
-- Update license status based on server info.
--Citizen.CreateThread(function()
--  Citizen.Wait(10000)
--  while true do
--    vRPserver.getPlayerLicense_client({"pilotlicense"}, function(has_license)
--      if has_license ~= nil then
--        if(has_license == 1) then
--          pilotlicense = true
--        else
--          pilotlicense = false
--        end
--      end
--    end)
--
--    vRPserver.getPlayerLicense_client({"driverschool"}, function(has_license)
--      if has_license ~= nil then
--        if(has_license == 1) then
--          driverschool = true
--        else
--          driverschool = false
--        end
--      end
--    end)
--    Citizen.Wait(60000)
--  end
--end)

function checkCar(car,ped)
  if car ~= 0 then
    carModel = GetEntityModel(car)
    carName = GetDisplayNameFromVehicleModel(carModel)
    local vehicleClass = GetVehicleClass(car)
    if vehicleClass ~= 13 then --exempt all bicycles
      if not driverschool and carName ~= "DILETTANTE" then
        if GetPedInVehicleSeat(car, -1) == ped then
          --SetVehicleForwardSpeed(car,0.0)
          --if not restrictedNotified then
          --  if not driverschool then
          --    tvRP.notify("You're not sure how to drive this vehicle. You should attend driving school.")
          --  else
          --    tvRP.notify("The security system in this vehicle has disabled the engine")
          --  end
          --
          --  restrictedNotified = true
          --  SetTimeout(10000, function()
          --    restrictedNotified = false
          --  end)
          --end
        end
      elseif carName == "Kart3" then
        TriggerEvent("izone:isPlayerInZone", "gokart2", function(cb)
          if cb ~= nil and not cb then
            tvRP.notify("Bye bye go kart")
            local nid = NetworkGetNetworkIdFromEntity(car)
            --SetEntityAsMissionEntity(car, true, true)
            --DeleteVehicle(car)
            vRPserver.deleteVehicle_sv({nid})
          end
        end)
      end
    end
  end
end

function tvRP.isCarBlacklisted(model, class)

  --if not driverschool and class ~= 13 then
  --  return true
  --end

  if carblacklist[model] then
    return true
  end

  if airVehicles[model] and not pilotlicense then
    return true
  end

  if not tvRP.isMedic() and not tvRP.isCop() and not tvRP.isAdmin() then
    if emsVehiclesBlacklist[model] then
      return true
    end
  end

  return false
end

-- Blowup a player when a speed bomb event occurs
-- TODO refactor into vRP function for later uses
local function detonatePlayer(broadcast)
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(PlayerPedId())
	AddOwnedExplosion(playerPed, pos.x, pos.y, pos.z, 0, 1.0, true, false, 1.0)
	if broadcast then
    TriggerEvent('blrp_core:client:prepareAlert', {
      service_name = 'Police',
      coords = pos,
      badge = '911',
      badge_style = 'danger',
      msg = 'Explosion heard by citizens'
    })
	end
end

-- thread to monitor speedbomb event
Citizen.CreateThread(function()
	local timeout = 1000
	local bombarmed = false
  while true do
    Citizen.Wait(timeout)
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(PlayerPedId())
		if IsPedInAnyVehicle(playerPed, false) then
			local veh = GetVehiclePedIsIn(playerPed, false)
			if (GetPedInVehicleSeat(veh, -1) == playerPed) then
				local speed = math.ceil(GetEntitySpeed(veh) * 2.236936)
				local speedbomb_status = DecorGetInt(veh, "SpeedBomb")
				if speedbomb_status ~= nil and speedbomb_status > 0 then
					timeout = 0
					if speedbomb_status == 1 then
						if speed > 50 then
							vRPserver.broadcastSpatializedSound({"DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS","Hack_Success",pos.x, pos.y, pos.z,10})
							tvRP.notify("SpeedBomb Activated. Stay above 50mph!")
							DecorSetInt(veh, "SpeedBomb", 2)
							bombarmed = true
						end
					elseif speedbomb_status == 2 then
						tvRP.missionText("A Speed Bomb is active on this vehicle!")
						if speed < 50 then
							DecorSetInt(veh, "SpeedBomb", 3)
							bombarmed = false
							detonatePlayer(true)
						end
					else
						timeout = 1000
					end
				end
			end
		elseif bombarmed then
			bombarmed = false
			detonatePlayer(true)
		end
  end
end)

-- Check if player has access to enter vehicle. If no (ex. NPC parked vehicle)
-- door will be locked.
local lastLockCheckVeh = nil

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = PlayerPedId()
    local veh = GetVehiclePedIsTryingToEnter(player)
    if veh ~= nil and veh ~= 0 and lastLockCheckVeh ~= veh then
      vehicleLocksCheck(veh)
      lastLockCheckVeh = veh
    end
  end
end)

function vehicleLocksCheck(veh)
  if DoesEntityExist(veh) and not IsEntityAMissionEntity(veh) then
    SetVehicleEngineOn(veh, false, true, true)
    local netId = NetworkGetNetworkIdFromEntity(veh)
    local veh_hash = GetEntityModel(veh)
    local protected = false
    local lock = GetVehicleDoorLockStatus(veh)
    local player_owned = false
    if emergency_vehicles[tostring(veh_hash)] then
      protected = true
      player_owned,vtype,name,registration = tvRP.getNearestOwnedVehicle(4)
    end
    if airVehicles[tostring(veh_hash)] then
      protected = true
      player_owned,vtype,name,registration = tvRP.getNearestOwnedVehicle(4)
    end
    if (lock ~= 0 and not DecorGetBool(veh,"lockpicked")) or (protected and not player_owned) then
        vRPserver.serverVehicleDoorLocks({netId, 2})
    end

    local pedd = GetPedInVehicleSeat(veh, -1)

    if pedd then
      if tvRP.isCop() then
        SetPedCanBeDraggedOut(pedd, true)
      else
        SetPedCanBeDraggedOut(pedd, false)
      end
    end
  end
end


local locpicking_inProgress = false

function tvRP.break_carlock()
  local nveh = GetClosestVehicle(3)
  local nveh_hash = GetEntityModel(nveh)
  local protected = false
  if emergency_vehicles[nveh_hash] or airVehicles[nveh_hash] then
    protected = true
  end
  if nveh ~= 0 and nveh ~= -1 and not IsEntityAMissionEntity(nveh) and not protected then -- only lockpick npc cars
    tvRP.notify("Picking door lock.")
    SetTimeout(cfg.lockpick_time * 1000, function()
      locpicking_inProgress = false
    end)
    locpicking_inProgress = true
    lockpickingThread(nveh)
  else
    tvRP.notify("This vehicle cannot be lockpicked.")
  end
end

function lockpickingThread(nveh)
  Citizen.CreateThread(function()
    local cancelled = false
    local xa,ya,za = tvRP.getPosition()
    while locpicking_inProgress do
      Citizen.Wait(3000)
      tvRP.playAnim(true,{{"mp_common_heist", "pick_door", 1}},false)
      local nveh2 = GetClosestVehicle(3)
      if nveh ~= nveh2 and nveh2 ~= -1 then
        locpicking_inProgress = false
        cancelled = true
      end
    end
    if not cancelled then
      local netId = NetworkGetNetworkIdFromEntity(nveh)
      vRPserver.serverVehicleDoorLocks({netId, 0})
      tvRP.notify("Door lock picked.")
      DecorSetBool(nveh,"lockpicked",true)
      StartVehicleAlarm(nveh) -- start car alarm
      SetTimeout(cfg.caralarm_timeout * 1000, function()
        SetVehicleAlarm(nveh,false)
      end)
    else
      tvRP.notify("Lockpicking Process Cancelled.")
    end
  end)
end

function tvRP.GetVehicleInDirection(coordFrom, coordTo)
  local rayHandle = StartShapeTestRay(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 2, PlayerPedId(), 0)
  local a, b, c, d, vehicle = GetShapeTestResult(rayHandle)
  return vehicle
end

local inDriveTest = false
RegisterNetEvent("vrp:driverteststatus")
AddEventHandler("vrp:driverteststatus", function(flag)
  TriggerEvent('core:client:registerCharacterState', 'in_driving_test', flag)
  inDriveTest = flag
end)

function tvRP.getDriveTestStatus()
  return inDriveTest
end


--Roll windows. Source https://forum.fivem.net/t/release-roll-windows/53660
local windowup = true

function tvRP.rollWindows()
  local playerPed = PlayerPedId()
  if IsPedInAnyVehicle(playerPed, false) then
    local playerCar = GetVehiclePedIsIn(playerPed, false)
    if (GetPedInVehicleSeat(playerCar, -1) == playerPed) then
      SetEntityAsMissionEntity(playerCar, true, true )

      if windowup then
        RollDownWindow(playerCar, 0)
        RollDownWindow(playerCar, 1)
        tvRP.notify("Windows down")
        windowup = false
      else
        RollUpWindow(playerCar, 0)
        RollUpWindow(playerCar, 1)
        tvRP.notify("Windows up")
        windowup = true
      end
    end
  end
end

local vehicleExploded = false

function tvRP.explodeCurrentVehicle(name)
  local vehicle = vehicles[characterNumber][name]
  if vehicle then
    if vehicleExploded then
      vehicleExploded = false
      for i=0,7 do
        SetVehicleDoorShut(vehicle[3], i, false, false)
      end
    else
      vehicleExploded = true
      for i=0,7 do
        SetVehicleDoorOpen(vehicle[3], i, false, false)
      end
    end
  end
end

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end

-----------------------------------------
-- Chat based car mod for LSFD and LSPD
-----------------------------------------
local approvedGarares = cfgVehicles.approvedGarares

function tvRP.isInProtectedOwnedVeh(veh)
  if veh ~= nil and veh ~= 0 then
    local protected = false
		local player_owned = false
    if emergency_vehicles[tostring(GetEntityModel(veh))] then
      protected = true
      player_owned,vtype,name,registration = tvRP.getNearestOwnedVehicle(4)
      return protected, player_owned
    end
    if airVehicles[tostring(GetEntityModel(veh))] then
      protected = true
      player_owned,vtype,name,registration = tvRP.getNearestOwnedVehicle(4)
      return protected, player_owned
    end
    return false, false
  end
  return false, false
end

AddEventHandler('chatMessage', function(player, name, message)
  if message == '/help' then
    TriggerClientEvent('blrp_help:show', player)
  end
end)
