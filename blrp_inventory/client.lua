local guiEnabled = false
local currentWeapon = nil
local lastPressedHotkey = nil
local canUseHotkeys = true -- Prevent phone and other things triggering it

-- Prevent server spam
local coolDownLock = false

RegisterNetEvent('core:client:removeUI:inventory')
AddEventHandler('core:client:removeUI:inventory', function()
    TriggerEvent('blrp_inventory:hide')
end)

AddEventHandler('blrp_inventory:client:isInventoryOpen', function(callback)
  callback(guiEnabled)
end)

function focusNUI(shouldDisplay)
    guiEnabled = shouldDisplay
    SetNuiFocus(shouldDisplay, shouldDisplay)
    SetNuiFocusKeepInput(shouldDisplay)
    TriggerEvent('core:client:enableInterface', 'inventory', shouldDisplay)

    if shouldDisplay then
      TriggerEvent('badMenu:client:hideAll')
    end

    if not shouldDisplay then
      TriggerServerEvent('vrp:server:requestMyPlayerInvData')
      TriggerEvent('vrp:client:killRobbingThread')
    end
end

local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local weapon_types = {
    "WEAPON_SHANK",
    "WEAPON_KNIFE",
    "WEAPON_DAGGER",
    "WEAPON_BOTTLE",
    "WEAPON_STUNGUN",
    "WEAPON_FLASHLIGHT",
    "WEAPON_NIGHTSTICK",
    "WEAPON_HAMMER",
    "WEAPON_BAT",
    "WEAPON_GOLFCLUB",
    "WEAPON_CROWBAR",
    "WEAPON_PISTOL",
    "WEAPON_SNSPISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_PISTOL_MK2",
    --"WEAPON_MACHINEPISTOL",
    --"WEAPON_MICROSMG",
    "WEAPON_SMG",
    "WEAPON_CARBINERIFLE",
    "WEAPON_SPECIALCARBINE",
    "WEAPON_PUMPSHOTGUN",
    "WEAPON_FIREEXTINGUISHER",
    --"WEAPON_PETROLCAN",
    "WEAPON_FLARE",
    "WEAPON_REVOLVER",
    "WEAPON_SWITCHBLADE",
    "WEAPON_BATTLEAXE",
    "WEAPON_POOLCUE",
    "WEAPON_WRENCH",
    "WEAPON_DOUBLEACTION",

    --Da new weapons
    "WEAPON_ASSAULTRIFLE",
    "WEAPON_COMPACTRIFLE",
    "WEAPON_MACHINEPISTOL",
}

local weapon_hashes = {
    {"WEAPON_KNIFE",-1716189206},
    {"WEAPON_DAGGER",-1834847097},
    {"WEAPON_BOTTLE",-102323637},
    {"WEAPON_FLASHLIGHT",2343591895},
    {"WEAPON_NIGHTSTICK",1737195953},
    {"WEAPON_HAMMER",1317494643},
    {"WEAPON_BAT",-1786099057},
    {"WEAPON_GOLFCLUB",1141786504},
    {"WEAPON_CROWBAR",-2067956739},
    {"WEAPON_PISTOL",453432689},
    {"WEAPON_SNSPISTOL",-1076751822},
    {"WEAPON_COMBATPISTOL",1593441988},
    {"WEAPON_HEAVYPISTOL",3523564046},
    {"WEAPON_PISTOL50",-1716589765},
    {"WEAPON_VINTAGEPISTOL",137902532},
    {"WEAPON_PISTOL_MK2",-1075685676},
    --{"WEAPON_MACHINEPISTOL",222222222},
    --{"WEAPON_MICROSMG",222222222},
    {"WEAPON_SMG",736523883},
    {"WEAPON_CARBINERIFLE",2210333304},
    {"WEAPON_SPECIALCARBINE",-1063057011},
    {"WEAPON_PUMPSHOTGUN",487013001},
    {"WEAPON_STUNGUN",911657153},
    {"WEAPON_FIREEXTINGUISHER",101631238},
    --{"WEAPON_PETROLCAN",222222222},
    {"WEAPON_FLARE",1233104067},
    {"WEAPON_REVOLVER",-1045183535},
    {"WEAPON_SWITCHBLADE",-538741184},
    {"WEAPON_BATTLEAXE",-853065399},
    {"WEAPON_POOLCUE",-1810795771},
    {"WEAPON_WRENCH",419712736},
    {"WEAPON_DOUBLEACTION",-1746263880},

    --Da new weapons
    {"WEAPON_ASSAULTRIFLE",-1074790547},
    {"WEAPON_COMPACTRIFLE",1649403952},
    {"WEAPON_MACHINEPISTOL",-619010992},
    {"WEAPON_MG",-1660422300},
}

