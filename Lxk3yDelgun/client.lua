
-- Micro optimizations
local IsPlayerFreeAiming = IsPlayerFreeAiming
local PlayerPedId = PlayerPedId
local GetEntityPlayerIsFreeAimingAt = GetEntityPlayerIsFreeAimingAt
local NetworkGetEntityIsNetworked = NetworkGetEntityIsNetworked
local GetEntityType = GetEntityType
local GetEntityCoords = GetEntityCoords
local NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
local TriggerServerEvent = TriggerServerEvent
local GetModelDimensions = GetModelDimensions
local GetEntityModel = GetEntityModel
local DrawMarker = DrawMarker
local GetEntityHealth = GetEntityHealth
local GetEntityMaxHealth = GetEntityMaxHealth
local GetPlayerName = GetPlayerName
local NetworkGetEntityOwner = NetworkGetEntityOwner
local GetPlayerServerId = GetPlayerServerId
--

local DELGUN_TOGGLE = false
local LOCAL_PLY = PlayerId()
local DELETE_DISTANCE = GetConvarInt("lxk3ydelgun.deleteDistance", 50.0)
local DRAW_MARKERS = GetConvar("lxk3ydelgun.drawMarkers", "true") == "true" and true or false
local DRAW_INFO = GetConvar("lxk3ydelgun.drawInfo", "true") == "true" and true or false

local function SendNativeHelpNotification(message, beep, duration)
    AddTextEntry('Lxk3yDelgun:HelpNotification', message)
    BeginTextCommandDisplayHelp('Lxk3yDelgun:HelpNotification')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

local function Draw3DText(coords, text, drawRect)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoords()
    local dist = #(camCoords - coords)
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    if onScreen then 
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(true)
        SetTextDropShadow()
        SetTextColour(255, 255, 255, 255)
        SetTextEntry('STRING')
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
        if drawRect then 
            local factor = string.len(text) / 370
            DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
        end
    end
end

RegisterNetEvent("Lxk3yDelgun:Client:ToggleDelgun")
AddEventHandler("Lxk3yDelgun:Client:ToggleDelgun", function()
    DELGUN_TOGGLE = not DELGUN_TOGGLE
    SendNativeHelpNotification("Delgun has been "..(DELGUN_TOGGLE and "~g~ENABLED" or "~r~DISABLED"), true, 4000)
end)

CreateThread(function()
    while true do
        if DELGUN_TOGGLE and IsPlayerFreeAiming(LOCAL_PLY) then
            local ped = PlayerPedId() 
            local found, entity = GetEntityPlayerIsFreeAimingAt(LOCAL_PLY)
            if found then 
                -- Caching values to save native calls
                local entityCoords = GetEntityCoords(entity)
                local isNetworked = NetworkGetEntityIsNetworked(entity)
                local entityType = GetEntityType(entity)
                local distToEntity = #(GetEntityCoords(ped) - entityCoords)

                if (entityType == 2 or entityType == 3) and isNetworked and distToEntity <= DELETE_DISTANCE then                
                    if DRAW_MARKERS then
                        DrawMarker(0, entityCoords.x, entityCoords.y, entityCoords.z + 2.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.8, 91, 196, 255, 255, true, false, 2, true, nil, nil, false)
                    end

                    if DRAW_INFO then 
                        local model = GetEntityModel(entity)
                        local ownerLocalId = NetworkGetEntityOwner(entity)
                        local owner = ownerLocalId ~= 0 and GetPlayerName(ownerLocalId).." ["..GetPlayerServerId(ownerLocalId).."]" or "NOT IN SCOPE" 
                        local health = GetEntityHealth(entity)  
                        local maxhealth = GetEntityMaxHealth(entity)               

                        if entityType == 2 then
                            local labelName = GetLabelText(GetDisplayNameFromVehicleModel(model))
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 1.0), "~b~Model: ~y~"..model, false)
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.7), "~b~Vehicle Name: ~y~"..labelName, false)
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.4), "~b~Owner: ~y~"..owner, false)
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.1), "~b~Health: ~y~"..health.."/"..maxhealth, false)
                        end  
                        
                        if entityType == 3 then 
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.7), "~b~Model: ~y~"..model, false)
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.4), "~b~Owner: ~y~"..owner, false)
                            Draw3DText(vector3(entityCoords.x, entityCoords.y, entityCoords.z + 0.1), "~b~LOD Distance: ~y~"..health.."/"..maxhealth, false)
                        end
                    end

                    if IsPedShooting(ped) then 
                        local netId = NetworkGetNetworkIdFromEntity(entity)
                        TriggerServerEvent("Lxk3yDelgun:Server:DeleteEntity", netId)
                    end
                end
            end
        end
        Wait(0)
    end
end)