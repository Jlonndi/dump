-- Author Kai McKee / MoistGoat

local holstered = true
local DisableStuff = false
local isCop = false
local equipedWeapon = nil
local fast_animation = {
    "WEAPON_FLASHLIGHT",
    "WEAPON_NIGHTSTICK",
    "WEAPON_SWITCHBLADE",
    "WEAPON_SHANK"
}
local medium_animation = {
    "WEAPON_STUNGUN",
    "WEAPON_BATTLEAXE",
    "WEAPON_CROWBAR",
    "WEAPON_WRENCH",
    "WEAPON_BAT",
    "WEAPON_KNIFE",
    "WEAPON_DAGGER",
    "WEAPON_BOTTLE",
    "WEAPON_HAMMER",
    "WEAPON_PISTOL",
    "WEAPON_SNSPISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_REVOLVER",
    "WEAPON_PISTOL_MK2",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_BAT",
  	"WEAPON_GOLFCLUB",
  	"WEAPON_CROWBAR",
  	"WEAPON_SMG",
  	"WEAPON_PUMPSHOTGUN",
    "WEAPON_BEANBAG",
  	"WEAPON_ASSAULTRIFLE",
  	"WEAPON_CARBINERIFLE_MK2",
  	"WEAPON_GUSENBERG",
  	"WEAPON_DBSHOTGUN",
  	"WEAPON_MUSKET",
  	"WEAPON_MICROSMG",
  	"WEAPON_CARBINERIFLE",
  	"WEAPON_MG",
  	"WEAPON_COMBATMG",
  	"WEAPON_ASSAULTSMG",
  	"WEAPON_MINISMG",
  	"WEAPON_ADVANCEDRIFLE",
  	"WEAPON_SPECIALCARBINE",
  	"WEAPON_BULLPUPRIFLE",
  	"WEAPON_COMPACTRIFLE",
  	"WEAPON_SAWNOFFSHOTGUN",
  	"WEAPON_BULLPUPSHOTGUN",
  	"WEAPON_ASSAULTSHOTGUN",
  	"WEAPON_HEAVYSHOTGUN",
  	"WEAPON_SNIPERRIFLE",
  	"WEAPON_HEAVYSNIPER",
  	"WEAPON_MARKSMANRIFLE",
  	"WEAPON_AUTOSHOTGUN",
  	"WEAPON_GRENADELAUNCHER",
  	"WEAPON_RPG",
  	"WEAPON_MINIGUN",
  	"WEAPON_FIREWORK",
  	"WEAPON_RAILGUN",
  	"WEAPON_HOMINGLAUNCHER",
  	"WEAPON_COMPACTLAUNCHER",
  	"WEAPON_POOLCUE",
  	"WEAPON_CARBINERIFLE_MK2",
    "WEAPON_APPISTOL",
    "WEAPON_SMG_MK2",
    "WEAPON_MACHETE",
    "WEAPON_LIGHTSABER",
    "WEAPON_DOUBLEACTION",
    'WEAPON_KATANA',
}

RegisterNetEvent('CustomScripts:setCop')
AddEventHandler('CustomScripts:setCop', function(toggle)
    if toggle ~= nil then
        isCop = toggle
    end
end)

RegisterNetEvent('gundraw:client:drawAnimate')
AddEventHandler('gundraw:client:drawAnimate', function(weapon_name)
    local ped = PlayerPedId()
    if has_value(medium_animation, weapon_name) then
        if isCop then --If I'm a cop, play this exclusively
            loadAnimDict( "rcmjosh4" )
            loadAnimDict( "reaction@intimidation@cop@unarmed" )
            TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, 1400, 50, 10.0, 0, 0, 0 )
            SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
            DisableStuff = true
            Citizen.Wait(700)
            TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 5.0, 2.0, 400, 48, 10, 0, 0, 0 )
            Citizen.Wait(300)
            SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
            Citizen.Wait(300)
            ClearPedTasks(ped)
            holstered = false
            DisableStuff = false
        else
            loadAnimDict( "reaction@intimidation@1h" )
            TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
            SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
            DisableStuff = true
            Citizen.Wait(1300)
            SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
            Citizen.Wait(700)
            ClearPedTasks(ped)
            holstered = false
            DisableStuff = false
        end
        equipedWeapon = weapon_name
    end
    if has_value(fast_animation, weapon_name) then
        loadAnimDict( "reaction@intimidation@cop@unarmed" )
        TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 48, 10, 0, 0, 0 ) -- COP ANIM
        --SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
        DisableStuff = true
        --Citizen.Wait(1300)
        --SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
        Citizen.Wait(700)
        ClearPedTasks(ped)
        holstered = false
        DisableStuff = false
    end
    equipedWeapon = weapon_name
end)

RegisterNetEvent('gundraw:client:holsterAnimate')
AddEventHandler('gundraw:client:holsterAnimate', function(weapon_name, callback)
    local ped = PlayerPedId()
    if has_value(medium_animation, weapon_name) then
        if not holstered then
            if isCop then
                loadAnimDict( "weapons@pistol@" )
                TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 ) -- COP ANIM
            else
                loadAnimDict( "reaction@intimidation@1h" )
                TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
            end
            DisableStuff = true
            SetCurrentPedWeapon(ped, GetHashKey(weapon_name), true) -- This needs to recognize current weapon set it so it appears when holstering. Hex stuff /shrug
            Citizen.Wait(1300)
            callback()
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            --Citizen.Wait(700)
            ClearPedTasks(ped)
            holstered = true
            DisableStuff = false
            equipedWeapon = nil
        end
    end
    callback()
end)

