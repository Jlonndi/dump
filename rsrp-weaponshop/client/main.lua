local ShopOpen = false
local CurrentAmmunationClerk = nil

local function GetCurrentZone()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    local closestZone = ' '
    local closestDistance = -1

    for name, zone in pairs(Config.Zones) do 
        for k, location in ipairs(zone.Locations) do 
            local dist = #(coords - location.ShopLocation)

            if closestDistance == -1 or dist < closestDistance then 
                closestZone = name 
                closestDistance = dist
            end
        end
    end

    return closestZone
end

local function ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry('rsrp-weaponshop:Notification', msg)

	if thisFrame then
		DisplayHelpTextThisFrame('rsrp-weaponshop:Notification', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('rsrp-weaponshop:Notification')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end

function OpenWeaponShopMenu(ped)
    CurrentAmmunationClerk = ped
    local zone = GetCurrentZone()
	local elements = {}
	ShopOpen = true

    SetNuiFocus(true, true)

    if Config.Blur then
		SetTimecycleModifier('hud_def_blur') -- blur
	end

    SendNUIMessage({
        event = 'OPEN',
        weapons = Config.Zones[zone].Items,
        zone = zone
    })
end

-- Create Blips
Citizen.CreateThread(function()
    for name, zone in pairs(Config.Zones) do
        for k, location in ipairs(zone.Locations) do
            local blip = AddBlipForCoord(location.ShopLocation)
            SetBlipSprite (blip, 110)
            SetBlipDisplay(blip, 4)
            SetBlipScale  (blip, 1.0)
            SetBlipColour (blip, 4)
            SetBlipAsShortRange(blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(GetLabelText(GetZoneFromNameId(GetZoneAtCoords(location.ShopLocation)))..' Ammunation')
            EndTextCommandSetBlipName(blip)
        end
    end
end)

local PED_TRACKER = {}
local ammunationPed = `s_m_m_ammucountry`

local function SpawnAmmunationClerk(location)
    RequestModel(ammunationPed)
    while not HasModelLoaded(ammunationPed) do 
        Wait(100)
    end

    local ret, groundZ = GetGroundZFor_3dCoord(location.x, location.y, location.z, location.z)

    local ped = CreatePed(4, ammunationPed, location.x, location.y, groundZ, location.w, false, true)

    while not DoesEntityExist(ped) do 
        Wait(100)
    end

    SetEntityAlpha(ped, 0, false)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedCanBeTargetted(ped, false)

    for i = 0, 255, 51 do
        Wait(50)
        SetEntityAlpha(ped, i, false)
    end

    return ped
end

local hasShownNotification = false

-- Ped Spawning Thread
CreateThread(function()
    while true do 
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for name, zone in pairs(Config.Zones) do
            for k, location in ipairs(zone.Locations) do
                local dist = #(coords - location.ShopLocation)

                if dist < 15 and not PED_TRACKER[k] then 
                    local clerk = SpawnAmmunationClerk(location.ShopClerkLocation)
                    PED_TRACKER[k] = clerk
                end

                if dist < 3 and not hasShownNotification then 
                    ShowHelpNotification('Interact with the dealer by holding ~INPUT_CHARACTER_WHEEL~ and then ~INPUT_AIM~ on him', false, true, 5000)
                    hasShownNotification = true
                end

                if dist >= 15 and PED_TRACKER[k] then 
                    for i = 255, 0, -51 do
						Wait(50)
						SetEntityAlpha(PED_TRACKER[k], i, false)
					end
                    DeletePed(PED_TRACKER[k])
                    PED_TRACKER[k] = nil
                    hasShownNotification = false
                end
            end
        end
        Wait(500)
    end
end)

RegisterNetEvent('RSRPWS:Client:SyncClerkPurchaseSpeech')
AddEventHandler('RSRPWS:Client:SyncClerkPurchaseSpeech', function(clerkLocation)
    local pedCoords = GetEntityCoords(PlayerPedId())
    local dist = #(pedCoords - clerkLocation)
    if dist < 15 then 
        local clerkPed = GetClosestObjectOfType(clerkLocation, 5, ammunationPed, true)
        PlayPedAmbientSpeechNative(CurrentAmmunationClerk, 'Generic_Thanks', 'Speech_Params_Force_Shouted_Critical')
    end
end)

RegisterNUICallback('buyItem', function(data, cb)
    local ped = PlayerPedId()
    PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)
    GiveWeaponToPed(ped, GetHashKey(data.item), 100, false, false)
    Wait(500)
    local clerkCoords = GetEntityCoords(CurrentAmmunationClerk)
    TriggerServerEvent('RSRPWS:Server:SyncClerkPurchaseSpeech', clerkCoords)
end)

RegisterNUICallback('focusOff', function(data, cb)
    SetNuiFocus(false, false)
   
    if Config.Blur then 
        SetTimecycleModifier('default') -- remove blur
    end
end)     