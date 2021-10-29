-- Source https://github.com/nynjardin/outlawalert
-- Modified by serpico for vRP

--Config
local timer = 1 --in minutes - Set the time during the player is outlaw
local blip_time = 30 --in second
local wanted_time = 15 -- in seconds how long between any wanted alert
--End config

local wanted_time_left = 0

RegisterNetEvent('vrp:client:outlaw:mapPlace')
AddEventHandler('vrp:client:outlaw:mapPlace', function(x, y, z)
  local transparency = 180
  local x = x + (math.random(-70,70))
  local y = y + (math.random(-70,70))
  local blip = AddBlipForRadius(x, y, z, 90.0)

  SetBlipColour(blip, 1)
  SetBlipAlpha(blip, transparency)
  SetBlipAsShortRange(blip, 1)

  while transparency ~= 0 do
    Wait(blip_time * 4)
    transparency = transparency - 1
    SetBlipAlpha(blip, transparency)

    if transM == 0 then
      if DoesBlipExist(blip) then
        RemoveBlip(blip)
      end

      return
    end
  end
end)

Citizen.CreateThread(function() -- time decrease thread
  while true do
    Citizen.Wait(1000)
    if wanted_time_left > 0 then
      wanted_time_left = wanted_time_left - 1
    end
  end
end)

-- Fight detection
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsPedInMeleeCombat(PlayerPedId()) then
      if not tvRP.isCop() and not tvRP.isMedic() and prison == nil and jail == nil and wanted_time_left < 1 then
        local plyPos = GetEntityCoords(PlayerPedId(), true)
        local startHealth = tvRP.getHealth()

        Citizen.Wait(2000)

        local endHealth = tvRP.getHealth()

        if startHealth ~= endHealth then
          SetTimeout(math.random(10, 12) * 1000, function()
            TriggerServerEvent('vrp:server:outlaw:mapPlace', plyPos.x, plyPos.y, plyPos.z)
            TriggerEvent('blrp_core:client:prepareAlert', {
          		is_response = true,
          		service_name = 'Police',
              can_accept = false,
          		coords = plyPos,
          		badge = 'Tip',
          		badge_style = 'primary',
          		title = "Fight in progress",
          		icon = 'fad fa-phone',
          		show_for = 5000,
          		allow_gps = false
          	})
          end)

          wanted_time_left = wanted_time
        end
      end
    end
  end
end)

-- Gunshot detection
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if IsPedShooting(PlayerPedId()) and wanted_time_left < 1 then
      local currentWeapon = GetSelectedPedWeapon(PlayerPedId())
      local plyPos = GetEntityCoords(PlayerPedId(), true)

      local hunting_zone_bypass = false

      -- Don't send shots alert if they're using a hunting rifle in the LEGAL hunting area or La Fuente Blanca
      if currentWeapon == `WEAPON_HEAVYSHOTGUN` and (#(plyPos.xy - vector2(-1184.481, 3860.831)) < 2000.0 or #(plyPos.xy - vector2(1409.465, 1084.893)) < 50.0) then
        hunting_zone_bypass = true
      end

      if
        currentWeapon ~= `WEAPON_PLASMAP` and
        currentWeapon ~= `WEAPON_PETROLCAN` and
        currentWeapon ~= `WEAPON_SNIPERRIFLE` and
        currentWeapon ~= `WEAPON_SNOWBALL` and
        currentWeapon ~= `WEAPON_STUNGUN` and
        not hunting_zone_bypass
      then
        tvRP.setGunFired()

        if not tvRP.isCop() and not tvRP.isMedic() and prison == nil and jail == nil then
          SetTimeout(math.random(10, 12) * 1000, function()
            TriggerServerEvent('vrp:server:outlaw:mapPlace', plyPos.x, plyPos.y, plyPos.z)
            TriggerEvent('blrp_core:client:prepareAlert', {
          		is_response = true,
          		service_name = 'Police',
              can_accept = false,
          		coords = plyPos,
          		badge = 'Tip',
          		badge_style = 'primary',
          		title = "Gunshots heard in area",
          		icon = 'fad fa-phone',
          		show_for = 5000,
          		allow_gps = false
          	})
          end)

          wanted_time_left = wanted_time
        end
      end
    end
  end
end)
