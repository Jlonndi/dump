--[[
local dickheaddebug = false
local drawRange = 100.0
local core = nil

Citizen.CreateThread(function()
  TriggerEvent('core:client:require', function(pointer)
    core = pointer
  end)
end)

RegisterCommand("debug", function()
  dickheaddebug = not dickheaddebug
  displayDebug()
  if dickheaddebug then
    print("Debug: Enabled")
  else
    print("Debug: Disabled")
  end
end)

RegisterCommand("range", function(source, args)
  drawRange = tonumber(args[1]) or 0
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(0)
  SetTextProportional(0)
  SetTextScale(0.25, 0.25)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function DrawText3Ds(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  SetTextScale(0.4, 0.4)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  SetTextDropShadow()
  SetTextOutline()
  AddTextComponentString(text)
  DrawText(_x,_y)
end

function GetVehicle()
  local playerped = GetPlayerPed(-1)
  local playerCoords = GetEntityCoords(playerped)
  local handle, ped = FindFirstVehicle()
  local ownerId = GetPlayerServerId(NetworkGetEntityOwner(ped))
  local ownerName = GetPlayerName(NetworkGetEntityOwner(ped))
  local success
  local rped = nil
  repeat
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
    local minDim, maxDim = GetModelDimensions(GetEntityModel(ped))
    local height = maxDim.z - minDim.z
    if canPedBeUsed(ped) and distance < drawRange then
      distanceFrom = distance
      rped = ped
      local driver = GetPedInVehicleSeat(ped, -1)
      if not DoesEntityExist(driver) and NetworkGetEntityIsNetworked(ped) then
        DrawText3Ds(pos.x, pos.y, pos.z + height, "~r~"..NetworkGetNetworkIdFromEntity(ped).." | "..GetPlayerName(NetworkGetEntityOwner(ped)))
      else
        DrawText3Ds(pos.x, pos.y, pos.z + height, "~g~"..NetworkGetNetworkIdFromEntity(ped).." | "..GetPlayerName(NetworkGetEntityOwner(ped)).."\nDriver: "..NetworkGetNetworkIdFromEntity(driver))
      end
    end
    success, ped = FindNextVehicle(handle)
  until not success
  EndFindVehicle(handle)
  return rped
end

function GetObject()
  local playerped = GetPlayerPed(-1)
  local playerCoords = GetEntityCoords(playerped)
  local handle, ped = FindFirstObject()
  local success
  local rped = nil
  local distanceFrom
  repeat
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
    if distance < 10.0 then
      distanceFrom = distance
      rped = ped
      DrawText3Ds(pos["x"],pos["y"],pos["z"], ped .. " | Model: " .. GetEntityModel(ped) .. "\n X: " .. pos["x"] .. " Y: " .. pos["y"] .. " Z: " .. pos["z"] )
    end

    success, ped = FindNextObject(handle)
  until not success
  EndFindObject(handle)
  return rped
end

function getNPC()
  local playerped = GetPlayerPed(-1)
  local playerCoords = GetEntityCoords(playerped)
  local handle, ped = FindFirstPed()
  local ownerId = GetPlayerServerId(NetworkGetEntityOwner(ped))
  local ownerName = GetPlayerName(NetworkGetEntityOwner(ped))
  local success
  local rped = nil
  repeat
    local pos = GetEntityCoords(ped)
    local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
    if canPedBeUsed(ped) and distance < drawRange then
      local minDim, maxDim = GetModelDimensions(GetEntityModel(ped))
      local height = maxDim.z - minDim.z + 2.0
      distanceFrom = distance
      rped = ped

      if IsPedAPlayer(ped) then
        local player = NetworkGetPlayerIndexFromPed(ped)
        DrawText3Ds(pos["x"],pos["y"],pos["z"] + height, "~b~"..NetworkGetNetworkIdFromEntity(ped).." | PLAYER: "..GetPlayerName(player) .. " ("..player..")")
      else
        DrawText3Ds(pos["x"],pos["y"],pos["z"] + height, "~b~"..NetworkGetNetworkIdFromEntity(ped).." | "..ownerName.." ("..ownerId..")")
      end

    end
    success, ped = FindNextPed(handle)
  until not success
  EndFindPed(handle)
  return rped
end

function canPedBeUsed(ped)
  if ped == nil then
    return false
  end
  if ped == GetPlayerPed(-1) then
    return false
  end
  if not DoesEntityExist(ped) then
    return false
  end
  return true
end

function displayDebug()
  Citizen.CreateThread(function()

    while dickheaddebug do
      Citizen.Wait(1)
      local pos = GetEntityCoords(GetPlayerPed(-1))

      local forPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.0, 0.0)
      local backPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -1.0, 0.0)
      local LPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 1.0, 0.0, 0.0)
      local RPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -1.0, 0.0, 0.0)

      local forPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 2.0, 0.0)
      local backPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -2.0, 0.0)
      local LPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 2.0, 0.0, 0.0)
      local RPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -2.0, 0.0, 0.0)

      local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

      if false then
        drawTxt(0.8, 0.50, 0.4,0.4,0.30, "Heading: " .. GetEntityHeading(GetPlayerPed(-1)), 55, 155, 55, 255)
        drawTxt(0.8, 0.52, 0.4,0.4,0.30, "Coords: " .. pos, 55, 155, 55, 255)
        drawTxt(0.8, 0.56, 0.4,0.4,0.30, "Health: " .. GetEntityHealth(GetPlayerPed(-1)), 55, 155, 55, 255)
        drawTxt(0.8, 0.60, 0.4,0.4,0.30, "Model: " .. GetEntityModel(GetPlayerPed(-1)), 55, 155, 55, 255)
        drawTxt(0.8, 0.62, 0.4,0.4,0.30, "Speed: " .. GetEntitySpeed(GetPlayerPed(-1)), 55, 155, 55, 255)
      end

      DrawLine(pos,forPos, 255,0,0,115)
      DrawLine(pos,backPos, 255,0,0,115)

      DrawLine(pos,LPos, 255,255,0,115)
      DrawLine(pos,RPos, 255,255,0,115)

      DrawLine(forPos,forPos2, 255,0,255,115)
      DrawLine(backPos,backPos2, 255,0,255,115)

      DrawLine(LPos,LPos2, 255,255,255,115)
      DrawLine(RPos,RPos2, 255,255,255,115)

      local nearped = getNPC()

      local veh = GetVehicle()

      --local nearobj = GetObject()
    end
  end)
end

displayDebug()
]]--
