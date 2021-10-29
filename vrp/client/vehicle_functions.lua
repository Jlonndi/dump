local cfgGarages = module("cfg/garages")

-- 0 = unlocked
-- 1 = unlocked
-- 2 = locked
-- 3 = LockedForPlayer
-- 4 = StickPlayerInside
-- 7 = CanBeBrokenInto
-- 8 = CanBeBrokenIntoPersist
-- 10 = CannotBeTriedToEnter
local lastLockPickVehTry = nil
local vehiclePickInProgress = false

function tvRP.useLockPick()
  if not vehiclePickInProgress then
    vehiclePickInProgress = true
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
      local targetVehicle = GetClosestVehicle(2)
      if targetVehicle ~= nil and IsVehicleStopped(targetVehicle) and targetVehicle ~= -1 then
        local vehClass = GetVehicleClass(targetVehicle)
        local protected, player_owned = tvRP.isInProtectedOwnedVeh(targetVehicle)
        if not protected and not player_owned and vehClass ~= 19 and vehClass ~= 18 and vehClass ~= 15 and vehClass ~= 16 then
          if lastLockPickVehTry ~= targetVehicle then
            lastLockPickVehTry = targetVehicle
            exports['mythic_progbar']:Progress({
              name = "init_lockpick",
              duration = 10000,
              label = "Preparing Tools",
              useWhileDead = false,
              canCancel = true,
              controlDisables = {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
              },
              animation = {
                animDict = "mp_common_heist",
                anim = "pick_door",
                flags = 49,
              },
            }, function(status)
              if not status then
                init_lockpick(targetVehicle)
              else
                vehiclePickInProgress = false
                lastLockPickVehTry = nil
              end
            end)
          else
            init_lockpick(targetVehicle)
          end
        else
          vehiclePickInProgress = false
          tvRP.notify("You lack the skills to lockpick this vehicle.")
        end
      else
        vehiclePickInProgress = false
      end
    else
      local targetVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
      if GetPedInVehicleSeat(targetVehicle, -1) == PlayerPedId() then
        local protected, player_owned = tvRP.isInProtectedOwnedVeh(targetVehicle)
        if not protected and not player_owned then
          init_hotwire(targetVehicle)
        else
          vehiclePickInProgress = false
        end
      else
        vehiclePickInProgress = false
      end
    end
  else
    tvRP.notify("You are already performing this action")
  end
end

local netIdVehcileTarget = 0
local lockpickHotwireAttempts = 0

function init_lockpick(vehicle)
  local netIdid = NetworkGetNetworkIdFromEntity(vehicle)

  if netIdid ~= netIdVehcileTarget then
    netIdVehcileTarget = netIdid
    lockpickHotwireAttempts = 0
  end

  local vehicleClass = GetVehicleClass(vehicle)
  local vehiclePlate = GetVehicleNumberPlateText(vehicle)
  local vehicleModelName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
  local vehicleModelNameLocalised = GetLabelText(vehicleModelName)

  if not vehicleModelNameLocalised or vehicleModelNameLocalised == 'NULL' then
    vehicleModelNameLocalised = string.lower(vehicleModelName)
  end

  TriggerEvent('lockpick:client:startLockpickClient', { amount = 5 }, function(was_successful)
    vehiclePickInProgress = false
    if was_successful then
      local alarmTime = 10
      local alertCops = false
      local randNum = math.random(1, 100)

      -- Vehicle is a supercar, sports car, or the alert roll succeeded
      if vehicleClass == 7 or vehicleClass == 6 or randNum > 65 then
        alertCops = true
      end

      local netId = NetworkGetNetworkIdFromEntity(vehicle)
      vRPserver.serverVehicleDoorLocks({ netId, 1 })
      DecorSetBool(vehicle, "lockpicked", true)
      DecorSetBool(vehicle, "hotwired", false)
      tvRP.notify("Lockpick Succeeded")
      SetVehicleAlarm(vehicle, true)
      SetVehicleAlarmTimeLeft(vehicle, alarmTime * 1000)
      netIdVehcileTarget = 0
      lockpickHotwireAttempts = 0

      if alertCops then
        local msg = "A vehicle is being broken into<br/>"
        msg = msg .. '<i class="fad fa-fw fa-rectangle-wide"></i> ' .. vehiclePlate .. '<br/>'
        msg = msg .. '<i class="far fa-fw fa-car"></i> ' .. vehicleModelNameLocalised

        SetTimeout(math.random(5, 10) * 1000, function()
          TriggerEvent('blrp_core:client:prepareAlert', {
            service_name = 'Police',
            coords = GetEntityCoords(PlayerPedId(), true),
            badge = 'TIP',
            badge_style = 'warning',
            msg = msg,
            icon = 'fal fa-user-headset'
          })
        end)
      end
    else
      TriggerServerEvent('vrp:server:selfRemoveLockpick')
      tvRP.notify("Lockpick Failed")
    end
  end)
