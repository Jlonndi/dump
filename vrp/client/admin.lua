local noclip = false
local debug = false
local noclip_speed = 1.0
local speed = noclip_speed
local admin = false
local godmode = false
local noclipThreadRunning = false
local debugThreadRunning = false
local objindex = {}

local auto_waypoint = false

function tvRP.toggleAutoWaypoint()
  auto_waypoint = not auto_waypoint
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    if auto_waypoint then
      if IsWaypointActive() then
        tvRP.teleportWaypoint()
        Citizen.Wait(1000)
        ClearGpsPlayerWaypoint()
        SetWaypointOff()
        Citizen.Wait(1000)
      end
    end

  end
end)


function tvRP.toggleNoclip()
  noclip = not noclip
  local ped = PlayerPedId()
  if noclip then -- set
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
    SetEntityCollision(ped,false,false)
    startNoclipThread()
  else -- unset
    if not godmode then
      SetEntityInvincible(ped, false)
    end
    SetEntityVisible(ped, true, false)
    SetEntityCollision(ped,true,true)
  end
end

RegisterNetEvent('vrp:client:admin:toggleNoclipOnOnly')
AddEventHandler('vrp:client:admin:toggleNoclipOnOnly', function()
  tvRP.toggleNoclipOnOnly()
end)

function tvRP.toggleNoclipOnOnly()
  if not noclip then -- set
    noclip = true
    local ped = PlayerPedId()
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
    SetEntityCollision(ped,false,false)
    startNoclipThread()
  end
end

function tvRP.toggleGodMode(flag)
  local ped = PlayerPedId()
  godmode = flag
  if flag then -- set
    SetEntityInvincible(ped, true)
    vRPserver.varyHunger({-100})
    vRPserver.varyThirst({-100})
    TriggerEvent('mythic_hospital:client:RemoveBleed')
    TriggerEvent('mythic_hospital:client:ResetLimbs')
    TriggerEvent('mythic_hospital:client:ResetPlayer')
    godModeThread()
  else -- unset
    SetEntityInvincible(ped, false)
  end
end

function tvRP.getGodModeState()
  return godmode
end

function godModeThread()
  if tvRP.isAdmin() then
    Citizen.CreateThread(function()
      while godmode do
        Citizen.Wait(500)
        SetEntityHealth(PlayerPedId(),200)
      end
    end)
  end
end

function tvRP.isNoclip()
  return noclip
end

function tvRP.setAdmin(flag)
  admin = flag
  TriggerEvent("TokoVoip:toggleDebugAccess", flag)
  enableAdminMenu()
end

function tvRP.isAdmin()
  return admin
end

-- Teleport to waypoint is from mellotrainer
function tvRP.teleportWaypoint()
  local targetPed = PlayerPedId()
  if(IsPedInAnyVehicle(targetPed))then
    targetPed = GetVehiclePedIsUsing(targetPed)
  end

  if(not IsWaypointActive())then
    return
  end

  local waypointBlip = GetFirstBlipInfoId(8) -- 8 = Waypoint ID
  local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector()))

  -- Ensure Entity teleports above the ground
  local ground
  local groundFound = false
  local groundCheckHeights = {0.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0,450.0, 500.0, 550.0, 600.0, 650.0, 700.0, 750.0, 800.0}


  for i,height in ipairs(groundCheckHeights) do
    RequestCollisionAtCoord(x, y, height)
    Wait(0)
    SetEntityCoordsNoOffset(targetPed, x,y,height, 0, 0, 1)
    ground,z = GetGroundZFor_3dCoord(x,y,height)
    if(ground) then
      z = z + 3
      groundFound = true
      break;
    end
  end

  if(not groundFound)then
    z = 1000
    GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- Parachute
  end

  SetEntityCoordsNoOffset(targetPed, x,y,z, 0, 0, 1)
end