local isLoading = false

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
      DisableControlAction(0, Keys["TAB"], true)
      DisableControlAction(0, Keys["1"], true)
      DisableControlAction(0, Keys["2"], true)
      DisableControlAction(0, Keys["3"], true)
      DisableControlAction(0, Keys["4"], true)
      DisableControlAction(0, Keys["5"], true)
      DisableControlAction(0, 14,true) -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15,true) -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16,true) -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17,true) -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99,true) -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100,true) -- INPUT_VEH_SELECT_PREV_WEAPON
      if IsDisabledControlJustReleased(0, Keys["TAB"]) then
          -- Tab was pressed
      end
      if IsDisabledControlJustReleased(0, Keys["1"]) then
          triggerHotbarSlot(1)
      end
      if IsDisabledControlJustReleased(0, Keys["2"]) then
          triggerHotbarSlot(2)
      end
      if IsDisabledControlJustReleased(0, Keys["3"]) then
          triggerHotbarSlot(3)
      end
      if IsDisabledControlJustReleased(0, Keys["4"]) then
          triggerHotbarSlot(4)
      end
      if IsDisabledControlJustReleased(0, Keys["5"]) then
          triggerHotbarSlot(5)
      end
      if guiEnabled then
			DisableControlAction(1, 18, true)
			DisableControlAction(1, 24, true)
			DisableControlAction(1, 69, true)
			DisableControlAction(1, 92, true)
			DisableControlAction(1, 106, true)
			DisableControlAction(1, 122, true)
			DisableControlAction(1, 135, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 144, true)
			DisableControlAction(1, 176, true)
			DisableControlAction(1, 223, true)
			DisableControlAction(1, 229, true)
			DisableControlAction(1, 237, true)
			DisableControlAction(1, 257, true)
			DisableControlAction(1, 329, true)

			DisableControlAction(1, 14, true)
			DisableControlAction(1, 16, true)
			DisableControlAction(1, 41, true)
			DisableControlAction(1, 43, true)
			DisableControlAction(1, 81, true)
			DisableControlAction(1, 97, true)
			DisableControlAction(1, 180, true)
			DisableControlAction(1, 198, true)
			DisableControlAction(1, 39, true)
			DisableControlAction(1, 50, true)

			DisableControlAction(1, 22, true)
			DisableControlAction(1, 55, true)
			DisableControlAction(1, 76, true)
			DisableControlAction(1, 102, true)
			DisableControlAction(1, 114, true)
			DisableControlAction(1, 143, true)
			DisableControlAction(1, 179, true)
			DisableControlAction(1, 193, true)
			DisableControlAction(1, 203, true)
			DisableControlAction(1, 216, true)
			DisableControlAction(1, 255, true)
			DisableControlAction(1, 298, true)
			DisableControlAction(1, 321, true)
			DisableControlAction(1, 328, true)
			DisableControlAction(1, 331, true)
		end
	end
end)

function triggerHotbarSlot(number)
    if coolDownLock then return end
    if GetPlayerTargetEntity(PlayerPedId()) then return end -- prevent switching while melle aiming or targeting in cars
    TriggerEvent('vrp:client:isAbleUseInventory', function(result)
        if not result then return end
        TriggerEvent('core:client:isInterfaceOpened', function(is_ui_opened)
            if not is_ui_opened then
                if not canUseHotkeys then return end -- state check to prevent use when using hotkeys without intending to use hotbar item
                if not GetPedConfigFlag(PlayerPedId(), 78) then -- (exploit) Make sure ped is not aiming when switching
                    TriggerEvent("gcphone:getPhoneState", function(phoneIsBeingUsed)
                        if phoneIsBeingUsed then return end
                        if lastPressedHotkey ~= number then -- Only do it when switching weapons by hotkey
                            -- TriggerEvent('gundraw:clientclient:holsterWeapon') -- reset holster status
                        end
                        lastPressedHotkey = number
                        TriggerServerEvent("blrp_inventory:activeItemSlot", number)
                        coolDownLock = true
                        SetTimeout(300, function()
                            coolDownLock = false
                        end)
                    end)
                end
            end
        end)
    end)
