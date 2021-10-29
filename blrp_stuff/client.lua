local lastcarView = 0
local xhairActive = false

local noCrossHair = {
  [911657153] = true, -- weapon_stungun
  [-1569615261] = true, --weapon_unarmed
  [2343591895] = true, --weapon_flashlight
  [101631238] = true, --weapon_fireextinguisher
  [683870287] = true, --WEAPON_PLASMAP
}

Citizen.CreateThread( function()
  while true do
    HideHudComponentThisFrame(1)
    HideHudComponentThisFrame(2) -- Weapon icon
    HideHudComponentThisFrame(3)
    HideHudComponentThisFrame(4)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13)
    HideHudComponentThisFrame(14)
    if not IsPlayerFreeAiming(PlayerId()) then
      if xhairActive then
        xhairActive = false
        SendNUIMessage("xhairHide")
      end
      if lastcarView ~= nil then
        SetFollowVehicleCamViewMode(lastcarView)
        lastcarView = nil
      end
    else
      if not xhairActive then
        TriggerEvent('gundraw:client:isHolstered', function(holstered)
          local _, cur_weap = GetCurrentPedWeapon(PlayerPedId(), 1)
          if IsPedInAnyVehicle(PlayerPedId(), false) then
            local currentvehView = GetFollowVehicleCamViewMode()
            if currentvehView ~= 4 then
              lastcarView = currentvehView
              SetFollowVehicleCamViewMode(4)
            end
            if GetFollowVehicleCamViewMode() == 4 then
              if not noCrossHair[cur_weap] and not holstered then
                xhairActive = true
                Citizen.CreateThread(function()
                  Citizen.Wait(600)

                  -- Check if FollowVehicleCamViewMode still is 4 to prevent
                  -- momentary right click causing the crosshair to stick
                  if GetFollowVehicleCamViewMode() == 4 then
                    SendNUIMessage("xhairShow")
                  end
                end)
              end
            end
          else
            if not noCrossHair[cur_weap] and not holstered then
              xhairActive = true
              Citizen.CreateThread(function()
                Citizen.Wait(300)

                -- Check if player is still free aiming to prevent
                -- momentary right click causing the crosshair to stick
                if IsPlayerFreeAiming(PlayerId()) then
                  SendNUIMessage("xhairShow")
                end
              end)
            end
          end
        end)
      end
    end
    Citizen.Wait(0)
  end
end)
