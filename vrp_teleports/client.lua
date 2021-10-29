POS_actual = 1
PED_hasBeenTeleported = false

function teleport(pos)
    TriggerEvent('vrp:setCheckDelayed',30)
    Citizen.Wait(50)
    local ped = PlayerPedId()
    Citizen.CreateThread(function()
        PED_hasBeenTeleported = true

        DoScreenFadeOut(1000)
        while IsScreenFadingOut() do Citizen.Wait(0) end
        RequestCollisionAtCoord(pos.x, pos.y, pos.z)
        SetEntityCoords(ped, pos.x, pos.y, pos.z, true, true, true, false)
        SetEntityHeading(ped, pos.h)
        DoScreenFadeIn(1000)
        while IsScreenFadingIn() do Citizen.Wait(0)	end

        Citizen.Wait(500)
        PED_hasBeenTeleported = false
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped, true)

        for i,pos in pairs(Teleports) do
            DrawMarker(42, pos.x, pos.y, pos.z-0.99, 0.0, 0.0, 0.0, 270.0, 1.0, 0, 0.75, 0.5, 0.75, 0, 0, 0, 96, false, 0, 2, true, 0, 0, 0)
            -- Used for Making and Testing other Markers for other Resources
            --DrawMarker(28, pos.x, pos.y, pos.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 5.0, 255, 0, 0, 128, false, 0, 2, false, 0, 0, 0)

            if (Vdist(playerPos.x, playerPos.y, playerPos.z, pos.x, pos.y, pos.z) < 0.5) and (not PED_hasBeenTeleported) then
                POS_actual = pos.id
                if not gui_interiors.opened then
                    gui_interiors_OpenMenu()
                end
            end
        end
    end
end)
