local isChecking = false
local triggerFound = false

-- Revive a player and disconnect them when falling through pillbox interior
Citizen.CreateThread(function()
    while true and not isChecking do
        Citizen.Wait(100)
        -- The spot on the ground in the tunnels
        local cords = { x = 308.57794189453, y = -588.79620361328, z = 17.756881713867 }
        local distance = 0
        local plyCoords = GetEntityCoords(PlayerPedId())
        distance = #(vector3(cords.x, cords.y, cords.z) - vector3(plyCoords.x,plyCoords.y,plyCoords.z))
        if distance < 15 then
            if IsPedFalling(PlayerPedId()) then
                isChecking = true
                SetTimeout(2000, function()
                    player = PlayerPedId()
                    if tvRP.isInComa() then
                        isChecking = false
                        tvRP.varyHealth(player, {100})
                        tvRP.isRevived(player,{})
                        tvRP.notify('Missing textures. Please always restart your client before joining')
                        SetTimeout(1000, function()
                            tvRP.teleport(210.95983886719, -561.76916503906, 43.872882843018)
                        end)
                        -- vRPserver.kickMyself({'Missing textures. Please restart your client when joining'})
                    end
                end)
            end
        end
    end
end)