RegisterNetEvent('gundraw:client:draw')
AddEventHandler('gundraw:client:draw', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, true) then
        -- moved
        if canPlayAnimation(ped) then
            if holstered then
                if isCop then --If I'm a cop, play this exclusively
                    loadAnimDict( "rcmjosh4" )
                    loadAnimDict( "reaction@intimidation@cop@unarmed" )
                    TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, 1400, 50, 10.0, 0, 0, 0 )
                    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
                    DisableStuff = true
                    Citizen.Wait(1400)
                    TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 5.0, 2.0, 400, 48, 10, 0, 0, 0 )
                    Citizen.Wait(300)
                    SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
                    Citizen.Wait(300)
                    ClearPedTasks(ped)
                    holstered = false
                    DisableStuff = false
                else
                    loadAnimDict( "reaction@intimidation@1h" )
                    TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
                    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
                    DisableStuff = true
                    Citizen.Wait(1300)
                    SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
                    Citizen.Wait(700)
                    ClearPedTasks(ped)
                    holstered = false
                    DisableStuff = false
                end
                equipedWeapon = CurrentWeapon(ped)
            end
        elseif not canPlayAnimation(ped) then
            if not holstered then
                if isCop then
                    loadAnimDict( "weapons@pistol@" )
                    TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 ) -- COP ANIM
                else
                    loadAnimDict( "reaction@intimidation@1h" )
                    TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
                end
                DisableStuff = true
                SetCurrentPedWeapon(ped, GetHashKey(equipedWeapon), true) -- This needs to recognize current weapon set it so it appears when holstering. Hex stuff /shrug
                Citizen.Wait(1300)
                SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)

                Citizen.Wait(700)
                ClearPedTasks(ped)
                holstered = true
                DisableStuff = false
                equipedWeapon = nil
            end
        end
    end
end)

-- Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(0)
--		local ped = PlayerPedId()
--		if not IsPedInAnyVehicle(ped, true) then
--			if GetIsTaskActive(ped, 56) then
--				if canPlayAnimation(ped) then
--					if holstered then
--						if isCop then --If I'm a cop, play this exclusively
--							loadAnimDict( "rcmjosh4" )
--							loadAnimDict( "reaction@intimidation@cop@unarmed" )
--							TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, 1400, 50, 10.0, 0, 0, 0 )
--							SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
--							DisableStuff = true
--							Citizen.Wait(1400)
--							TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 5.0, 2.0, 400, 48, 10, 0, 0, 0 )
--							Citizen.Wait(300)
--							SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
--							Citizen.Wait(300)
--							ClearPedTasks(ped)
--							holstered = false
--							DisableStuff = false
--						else
--							loadAnimDict( "reaction@intimidation@1h" )
--							TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
--							SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
--							DisableStuff = true
--							Citizen.Wait(1300)
--							SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
--							Citizen.Wait(700)
--							ClearPedTasks(ped)
--							holstered = false
--							DisableStuff = false
--						end
--						equipedWeapon = CurrentWeapon(ped)
--					end
--
--				elseif not canPlayAnimation(ped) then
--					if not holstered then
--						if isCop then
--							loadAnimDict( "weapons@pistol@" )
--							TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 8.0, 2.0, -1, 48, 10, 0, 0, 0 ) -- COP ANIM
--						else
--							loadAnimDict( "reaction@intimidation@1h" )
--							TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )
--						end
--						DisableStuff = true
--						SetCurrentPedWeapon(ped, GetHashKey(equipedWeapon), true) -- This needs to recognize current weapon set it so it appears when holstering. Hex stuff /shrug
--						Citizen.Wait(1300)
--						SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
--
--						Citizen.Wait(700)
--						ClearPedTasks(ped)
--						holstered = true
--						DisableStuff = false
--						equipedWeapon = nil
--					end
--				end
--			end
--		end
--	end
--end)

RegisterNetEvent('gundraw:client:holsterWeapon')
AddEventHandler('gundraw:client:holsterWeapon', function()
    holstered = true
end)

AddEventHandler('gundraw:client:isHolstered', function(callback)
  callback(holstered)
end)

function canPlayAnimation(ped)
    currentWeapon = GetSelectedPedWeapon(ped)
    for k,v in pairs(weaponlist) do
        if GetHashKey(v) == currentWeapon then
            return true
        end
    end
    return false
end

function CurrentWeapon(ped)
    currentWeapon = GetSelectedPedWeapon(ped)
    for k,v in pairs(medium_animation) do
        if GetHashKey(v) == currentWeapon then
            return v
        end
    end
    return nil
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

local maxTaserCarts = 1 -- The amount of taser cartridges a person can have.
local taserCartsLeft = maxTaserCarts

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped, nil)
        local ped = GetPlayerPed(-1)
        local taserModel = GetHashKey("WEAPON_STUNGUN")

        if GetSelectedPedWeapon(ped) == taserModel then

            DisableControlAction(0, 45, true)
            if IsPedShooting(ped) then
                taserCartsLeft = taserCartsLeft - 1
            end
            if taserCartsLeft <= 0 or not has_ammo then
                if GetSelectedPedWeapon(ped) == taserModel then
                    SetPlayerCanDoDriveBy(ped, false)
                    DisablePlayerFiring(ped, true)
                end
            end

            if (IsDisabledControlJustReleased(1, 45)) then
                loadAnimDict("weapons@pistol@pistol_str" )
                TaskPlayAnim(ped, "weapons@pistol@pistol_str", "reload_aim_empty", 8.0, 2.0, 1700, 48, 10, 0, 0, 0 )

                SetTimeout(1550, function()
                  taserCartsLeft = maxTaserCarts
                end)
            end
        end
    end
end)

function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
