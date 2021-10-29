----Source: https://forum.fivem.net/t/release-scammers-script-collection-09-03-17/3313
local listOfPolice = {}
local listOfEMS = {}
local listOfDOC = {}
--
function tvRP.addToActivePolive(player)
  if player ~= nil then
    listOfPolice[player] = true
  end
end

function tvRP.removeToActivePolive(player)
  if player ~= nil then
    listOfPolice[player] = nil
  end
end

function tvRP.addToActiveEMS(player)
  if player ~= nil then
    listOfEMS[player] = true
  end
end

function tvRP.removeToActiveEMS(player)
  if player ~= nil then
    listOfEMS[player] = nil
  end
end

function tvRP.addToActiveDOC(player)
  if player ~= nil then
    listOfDOC[player] = true
  end
end

function tvRP.removeToActiveDOC(player)
  if player ~= nil then
    listOfDOC[player] = nil
  end
end
--
function tvRP.getMedicCount()
  local count = 0
  for k,v in pairs(listOfEMS) do
    count = count + 1
  end
  return count
end
--
function tvRP.getMedicCopCount()
  local count = 0
  for k,v in pairs(listOfEMS) do
    count = count + 1
  end
  for k,v in pairs(listOfPolice) do
    count = count + 1
  end
  return count
end

--Citizen.CreateThread(function()
--  while true do
--    Citizen.Wait(1)
--    -- show blips
--    if tvRP.isCop() or tvRP.isDoj() then
--      for k,v in pairs(listOfPolice) do
--        if v ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(k)) and GetPlayerFromServerId(k) ~= GetPlayerFromServerId(GetPlayerPed(-1)) then
--          local player = GetPlayerFromServerId(k)
--          local ped = GetPlayerPed(player)
--          blip = GetBlipFromEntity(ped)
--
--          -- BLIP STUFF --
--          if not DoesBlipExist(blip) then -- Add blip and create head display on player
--            blip = AddBlipForEntity(ped)
--            SetBlipSprite(blip, 1)
--            SetBlipColour(blip, 3)
--            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--          else -- update blip
--            veh = GetVehiclePedIsIn(ped, false)
--            blipSprite = GetBlipSprite(blip)
--            if not GetEntityHealth(ped) then -- dead
--              if blipSprite ~= 274 then
--                SetBlipSprite(blip, 274)
--                SetBlipColour(blip, 3)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
--              end
--            else
--              -- Remove leftover number
--              HideNumberOnBlip(blip)
--              if blipSprite ~= 1 then -- default blip
--                SetBlipSprite(blip, 1)
--                SetBlipColour(blip, 3)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--              end
--            end
--
--            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
--            SetBlipNameToPlayerName(blip, player) -- update blip name
--            SetBlipScale(blip,  0.85) -- set scale
--
--            -- set player alpha
--            if IsPauseMenuActive() then
--              SetBlipAlpha(blip, 255)
--            else
--              x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
--              x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
--              distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
--              -- Probably a way easier way to do this but whatever im an idiot
--              if distance < 0 then
--                distance = 0
--              elseif distance > 50 then
--                distance = 255
--              end
--              SetBlipAlpha(blip, distance)
--            end
--          end
--        end
--      end
--      for k3,v3 in pairs(listOfDOC) do
--        if v3 ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(k3)) and GetPlayerFromServerId(k) ~= GetPlayerFromServerId(GetPlayerPed(-1)) then
--          local player = GetPlayerFromServerId(k3)
--          local ped = GetPlayerPed(player)
--          blip = GetBlipFromEntity(ped)
--
--          -- BLIP STUFF --
--          if not DoesBlipExist(blip) then -- Add blip and create head display on player
--            blip = AddBlipForEntity(ped)
--            SetBlipSprite(blip, 1)
--            SetBlipColour(blip, 5)
--            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--          else -- update blip
--            veh = GetVehiclePedIsIn(ped, false)
--            blipSprite = GetBlipSprite(blip)
--            if not GetEntityHealth(ped) then -- dead
--              if blipSprite ~= 274 then
--                SetBlipSprite(blip, 274)
--                SetBlipColour(blip, 5)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
--              end
--            else
--              -- Remove leftover number
--              HideNumberOnBlip(blip)
--              if blipSprite ~= 1 then -- default blip
--                SetBlipSprite(blip, 1)
--                SetBlipColour(blip, 5)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--              end
--            end
--
--            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
--            SetBlipNameToPlayerName(blip, player) -- update blip name
--            SetBlipScale(blip,  0.85) -- set scale
--
--            -- set player alpha
--            if IsPauseMenuActive() then
--              SetBlipAlpha(blip, 255)
--            else
--              x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
--              x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
--              distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
--              -- Probably a way easier way to do this but whatever im an idiot
--              if distance < 0 then
--                distance = 0
--              elseif distance > 50 then
--                distance = 255
--              end
--              SetBlipAlpha(blip, distance)
--            end
--          end
--        end
--      end
--    end
--
--    if tvRP.isCop() or tvRP.isMedic() or tvRP.isDoj() then
--      for k2,v2 in pairs(listOfEMS) do
--        if v2 ~= nil and NetworkIsPlayerActive(GetPlayerFromServerId(k2)) and GetPlayerFromServerId(k2) ~= GetPlayerFromServerId(GetPlayerPed(-1)) then
--          local player = GetPlayerFromServerId(k2)
--          local ped = GetPlayerPed(player)
--          blip = GetBlipFromEntity(ped)
--
--          -- BLIP STUFF --
--          if not DoesBlipExist(blip) then -- Add blip and create head display on player
--            blip = AddBlipForEntity(ped)
--            SetBlipSprite(blip, 1)
--            SetBlipColour(blip, 1)
--            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--          else -- update blip
--            veh = GetVehiclePedIsIn(ped, false)
--            blipSprite = GetBlipSprite(blip)
--            if not GetEntityHealth(ped) then -- dead
--              if blipSprite ~= 274 then
--                SetBlipSprite(blip, 274)
--                SetBlipColour(blip, 1)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
--              end
--            else
--              -- Remove leftover number
--              HideNumberOnBlip(blip)
--              if blipSprite ~= 1 then -- default blip
--                SetBlipSprite(blip, 1)
--                SetBlipColour(blip, 1)
--                Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
--              end
--            end
--
--            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
--            SetBlipNameToPlayerName(blip, player) -- update blip name
--            SetBlipScale(blip,  0.85) -- set scale
--
--            -- set player alpha
--            if IsPauseMenuActive() then
--              SetBlipAlpha(blip, 255)
--            else
--              x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
--              x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
--              distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
--              -- Probably a way easier way to do this but whatever im an idiot
--              if distance < 0 then
--                distance = 0
--              elseif distance > 50 then
--                distance = 255
--              end
--              SetBlipAlpha(blip, distance)
--            end
--          end
--        end
--      end
--    end
--  end
--end)