end

function init_hotwire(vehicle)
  if vehicle ~= nil then
    local netIdid = NetworkGetNetworkIdFromEntity(vehicle)
    if netIdid ~= netIdVehcileTarget then
      netIdVehcileTarget = netIdid
      lockpickHotwireAttempts = 0
    end

    exports['mythic_progbar']:Progress({
      name = "init_hotwire",
      duration = 25000,
      label = "Attempting to Hotwire",
      useWhileDead = false,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
      },
      animation = {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 49,
      },
    }, function(status)
      if not status then
        local odds = 35
        local randNum = math.random(1, 100)
        if odds > 0 then
          odds = odds - (lockpickHotwireAttempts * 5)
          if odds < 0 then
            odds = 0
          end
        end
        if randNum > odds then
          DecorSetBool(vehicle, "lockpicked", true)
          DecorSetBool(vehicle, "hotwired", true)
          local plate = GetVehicleNumberPlateText(vehicle)
          TriggerServerEvent('core:server:registerLocalVehicle', {
            registration = plate,
            network_id = NetworkGetNetworkIdFromEntity(vehicle),
            local_entity_id = veh,
            name = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),
            is_local = true,
            stolen_at_coords = GetEntityCoords(PlayerPedId())
          })
          tvRP.notify("Hotwire Succeeded")
          netIdVehcileTarget = 0
          lockpickHotwireAttempts = 0
        else
          lockpickHotwireAttempts = lockpickHotwireAttempts + 1
          tvRP.notify("Hotwire Failed")
        end
      else
        TriggerServerEvent('vrp:server:selfRemoveLockpick')
        tvRP.notify("Hotwire Failed")
      end
      vehiclePickInProgress = false
    end)
  end
end


------------------------------------------------------------------
-- Toggle engine if you own it
-- https://github.com/ToastinYou/LeaveEngineRunning
------------------------------------------------------------------
local engineVehicles = {}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if veh ~= nil and veh ~= 0 then
      if GetSeatPedIsTryingToEnter(PlayerPedId()) == -1 then
        local net_id = NetworkGetNetworkIdFromEntity(veh)
        if not table.contains(engineVehicles, net_id) then
          table.insert(engineVehicles, { net_id, IsVehicleEngineOn(veh) })
        end
      elseif IsPedInAnyVehicle(PlayerPedId(), false) then
        local net_id = NetworkGetNetworkIdFromEntity(veh)
        if not table.contains(engineVehicles, net_id) then
          table.insert(engineVehicles, { net_id, IsVehicleEngineOn(veh) })
        end
      end
      for i, vehicle in ipairs(engineVehicles) do
        local local_id = NetworkGetEntityFromNetworkId(vehicle[1])
        if DoesEntityExist(local_id) then
          if (GetPedInVehicleSeat(local_id, -1) == PlayerPedId()) or IsVehicleSeatFree(local_id, -1) then
            if GetVehicleEngineHealth(local_id) >= 25.0 + 1 then
              local engine_state = vehicle[2]
              SetVehicleEngineOn(local_id, engine_state, true, false)
            else
              SetVehicleUndriveable(local_id, true)
            end
          end
        else
          -- We shouldnt remove it because of infinity one sync
          -- table.remove(engineVehicles, i)
        end
      end
      if IsControlJustPressed(0, 47) and (GetVehicleClass(veh) ~= 15 and GetVehicleClass(veh) ~= 16) then
        tvRP.toggleEngine()
      elseif IsControlJustPressed(0, 182) and (GetVehicleClass(veh) == 15 or GetVehicleClass(veh) == 16) then
        tvRP.toggleEngine()
      end
    end
  end