end

-- This data is cached to all hell. To change anything with this ;
-- You need to stop the server, change this value then delete the server cache
-- then delete the game client cache
RegisterCommand("open-inv", function(source, args, rawCommand)
    TriggerEvent('vrp:client:isAbleUseInventory', function(result)
        if not result then return end
        TriggerEvent("gcphone:getPhoneState", function(retValue)
            if not retValue then
                TriggerEvent("blrp_tablet:getTabletState", function(retValue)
                    if not retValue then
                        TriggerServerEvent('blrp_inventory:openInventory')
                    end
                end)
            end
        end)
    end)
end, false)

RegisterKeyMapping("open-inv", "Shortcut to Inventory", "keyboard", "i");

RegisterNetEvent('blrp_inventory:show')
AddEventHandler('blrp_inventory:show', function(inventory_data)
    if inventory_data.chest then
        TriggerEvent('blrp_inventory:client:ForceDisarm')
    end
    -- If type is update and gui is not enabled then dont send this
    if inventory_data.should_update_only_if_open and not guiEnabled then
        return
    end
    TriggerEvent('core:client:isInterfaceOpened', function(is_ui_opened)
        if not is_ui_opened or inventory_data.should_update_only_if_open then
            TriggerEvent('menu:forceCloseRadialMenu')
            focusNUI(true)
            SendNUIMessage({
                type = "inventory:toggle",
                enable = true,
                packet = inventory_data,
            })
        else
            print('UI is opened, so not focusing UI')
        end
    end)
end)

RegisterNetEvent('blrp_inventory:client:setCanHotKeysState')
AddEventHandler('blrp_inventory:client:setCanHotKeysState', function(state)
    canUseHotkeys = state
end)

RegisterNetEvent('blrp_inventory:hide')
AddEventHandler('blrp_inventory:hide', function()
    focusNUI(false)
    SendNUIMessage({
        type = "inventory:toggle",
        enable = false,
    })
end)

RegisterNetEvent('blrp_inventory:openStoreInterface')
AddEventHandler('blrp_inventory:openStoreInterface', function(items)
    focusNUI(true)
    SendNUIMessage({
        type = "inventory:toggle",
        enable = true,
        packet = ({
            items = items
        }),
        mode = 'shop'
    })
end)

RegisterNetEvent('menu:forceCloseMenu')
AddEventHandler('menu:forceCloseMenu', function()
    focusNUI(false)
    SendNUIMessage({
        type = "inventory:toggle",
        enable = false,
    })
end)

local available_shots = 0
local fired_shots = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedShooting(PlayerPedId()) then
            if currentWeapon ~= 'WEAPON_FIREEXTINGUISHER' then
                TriggerServerEvent('blrp_inventory:registerFiredBullet', currentWeapon)
            end

            if currentWeapon == 'WEAPON_STUNGUN' then
              fired_shots = fired_shots + 1

              if fired_shots >= available_shots then
                TriggerEvent('blrp_inventory:client:ForceDisarm')
              end
            end

            if currentWeapon == 'WEAPON_FLASHBANG' or currentWeapon == 'WEAPON_MOLOTOV' then
                TriggerEvent('blrp_inventory:client:ForceDisarm')
            end

            if currentWeapon == 'WEAPON_FLARE' then
                TriggerEvent('core:client:toggleNpcAgroState', true)
                TriggerEvent('core:client:resetPedMeleeState')
                SetTimeout(7000, function()
                    TriggerEvent('core:client:renewNpcAgroState')
                    TriggerEvent('core:client:toggleNpcAgroState', false)
                end)
                TriggerEvent('blrp_inventory:client:ForceDisarm')
            end
        end
    end
end)

RegisterNetEvent("blrp_inventory:client:ForceDisarm")
AddEventHandler("blrp_inventory:client:ForceDisarm", function()
    if currentWeapon then
        TriggerServerEvent('blrp_inventory:saveUsedBullets', currentWeapon)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(PlayerPedId(), true)
        currentWeapon = nil
        fired_shots = 0
    end
end)

has_ammo = false