-- noclip/invisibility
function startNoclipThread()
  if not noclipThreadRunning then
    noclipThreadRunning = true
    Citizen.CreateThread(function()
      while noclip do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local x,y,z = tvRP.getPosition()
        local dx,dy,dz = tvRP.getCamDirection()

        if IsControlPressed(0,21) then
          speed = noclip_speed * 2.0
        end
        if IsControlReleased(0,21) then
          speed = noclip_speed
        end

        -- reset velocity
        SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

        -- forward
        if IsControlPressed(0,32) then -- MOVE UP
          x = x+speed*dx
          y = y+speed*dy
          z = z+speed*dz
        end

        -- backward
        if IsControlPressed(0,269) then -- MOVE DOWN
          x = x-speed*dx
          y = y-speed*dy
          z = z-speed*dz
        end

        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
      end
      noclipThreadRunning = false
    end)
    Citizen.CreateThread(function()
      while noclip do
        Citizen.Wait(2500)
        SetEntityVisible(PlayerPedId(), false, false)
        SetEntityCollision(PlayerPedId(),false,false)
      end
      SetEntityVisible(PlayerPedId(), true, false)
      SetEntityCollision(PlayerPedId(),true,true)
    end)
  end
end

function PopulateObjectIndex()
  local handle, obj = FindFirstObject()
  local finished = false
  repeat
    if not IsEntityDead(obj) then
    	objindex[obj] = true
    end
    finished, obj = FindNextObject(handle)
  until not finished
  EndFindObject(handle)
end

-- debug
function startDebugThread()
  if not debugThreadRunning then
    debugThreadRunning = true
    Citizen.CreateThread(function()
      while debug do
        Citizen.Wait(0)
					local playerped = PlayerPedId()
					local playerpedPos = GetEntityCoords(playerped, nil)
					for entity, alive in pairs(objindex) do
            local entityPos = GetEntityCoords(entity)
            if #(vector3(entityPos.x,entityPos.y,entityPos.z)-vector3(playerpedPos.x,playerpedPos.y,playerpedPos.z)) < 2.2001 then
							local posx,posy,posz = table.unpack(GetEntityCoords(entity, nil))
							tvRP.drawText3Ds(GetEntityModel(entity),posx,posy,posz+1.0)
						end
					end
      end
      debugThreadRunning = false
    end)

		Citizen.CreateThread(function()
      while debug do
				Citizen.Wait(2000)
				PopulateObjectIndex()
      end
      debugThreadRunning = false
    end)
  end
end

function tvRP.toggleDebug()
  debug = not debug
  if debug then -- set
    startDebugThread()
  end
end

RegisterNetEvent('vrp:client:admin:adminSpawnVehicle')
AddEventHandler('vrp:client:admin:adminSpawnVehicle', function(name)
  tvRP.adminSpawnVehicle(name)
end)

function tvRP.adminSpawnVehicle(name)
  if name ~= nil and name ~= "" then
    local mhash = GetHashKey(name)
    print(mhash)
    local i = 0
    while not HasModelLoaded(mhash) and i < 10000 do
      RequestModel(mhash)
      Citizen.Wait(10)
      i = i+1
    end
    if HasModelLoaded(mhash) then
      local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
      local veh = CreateVehicle(mhash, x,y,z+0.5, 0.0, true, false)
      netID = NetworkGetNetworkIdFromEntity(veh)
      SetNetworkIdCanMigrate(netID,true)
      NetworkRegisterEntityAsNetworked(netID)
      SetNetworkIdExistsOnAllMachines(netID,true)
      NetworkRequestControlOfEntity(veh)
      SetVehicleEngineOn(veh, true, true)
      SetVehicleDirtLevel(veh,0.0)
      SetVehicleOnGroundProperly(veh)
      SetPedIntoVehicle(PlayerPedId(),veh,-1) -- put player inside
      SetModelAsNoLongerNeeded(mhash)
      local blip = AddBlipForEntity(veh)
      SetBlipSprite(blip, 225)
      TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(veh), GetDisplayNameFromVehicleModel(GetEntityModel(veh)))
      plate = GetVehicleNumberPlateText(veh)
      args = tvRP.stringsplit(plate)
      plate = args[1]
      tvRP.addPlateToList(plate, name, netID)
    end
  end
end

function PopulateObjectIndex()
  local handle, obj = FindFirstObject()
  local finished = false
  repeat
    if not IsEntityDead(obj) then
    	objindex[obj] = true
    end
    finished, obj = FindNextObject(handle)
  until not finished
  EndFindObject(handle)
end