end)

function tvRP.toggleEngine()
  local veh
  local StateIndex
  local vehNetId = 0
  for i, vehicle in ipairs(engineVehicles) do
    local local_id = GetVehiclePedIsIn(PlayerPedId(), false)
    local net_id = NetworkGetNetworkIdFromEntity(local_id)
    if vehicle[1] == net_id then
      veh = local_id
      StateIndex = i
      vehNetId = net_id
      break
    end
  end
  local plate = GetVehicleNumberPlateText(veh)
  local carModel = GetEntityModel(veh)
  local carName = GetDisplayNameFromVehicleModel(carModel)
  args = tvRP.stringsplit(plate)
  if args ~= nil then
    plate = args[1]
    if IsPedInAnyVehicle(PlayerPedId(), false) then
      if (GetPedInVehicleSeat(veh, -1) == PlayerPedId()) then
        if
          tvRP.hasKey(carName, plate) or
          tvRP.getIsVehicleOwnerByNetId(vehNetId, plate) or
          DecorGetBool(veh, "hotwired") or
          carModel == `kart3` or
          (GetVehicleClass(veh) == 18 and (tvRP.isCop() or tvRP.isMedic()))
        then
          engineVehicles[StateIndex][2] = not GetIsVehicleEngineRunning(veh)
          local msg = nil
          if engineVehicles[StateIndex][2] then
            tvRP.notify("Engine turned ON!")
          else
            tvRP.notify("Engine turned OFF!")
          end
        else
          tvRP.notify("You don't have the keys to this vehicle.")
        end
      end
    end
  end
end

local selectingTargetThreadActive = false
local checkCanTargetVehicleLoopCount = 0

RegisterNetEvent('vrp:client:selectTargetVehicle')
AddEventHandler('vrp:client:selectTargetVehicle', function(range, callback)
  tvRP.selectTargetVehicle(range, callback)
end)