RegisterNetEvent("blrp_inventory:client:UseWeapon")
AddEventHandler("blrp_inventory:client:UseWeapon", function(idname, ammo_amount, meta)
    local weaponName = idname
    if not ammo_amount then ammo_amount = 0 end
    if currentWeapon then
        -- Update bullets when weapon is put away
        TriggerServerEvent('blrp_inventory:saveUsedBullets', currentWeapon)
        fired_shots = 0
    end
    if idname == 'WEAPON_STUNGUN' then
      available_shots = ammo_amount
    end
    if currentWeapon == weaponName then -- Put Weapon Away
        SetPedAmmo(PlayerPedId(), GetHashKey(currentWeapon), 0) -- prevent shooting exploit while putting away
        TriggerEvent('gundraw:client:holsterAnimate', currentWeapon, function()
            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
            RemoveAllPedWeapons(PlayerPedId(), true)
        end) -- Holster put away
        currentWeapon = nil
    else
        if weaponName == 'WEAPON_PETROLCAN' then
            TriggerEvent('essence:buyCan')
            ammo_amount = 1
        end
        if weaponName == 'WEAPON_FIREEXTINGUISHER' then ammo_amount = 4000 end
        if weaponName == 'WEAPON_FLASHBANG' then ammo_amount = 1 end
        if weaponName == 'WEAPON_GARBAGEBAG' then ammo_amount = 1 end
        if weaponName == 'WEAPON_FLARE' then ammo_amount = 1 end
        if weaponName == 'WEAPON_MOLOTOV' then ammo_amount = 1 end

        GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponName), ammo_amount, false, false)
        SetPedAmmo(PlayerPedId(), GetHashKey(weaponName), ammo_amount)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey(weaponName), true)
        currentWeapon = weaponName
        TriggerEvent('gundraw:client:drawAnimate', weaponName)
        if ammo_amount < 1 then
          has_ammo = false
            if IsPedInAnyVehicle(ped, true) then
                TriggerEvent('vrp:client:notify', 'You have no ammo')
            end
            if weaponName == 'WEAPON_STUNGUN' then
              SetPlayerCanDoDriveBy(ped, false)
              DisablePlayerFiring(ped, true)
            end
        else
          has_ammo = true
        end
        if meta and meta.components then
            for _, name in pairs(meta.components) do
                if string.match(name, 'component_flashlight') then
                    addFlashlightMod()
                elseif string.match(name, 'component_pistolmk2_skin') then
                    addWeaponSkin(name)
                end
            end
        end
    end
end)

function addWeaponSkin(name) -- maybe protect this a bit more, is there a point?
    local skin_name =  string.match(name, ":(.*)")
    print('skin name is', skin_name)
    GiveWeaponComponentToPed(PlayerPedId(), GetHashKey('WEAPON_PISTOL_MK2'), GetHashKey(skin_name))
end

function addFlashlightMod()
    local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
    if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then -- WEAPON_PISTOL
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then -- WEAPON_COMBATPISTOL
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then -- WEAPON_PISTOL50
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then -- WEAPON_PUMPSHOTGUN
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then -- WEAPON_HEAVYPISTOL
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then -- WEAPON_SMG
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))
    elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then -- WEAPON_SMG
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_02"))
    end
end

-- This is just in case the resources restarted whilst the NUI is focused
Citizen.CreateThread(function()
    TriggerEvent('blrp_inventory:hide')
end)

----------------------------
-- Callbacks
----------------------------

RegisterNUICallback('escape', function(data, cb)
    TriggerEvent('blrp_inventory:hide')
    if(data.mode == 'transfer') then
        TriggerServerEvent('blrp_inventory:chestClosed', {
            chest_name = data.chest_name
        })
    end
    cb('ok')
end)

-- Request item actions when a player starts dragging an item
RegisterNUICallback('requestItemActions', function(data, cb)
    TriggerServerEvent('blrp_inventory:requestItemOptions', {
        item_code = data.item_code,
    })
    cb('ok')
end)

-- Send item actions back to panel
RegisterNetEvent('blrp_inventory:sendItemActions')
AddEventHandler('blrp_inventory:sendItemActions', function(actions)
    SendNUIMessage({
        type = "inventory:send:actions",
        actions = actions
    })
end)

-- Init inventory
RegisterNetEvent('blrp_inventory:init')
AddEventHandler('blrp_inventory:init', function(data)
    SetTimeout(2000, function() -- Wait for local storage to load to sort inventory
        SendNUIMessage({
            type = "inventory:init",
            packet = data
        })
    end)
end)

-- Send item actions back to panel
RegisterNetEvent('blrp_inventory:setItemSelected')
AddEventHandler('blrp_inventory:setItemSelected', function(hotbar_number)
    SendNUIMessage({
        type = "inventory:send:setItemSelected",
        hotbar_number = hotbar_number
    })
end)