function tvRP.selectTargetVehicle(range, cbr)
  local task = cbr
  if cbr == nil then
    task = function()
    end
  end
  selectingTargetThreadActive = false

  local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0)
  local coords = GetEntityCoords(PlayerPedId())
  local rayHandle = CastRayPointToPoint(coords["x"], coords["y"], coords["z"], entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
  local a, b, c, d, targetVehicle = GetRaycastResult(rayHandle)
  local closestVehicles = {}

  if targetVehicle ~= -1 and targetVehicle ~= 0 and targetVehicle ~= nil then
    table.insert(closestVehicles, targetVehicle)
  else
    for _, i in ipairs(GetVehicles()) do
      if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(i)) < range then
        if (HasEntityClearLosToEntity(PlayerPedId(), i, 17) and IsEntityVisible(i)) then
          table.insert(closestVehicles, i)
        end
      end
    end
  end

  local arrayPos = 1
  local arraySize = #closestVehicles
  local activeMarkerPos = nil
  if arraySize > 0 then
    selectingTargetThreadActive = true
    arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, 1)
    if arrayPos ~= -1 and arrayPos ~= nil then
      if arraySize == 1 then
        if (DoesEntityExist(closestVehicles[arrayPos]) and HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
          local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestVehicles[arrayPos]))
          if distanceCheck < range then
            selectingTargetThreadActive = false
            task(closestVehicles[arrayPos])
          end
        end
      else
        activeMarkerPos = GetEntityCoords(closestVehicles[arrayPos])
        while selectingTargetThreadActive do
          Citizen.Wait(0)
          if arrayPos ~= nil then
            if IsControlJustReleased(0, 177) then
              -- backspace
              selectingTargetThreadActive = false
              task(-1)
            elseif IsControlJustReleased(0, 174) then
              -- Left arrow
              -- Cycle left in array <
              arrayPos = arrayPos - 1
              if arrayPos < 1 then
                arrayPos = arraySize
              end
              arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, -1)
              if arrayPos == -1 then
                selectingTargetThreadActive = false
                task(-1)
              end
            elseif IsControlJustReleased(0, 175) then
              -- Right arrow
              -- Cycle right in array >
              arrayPos = arrayPos + 1
              if arrayPos > arraySize then
                arrayPos = 1
              end
              arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, 1)
              if arrayPos == -1 then
                selectingTargetThreadActive = false
                task(-1)
              end
            elseif IsControlJustReleased(0, 176) then
              -- enter
              if (HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
                local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestVehicles[arrayPos]))
                if distanceCheck < range then
                  selectingTargetThreadActive = false
                  task(closestVehicles[arrayPos])
                end
              end
            end
            if activeMarkerPos ~= nil then
              if (HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
                activeMarkerPos = GetEntityCoords(closestVehicles[arrayPos])
                local distanceCheck = #(GetEntityCoords(PlayerPedId()) - activeMarkerPos)
                if distanceCheck < range then
                  DrawMarker(20, activeMarkerPos.x, activeMarkerPos.y, activeMarkerPos.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 202, 207, 203, 175, 1, 1, 2, 0, 0, 0, 0)
                end
              end
            end
          else
            selectingTargetThreadActive = false
            task(-1)
          end
        end
        if selectingTargetThreadActive then
          selectingTargetThreadActive = false
          task(-1)
        end
      end
    else
      selectingTargetThreadActive = false
      task(-1)
    end
  else
    selectingTargetThreadActive = false
    task(-1)
  end
end

local vehicle_names = {}

Citizen.CreateThread(function()
  Citizen.Wait(5)
  for k, v in pairs(cfgGarages.garage_types) do
    for name, v2 in pairs(v) do
      vehicle_names[GetHashKey(name)] = { name, k }
    end
  end
end)

function tvRP.getNearestVehicleInfo(range)

  selectingTargetThreadActive = false
  local vehicle = -1

  local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0)
  local coords = GetEntityCoords(PlayerPedId())
  local rayHandle = CastRayPointToPoint(coords["x"], coords["y"], coords["z"], entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
  local a, b, c, d, targetVehicle = GetRaycastResult(rayHandle)
  local closestVehicles = {}

  if targetVehicle ~= -1 and targetVehicle ~= 0 and targetVehicle ~= nil then
    table.insert(closestVehicles, targetVehicle)
  else
    for _, i in ipairs(GetVehicles()) do
      if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(i)) < range then
        if (HasEntityClearLosToEntity(PlayerPedId(), i, 17) and IsEntityVisible(i)) then
          table.insert(closestVehicles, i)
        end
      end
    end
  end

  local arrayPos = 1
  local arraySize = #closestVehicles
  local activeMarkerPos = nil
  if arraySize > 0 then
    selectingTargetThreadActive = true
    arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, 1)
    if arrayPos ~= -1 and arrayPos ~= nil then
      if arraySize == 1 then
        if (HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
          local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestVehicles[arrayPos]))
          if distanceCheck < range then
            selectingTargetThreadActive = false
            vehicle = closestVehicles[arrayPos]
          end
        end
      else
        activeMarkerPos = GetEntityCoords(closestVehicles[arrayPos])
        while selectingTargetThreadActive do
          Citizen.Wait(0)
          if arrayPos ~= nil then
            if IsControlJustReleased(0, 177) then
              -- backspace
              selectingTargetThreadActive = false
              vehicle = -1
            elseif IsControlJustReleased(0, 174) then
              -- Left arrow
              -- Cycle left in array <
              arrayPos = arrayPos - 1
              if arrayPos < 1 then
                arrayPos = arraySize
              end
              arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, -1)
              if arrayPos == -1 then
                selectingTargetThreadActive = false
                vehicle = -1
              end
            elseif IsControlJustReleased(0, 175) then
              -- Right arrow
              -- Cycle right in array >
              arrayPos = arrayPos + 1
              if arrayPos > arraySize then
                arrayPos = 1
              end
              arrayPos = checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, 1)
              if arrayPos == -1 then
                selectingTargetThreadActive = false
                vehicle = -1
              end
            elseif IsControlJustReleased(0, 176) then
              -- enter
              if (HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
                local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestVehicles[arrayPos]))
                if distanceCheck < range then
                  selectingTargetThreadActive = false
                  vehicle = closestVehicles[arrayPos]
                end
              end
            end
            if activeMarkerPos ~= nil then
              if (HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos]) and DoesEntityExist(closestVehicles[arrayPos])) then
                activeMarkerPos = GetEntityCoords(closestVehicles[arrayPos])
                local distanceCheck = #(GetEntityCoords(PlayerPedId()) - activeMarkerPos)
                if distanceCheck < range then
                  DrawMarker(20, activeMarkerPos.x, activeMarkerPos.y, activeMarkerPos.z + 1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.2, 202, 207, 203, 175, 1, 1, 2, 0, 0, 0, 0)
                end
              end
            end
          else
            selectingTargetThreadActive = false
            vehicle = -1
          end
        end
        if selectingTargetThreadActive then
          selectingTargetThreadActive = false
          vehicle = -1
        end
      end
    else
      selectingTargetThreadActive = false
      vehicle = -1
    end
  else
    selectingTargetThreadActive = false
    vehicle = -1
  end

  if vehicle and vehicle ~= -1 then
    local plate = GetVehicleNumberPlateText(vehicle)
    args = tvRP.stringsplit(plate)
    if args ~= nil then
      plate = args[1]
    end
    local carModel = GetEntityModel(vehicle)
    local carName = vehicle_names[carModel][1]
    if plate ~= nil and carName ~= nil then
      return plate, carName, vehicle
    end
    return -1, -1
  else
    return -1, -1
  end
end

function checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, direction)
  -- direction will either be 1 or -1
  if selectingTargetThreadActive then
    if (DoesEntityExist(closestVehicles[arrayPos]) and HasEntityClearLosToEntity(PlayerPedId(), closestVehicles[arrayPos], 17) and IsEntityVisible(closestVehicles[arrayPos])) then
      return arrayPos
    else
      if direction == nil then
        direction = 1
      end
      if direction == 1 then
        arrayPos = arrayPos + 1
        if arrayPos > arraySize then
          arrayPos = 1
        end
      else
        arrayPos = arrayPos - 1
        if arrayPos < 1 then
          arrayPos = arraySize
        end
      end
      checkCanTargetVehicleLoopCount = checkCanTargetVehicleLoopCount + 1
      if checkCanTargetVehicleLoopCount <= arraySize then
        checkCanTargetVehicle(closestVehicles, arrayPos, arraySize, direction)
      else
        return -1
      end
    end
  end
end

function tvRP.changePlateNumber(targetVeh, registration)
  if targetVeh ~= nil and registration ~= nil then
    SetVehicleNumberPlateText(targetVeh, registration)
  end
end