-- Request item actions when a player starts dragging an item
RegisterNUICallback('performItemAction', function(data, cb)
  if data ~= nil then
    local allowTrash = true
    if data.action_name ~= nil and data.action_name == "Trash" then
      local dist = #(GetEntityCoords(GetPlayerPed(-1)) - vector3(313.76293945312, -656.84606933594, -100.74578857422))
      if dist < 30 then
        allowTrash = false
      end
    end
    TriggerServerEvent('blrp_inventory:performItemAction', {
      item_code = data.item_code,
      action_name = data.action_name,
      item_amount = data.item_amount,
      meta = data.meta,
      createLootBox = allowTrash,
    })
  end
  cb('ok')
end)

local itemRobBlacklist = {
  ["wbody|WEAPON_COMBATPISTOL"] = true,
  ["wbody|WEAPON_NIGHTSTICK"] = true,
  ["wbody|WEAPON_FLARE"] = true,
  ["wbody|WEAPON_STUNGUN"] = true,
  ["wbody|WEAPON_BEANBAG"] = true,
  ["wbody|WEAPON_HEAVYPISTOL"] = true,
  ["wbody|WEAPON_PUMPSHOTGUN"] = true,
  ["wbody|WEAPON_SMG"] = true,
  ["wbody|WEAPON_CARBINERIFLE"] = true,
  ["wbody|WEAPON_SPECIALCARBINE"] = true,
  ["police_armor"] = true,
  ["metal_detector"] = true,
}

RegisterNUICallback('performMoveToStorage', function(data, cb)
    TriggerEvent('vrp:client:robbingThreadStatus', function(retValue)
      local processTransfer = true
      if retValue then
        for k,v in pairs(itemRobBlacklist) do
          if string.match(data.item_code, k) and not string.match(data.item_code, 'SMG_MK2') then
            processTransfer = false
            break
          end
        end
      end
      if processTransfer then
        TriggerServerEvent('blrp_inventory:serverMoveToStorage', {
            item_code = data.item_code,
            item_amount = data.item_amount,
            chest_name = data.chest_name,
            meta = data.meta,
        })
        cb('performMoveToStorage ok')
        print("move to storage")
      else
        TriggerEvent('vrp:client:notify', "You can't move this item")
        cb(false)
      end
    end)
end)

RegisterNUICallback('performMoveToInventory', function(data, cb)
  TriggerEvent('vrp:client:robbingThreadStatus', function(retValue)
    local processTransfer = true
    if retValue then
      for k,v in pairs(itemRobBlacklist) do
        if string.match(data.item_code, k) and not string.match(data.item_code, 'SMG_MK2') then
          processTransfer = false
          break
        end
      end
    end
    if processTransfer then
      TriggerServerEvent('blrp_inventory:serverMoveToInventory', {
          item_code = data.item_code,
          item_amount = data.item_amount,
          chest_name = data.chest_name,
          meta = data.meta,
      })
      cb('performMoveToInventory ok')
      print("move to inventory")
    else
      TriggerEvent('vrp:client:notify', "You can't move this item")
      cb(false)
    end
  end)
end)

RegisterNUICallback('setItemSlots', function(data, cb)
    TriggerServerEvent('blrp_inventory:setItemSlots', data)
    cb('setItemSlots ok')
end)

local displayEnlargedImageRunning = false
local baseColor = vector4(255, 255, 255, 255)

RegisterNetEvent('blrp_inventory:showEnlargedImage')
AddEventHandler('blrp_inventory:showEnlargedImage', function(fileName, posx, posy, sizex, sizey)
  if not displayEnlargedImageRunning then
    displayEnlargedImageRunning = true
    Citizen.CreateThread(function()
      exports['mythic_notify']:PersistentAlert('start', closIdNotifId, 'inform', 'Press E to close card view')
      local pos = vector2(posx, posy)
      local cardimg = CreateRuntimeTxd("card_img")
      CreateRuntimeTextureFromImage(cardimg, "card_img", "images/"..fileName..".png")
      while displayEnlargedImageRunning do
        DrawSprite("card_img", "card_img", pos, sizex, sizey, 0.0, baseColor)
        if IsControlPressed(0, 38) then
					displayEnlargedImageRunning = false
				end
        Citizen.Wait(0)
      end
      exports['mythic_notify']:PersistentAlert('end', closIdNotifId)
    end)
  end
end)
