local cfg = module("cfg/clothing_blacklist")
local cfgBlacklistMale = cfg.blacklistMale
local cfgBlacklistFemale = cfg.blacklistFemale
-- periodic player state update

local state_ready = false
local customization_changed = false

RegisterNetEvent('vrp:client:event:lastDeath')
AddEventHandler('vrp:client:event:lastDeath', function()
  -- Just to register this handler
end)

AddEventHandler("playerSpawned",function() -- delay state recording
  SetCreateRandomCops(false)
  SetCreateRandomCopsNotOnScenarios(false)
  SetCreateRandomCopsOnScenarios(false)

  state_ready = false

  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    state_ready = true
  end)
end)

RegisterNetEvent("vRP:syncPosition")
AddEventHandler("vRP:syncPosition", function()
  local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
  if syncPos then
    vRPserver.updatePos({x,y,z})
  end
  vRPserver.updateHealth({tvRP.getHealth()})
  vRPserver.updateArmour({GetPedArmour(GetPlayerPed(-1))})
  --vRPserver.updateWeapons({tvRP.getWeapons()}) -- removed since we no longer want to store weapons with vRP
end)

local syncPos = true

RegisterNetEvent("vRP:toggleSyncPos")
AddEventHandler("vRP:toggleSyncPos", function(flag)
  syncPos = flag
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(30000)

    if IsPlayerPlaying(PlayerId()) and state_ready then
      local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
      --vRPserver.ping({})
      if syncPos then
        vRPserver.updatePos({x,y,z})
      end
      vRPserver.updateHealth({tvRP.getHealth()})
      vRPserver.updateArmour({GetPedArmour(GetPlayerPed(-1))})
      -- vRPserver.updateWeapons({tvRP.getWeapons()})
      if customization_changed then
        vRPserver.updateCustomization({tvRP.getCustomization()})
        customization_changed = false
      end
    end
  end
end)

-- WEAPONS

-- def
local weapon_types = {
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
  "WEAPON_MICROSMG",
  "WEAPON_SMG",
  "WEAPON_CARBINERIFLE",
  "WEAPON_SPECIALCARBINE",
  "WEAPON_PUMPSHOTGUN",
  "WEAPON_STUNGUN",
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
  "WEAPON_MACHINEPISTOL",
  "WEAPON_COMPACTRIFLE",
  "WEAPON_CARBINERIFLE_MK2",
  "WEAPON_GUSENBERG",
  "WEAPON_DBSHOTGUN",
  "WEAPON_MUSKET",
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
  --{"WEAPON_HEAVYPISTOL",3523564046},
  {"WEAPON_HEAVYPISTOL",-771403250},
  {"WEAPON_PISTOL50",-1716589765},
  {"WEAPON_VINTAGEPISTOL",137902532},
  {"WEAPON_PISTOL_MK2",-1075685676},
  --{"WEAPON_MACHINEPISTOL",222222222},
  --{"WEAPON_MICROSMG",222222222},
  {"WEAPON_SMG",736523883},
  {"WEAPON_CARBINERIFLE",-2084633992},
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
  {"WEAPON_MACHINEPISTOL",-619010992},
  {"WEAPON_COMPACTRIFLE",1649403952},
  {"WEAPON_MICROSMG",324215364},
  {"WEAPON_CARBINERIFLE_MK2",4208062921},
  {"WEAPON_GUSENBERG",1627465347},
  {"WEAPON_DBSHOTGUN",-275439685},
  {"WEAPON_MUSKET",-1466123874},
  {"WEAPON_MG",-1660422300},
}

function tvRP.getWeaponTypes()
  return weapon_types
end

function tvRP.getWeapons()
  local player = PlayerPedId()

  local ammo_types = {} -- remember ammo type to not duplicate ammo amount

  local weapons = {}
  for k,v in pairs(weapon_types) do
    local hash = GetHashKey(v)
    if HasPedGotWeapon(player,hash) then
      local weapon = {}
      weapons[v] = weapon

      local atype = Citizen.InvokeNative(0x7FEAD38B326B9F74, player, hash)
      if ammo_types[atype] == nil then
        ammo_types[atype] = true
        weapon.ammo = GetAmmoInPedWeapon(player,hash)
      else
        weapon.ammo = 0
      end
    end
  end

  return weapons
end

local owns_shotgun = false
local owns_smg = false
local stored_shotgun = false
local shotgun_ammo = 0
local stored_smg = false
local smg_ammo = 0

function tvRP.storeCopWeapon(weaponName)
  if weaponName ~= nil then
    weaponName = string.upper(weaponName)
    if weaponName == "WEAPON_PUMPSHOTGUN" then
      if HasPedGotWeapon(PlayerPedId(),GetHashKey(weaponName))  then
        tvRP.removeWeapon(weaponName)
      elseif (stored_shotgun or owns_shotgun) then
        giveStoredWeapon(weaponName)
      end
    elseif weaponName == "WEAPON_SMG" then
      if HasPedGotWeapon(PlayerPedId(),GetHashKey(weaponName))  then
        tvRP.removeWeapon(weaponName)
      elseif (stored_smg or owns_smg) then
        giveStoredWeapon(weaponName)
      end
    end
  end
end

function giveStoredWeapon(weaponName)
  if weaponName ~= nil then
    local player = PlayerPedId()
    weaponName = string.upper(weaponName)
    local hash = GetHashKey(weaponName)
    if weaponName == "WEAPON_PUMPSHOTGUN" and (stored_shotgun or owns_shotgun) then
      stored_shotgun = false
      GiveWeaponToPed(player, hash, shotgun_ammo, false)
      SetPedAmmo(player, hash, shotgun_ammo)
      tvRP.notify("Shotgun Received")
    elseif weaponName == "WEAPON_SMG" and (stored_smg or owns_smg) then
      stored_smg = false
      GiveWeaponToPed(player, hash, smg_ammo, false)
      SetPedAmmo(player, hash, smg_ammo)
      tvRP.notify("SMG Received")
    end
  end
end

function tvRP.removeWeapon(weaponName)
  if weaponName ~= nil then
    tvRP.setActionLock(true)
    weaponName = string.upper(weaponName)
    local player = PlayerPedId()
    local hash = GetHashKey(weaponName)
    if HasPedGotWeapon(player,hash) then
      if weaponName == "WEAPON_PUMPSHOTGUN" then
        stored_shotgun = true
        owns_shotgun = true
        shotgun_ammo = GetAmmoInPedWeapon(player, hash)
        tvRP.notify("Shotgun Removed")
      elseif weaponName == "WEAPON_SMG" then
        stored_smg = true
        owns_smg = true
        smg_ammo = GetAmmoInPedWeapon(player, hash)
        tvRP.notify("SMG Removed")
      end
      RemoveWeaponFromPed(player,hash)
      tvRP.RemoveGear(weaponName)
      SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
    end
    Citizen.Wait(1000) -- Artificial wait. Need to add progress bar
    tvRP.setActionLock(false)
  end
end

function tvRP.giveWeapons(weapons,clear_before)
  local player = PlayerPedId()

  -- give weapons to player

  if clear_before then
    tvRP.RemoveGears()
    RemoveAllPedWeapons(player,true)
  end

  for k,weapon in pairs(weapons) do
    local hash = GetHashKey(k)
    local ammo = weapon.ammo or 0

    GiveWeaponToPed(player, hash, ammo, false)
  end
end

function tvRP.removeAmmo(weapon, ammoQtyRemove)
  tvRP.setActionLock(true)
  local weaponHash = GetHashKey(weapon)
  local ped = PlayerPedId()
  local ammo = GetAmmoInPedWeapon(ped,weaponHash)
  local newQty = ammo - ammoQtyRemove
  if newQty >= 0 then
    SetPedAmmo(ped, weaponHash, newQty)
  end
  Citizen.Wait(1000) -- Artificial wait. Need to add progress bar
  tvRP.setActionLock(false)
end

function tvRP.getCurrentWeapon()
  local ped = PlayerPedId()
  local _, hash = GetCurrentPedWeapon(ped, true)
  for k,v in pairs(weapon_hashes) do
    if v[2] == hash then
      local ammo = GetAmmoInPedWeapon(ped,hash)
      return v[1], ammo
    end
  end
  return nil
end

--[[
function tvRP.dropWeapon()
  SetPedDropsWeapon(PlayerPedId())
end
--]]

-- PLAYER CUSTOMIZATION

-- parse part key (a ped part or a prop part)
-- return is_proppart, index
local function parse_part(key)
  if type(key) == "string" and string.sub(key,1,1) == "p" then
    return true,tonumber(string.sub(key,2))
  else
    return false,tonumber(key)
  end
end

function tvRP.getDrawables(part)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropDrawableVariations(PlayerPedId(),index)
  else
    return GetNumberOfPedDrawableVariations(PlayerPedId(),index)
  end
end

function tvRP.getDrawableTextures(part,drawable)
  local isprop, index = parse_part(part)
  if isprop then
    return GetNumberOfPedPropTextureVariations(PlayerPedId(),index,drawable)
  else
    return GetNumberOfPedTextureVariations(PlayerPedId(),index,drawable)
  end
end

function tvRP.getCustomization()
  local ped = PlayerPedId()

  local custom = {}

  custom.modelhash = GetEntityModel(ped)

  -- ped parts
  for i=0,20 do -- index limit to 20
    custom[i] = {GetPedDrawableVariation(ped,i), GetPedTextureVariation(ped,i), GetPedPaletteVariation(ped,i)}
  end

  -- props
  for i=0,10 do -- index limit to 10
    custom["p"..i] = {GetPedPropIndex(ped,i), math.max(GetPedPropTextureIndex(ped,i),0)}
  end

  return custom
end

-- partial customization (only what is set is changed)
function tvRP.setCustomization(custom, update) -- indexed [drawable,texture,palette] components or props (p0...) plus .modelhash or .model

  Citizen.CreateThread(function() -- new thread
    if custom then
      local ped = PlayerPedId()
      local user_id = tvRP.getMyVrpId()
      local mhash = nil

      -- model
      if custom.modelhash ~= nil then
        mhash = custom.modelhash
      elseif custom.model ~= nil then
        mhash = GetHashKey(custom.model)
      end

      ped = PlayerPedId()
      playerModel = GetEntityModel(ped)


      if mhash ~= nil and mhash ~= playerModel then
        local i = 0
        while not HasModelLoaded(mhash) and i < 10000 do
          RequestModel(mhash)
          Citizen.Wait(10)
        end

        if HasModelLoaded(mhash) then
          -- changing player model remove weapons, so save it
          local currentHealth = tvRP.getHealth()
          --local weapons = tvRP.getWeapons()
          SetPlayerModel(PlayerId(), mhash)
          --tvRP.giveWeapons(weapons,true)
          SetModelAsNoLongerNeeded(mhash)
          tvRP.setHealth(currentHealth)
        end
      end

      local hashMaleMPSkin = GetHashKey("mp_m_freemode_01")
      local hashFemaleMPSkin = GetHashKey("mp_f_freemode_01")
      -- parts
      for k,v in pairs(custom) do
        if k ~= "model" and k ~= "modelhash" then
          local itemID = 0
          local textureID = 0
          if v[1] ~= nil then
            itemID = v[1]
          end
          if v[2] ~= nil then
            textureID = v[2]
          end
          local isprop, index = parse_part(k)
          if isprop then
            if v[1] < 0 then
              ClearPedProp(ped,index)
            else
              if not tvRP.isCop() and not tvRP.isMedic() then
                if playerModel == hashMaleMPSkin then
                  if cfgBlacklistMale[k] ~= nil and cfgBlacklistMale[k][itemID] ~= nil then
                    local dataType = type(cfgBlacklistMale[k][itemID])
                    if (dataType == "boolean" and cfgBlacklistMale[k][itemID]) or (dataType == "table" and cfgBlacklistMale[k][itemID][textureID] ~= nil and cfgBlacklistMale[k][itemID][textureID]) then
                      return
                    end
                  end
                elseif playerModel == hashFemaleMPSkin then
                  if cfgBlacklistFemale[k] ~= nil and cfgBlacklistFemale[k][itemID] ~= nil then
                    local dataType = type(cfgBlacklistFemale[k][itemID])
                    if (dataType == "boolean" and cfgBlacklistFemale[k][itemID]) or (dataType == "table" and cfgBlacklistFemale[k][itemID][textureID] ~= nil and cfgBlacklistFemale[k][itemID][textureID]) then
                      return
                    end
                  end
                end
              end
              SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
            end
          else
            if index ~= 0 and index ~= 2 then
              if not tvRP.isCop() and not tvRP.isMedic() then
                if playerModel == hashMaleMPSkin then
                  if itemID == 143 and k == 1 and user_id ~= 37101 then
                    return
                  end
                  if cfgBlacklistMale[index] ~= nil and cfgBlacklistMale[index][itemID] ~= nil then
                    local dataType = type(cfgBlacklistMale[index][itemID])
                    if (dataType == "boolean" and cfgBlacklistMale[index][itemID]) or (dataType == "table" and cfgBlacklistMale[index][itemID][textureID] ~= nil and cfgBlacklistMale[index][itemID][textureID]) then
                      return
                    end
                  end
                elseif playerModel == hashFemaleMPSkin then
                  if cfgBlacklistFemale[index] ~= nil and cfgBlacklistFemale[index][itemID] ~= nil then
                    local dataType = type(cfgBlacklistFemale[index][itemID])
                    if (dataType == "boolean" and cfgBlacklistFemale[index][itemID]) or (dataType == "table" and cfgBlacklistFemale[index][itemID][textureID] ~= nil and cfgBlacklistFemale[index][itemID][textureID]) then
                      return
                    end
                  end
                end
              end
              SetPedComponentVariation(ped,index,v[1],v[2],v[3] or 2)
            end
          end
        end
      end
    end
    if update and not tvRP.isMedic() and not tvRP.isCop() then
      customization_changed = true
    end
  end)
end

function tvRP.reapplyProps(custom) -- indexed [drawable,texture,palette] components or props (p0...) plus .modelhash or .model
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    local exit = TUNNEL_DELAYED() -- delay the return values

    Citizen.CreateThread(function() -- new thread
      if custom then
        local ped = PlayerPedId()
        tvRP.playAnim(false,{{"missheistdockssetup1hardhat@","put_on_hat",1}},false)
        Citizen.Wait(1000)
        -- parts
        for k,v in pairs(custom) do
          if k ~= "model" and k ~= "modelhash" then
            local isprop, index = parse_part(k)
            if isprop then
              if v[1] < 0 then
                ClearPedProp(ped,index)
              else
                SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
              end
            end
          end
        end
      end

      exit({})
    end)
  end
end

local lastHelmet = nil
function tvRP.removeHelmet()
  if lastHelmet then return tvRP.reapplyHelmet() end
  if not tvRP.isHandcuffed() and not tvRP.getActionLock() and not tvRP.isInComa() then
    local ped = PlayerPedId()
    lastHelmet = {GetPedPropIndex(ped,0), math.max(GetPedPropTextureIndex(ped,0),0)}
    tvRP.playAnim(false,{{"veh@common@fp_helmet@","take_off_helmet_stand",1}},false)
    Citizen.Wait(500)
    ClearPedProp(PlayerPedId(), 0)
  end
end

function tvRP.reapplyHelmet()
  if lastHelmet ~= nil and lastHelmet[1] > -1 and not tvRP.isHandcuffed() and not tvRP.getActionLock() and not tvRP.isInComa() then
    tvRP.playAnim(false,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
    Citizen.Wait(1000)
    SetPedPropIndex(PlayerPedId(),0,lastHelmet[1],lastHelmet[2],lastHelmet[3] or 2)
    lastHelmet = nil
  end
end

local lastGlasses = nil
function tvRP.removeGlasses()
  if lastGlasses then return tvRP.reapplyGlasses() end
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    local ped = PlayerPedId()
    lastGlasses = {GetPedPropIndex(ped,1), math.max(GetPedPropTextureIndex(ped,1),0)}
    tvRP.playAnim(false,{{"veh@common@fp_helmet@","take_off_helmet_stand",1}},false)
    Citizen.Wait(500)
    ClearPedProp(PlayerPedId(), 1)
  end
end

function tvRP.reapplyGlasses()
  if lastGlasses ~= nil and lastGlasses[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(false,{{"missheistdockssetup1hardhat@","put_on_hat",1}},false)
    Citizen.Wait(1000)
    SetPedPropIndex(PlayerPedId(),1,lastGlasses[1],lastGlasses[2],lastGlasses[3] or 2)
  end
end

local lastMask = nil
function tvRP.removeMask(cancelAnim)
  if (not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock()) or cancelAnim then
    local ped = PlayerPedId()
    lastMask = {GetPedDrawableVariation(ped,1), GetPedTextureVariation(ped,1), GetPedPaletteVariation(ped,1)}
    if cancelAnim == nil or not cancelAnim then
      tvRP.playAnim(true,{{"missprologueig_6@first_person","remove_balaclava",1}},false)
    end
    Citizen.Wait(500)
    SetPedComponentVariation(ped, 1, 0, 0, 0)
  end
end

-- Reapply pants
function tvRP.reapplyGlasses()
  if lastGlasses ~= nil and lastGlasses[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(false,{{"missheistdockssetup1hardhat@","put_on_hat",1}},false)
    Citizen.Wait(1000)
    SetPedPropIndex(PlayerPedId(),1,lastGlasses[1],lastGlasses[2],lastGlasses[3] or 2)
  end
end

-- REMOVE Pants FUNCTIONS
-- Legs = 4
local last_pants = nil
function tvRP.removePants()
  if last_pants then return tvRP.reapplyPants() end
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    Citizen.Wait(500)
    exports['mythic_progbar']:Progress({
      name = "remove_ants",
      duration = 10000,
      label = "Removing Pants",
      useWhileDead = true,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      },
      animation = {
        animDict = "mp_safehouseshower@female@",
        anim = "shower_towel_dry_to_get_dressed",
        flags = 49,
      },
    }, function(isFailed)
      if not isFailed then
        local ped = PlayerPedId()
        last_pants = {GetPedDrawableVariation(ped, 4), GetPedTextureVariation(ped, 4), GetPedPaletteVariation(ped, 4)}
        if CheckGender() == 'male' then
          SetPedComponentVariation(ped, 4, 61, 0, 0) -- legs
        else
          SetPedComponentVariation(ped, 4, 17, 0, 0)
        end
      end
    end)
  end
end
function tvRP.reapplyPants()
  if last_pants ~= nil and last_pants[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(true,{{"mp_safehouseshower@female@","shower_towel_dry_to_get_dressed",1}},false)
    Citizen.Wait(1000)
    SetPedComponentVariation(PlayerPedId(),4,last_pants[1],last_pants[2],last_pants[3] or 2)
    last_pants = nil
  end
end

-- REMOVE Feet FUNCTIONS
-- Legs = 6
local last_shoes = nil
function tvRP.removeShoes()
  if last_shoes then return tvRP.reapplyShoes() end
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    Citizen.Wait(500)
    exports['mythic_progbar']:Progress({
      name = "remove_ants",
      duration = 3500,
      label = "Removing Shoes",
      useWhileDead = true,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      },
      animation = {
        animDict = "mp_safehouseshower@female@",
        anim = "shower_towel_dry_to_get_dressed",
        flags = 49,
      },
    }, function(isFailed)
      if not isFailed then
        local ped = PlayerPedId()
        last_shoes = {GetPedDrawableVariation(ped, 6), GetPedTextureVariation(ped, 6), GetPedPaletteVariation(ped, 6)}
        if CheckGender() == 'male' then
          SetPedComponentVariation(ped, 6, 34, 0, 0) -- Feet
        else
          SetPedComponentVariation(ped, 6, 35, 0, 0)
        end
      end
    end)
  end
end
function tvRP.reapplyShoes()
  if last_shoes ~= nil and last_shoes[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(true,{{"mp_safehouseshower@female@","shower_towel_dry_to_get_dressed",1}},false)
    Citizen.Wait(1000)
    SetPedComponentVariation(PlayerPedId(),6,last_shoes[1],last_shoes[2],last_shoes[3] or 2)
    last_shoes = nil
  end
end

--- REMOVE VEST FUNCTIONS
local lastVest = nil
function tvRP.removeVest()
  if lastVest then return tvRP.reapplyVest() end
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    Citizen.Wait(500)
    exports['mythic_progbar']:Progress({
      name = "remove_vest",
      duration = 10000,
      label = "Removing Vest",
      useWhileDead = true,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      },
      animation = {
        animDict = "mp_safehouseshower@female@",
        anim = "shower_towel_dry_to_get_dressed",
        flags = 49,
      },
    }, function(isFailed)
      if not isFailed then
        local ped = PlayerPedId()
        lastVest = {GetPedDrawableVariation(ped, 9), GetPedTextureVariation(ped, 9), GetPedPaletteVariation(ped, 9)}
        SetPedComponentVariation(ped, 9, 0, 0, 0)
      end
    end)
  end
end

function tvRP.reapplyVest()
  if lastVest ~= nil and lastVest[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(true,{{"mp_safehouseshower@female@","shower_towel_dry_to_get_dressed",1}},false)
    Citizen.Wait(1000)
    SetPedComponentVariation(PlayerPedId(),9,lastVest[1],lastVest[2],lastVest[3] or 2)
    lastVest = nil
  end
end

--- REMOVE Shirt FUNCTIONS
---Torso = jacket = 3
---Hands = hands = 5
local last_shirt = nil
local last_jacket = nil
local last_hands = nil
function tvRP.removeShirt()
  if last_jacket then return tvRP.reapplyShirt() end
  if not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    Citizen.Wait(500)
    exports['mythic_progbar']:Progress({
      name = "remove_shirt",
      duration = 6000,
      label = "Removing Shirt",
      useWhileDead = true,
      canCancel = true,
      controlDisables = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      },
      animation = {
        animDict = "mp_safehouseshower@female@",
        anim = "shower_towel_dry_to_get_dressed",
        flags = 49,
      },
    }, function(isFailed)
      if not isFailed then
        local ped = PlayerPedId()
        last_shirt = { GetPedDrawableVariation(ped, 8), GetPedTextureVariation(ped, 8), GetPedPaletteVariation(ped, 8)}
        last_hands = {GetPedDrawableVariation(ped, 3), GetPedTextureVariation(ped, 3), GetPedPaletteVariation(ped, 3)}
        last_jacket = { GetPedDrawableVariation(ped, 11), GetPedTextureVariation(ped, 11), GetPedPaletteVariation(ped, 11)}
        if CheckGender() == 'male' then
          SetPedComponentVariation(ped, 8, 15, 0, 0) -- Shirt
          SetPedComponentVariation(ped, 3, 15, 0, 0) -- hands
          SetPedComponentVariation(ped, 11, 252, 0, 0) -- Jacket
        else -- female
          SetPedComponentVariation(ped, 8, 14, 0, 0) -- Shirt
          SetPedComponentVariation(ped, 3, 4, 0, 0) -- hands
          SetPedComponentVariation(ped, 11, 5, 0, 0) -- Jacket
        end
      end
    end)
  end
end
function tvRP.reapplyShirt()
  if last_jacket ~= nil and last_jacket[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(true,{{"mp_safehouseshower@female@","shower_towel_dry_to_get_dressed",1}},false)
    Citizen.Wait(1000)
    SetPedComponentVariation(PlayerPedId(), 8, last_shirt[1], last_shirt[2], last_shirt[3] or 2)
    SetPedComponentVariation(PlayerPedId(), 3, last_hands[1], last_hands[2], last_hands[3] or 2)
    SetPedComponentVariation(PlayerPedId(), 11, last_jacket[1], last_jacket[2], last_jacket[3] or 2)
    last_jacket = nil
    last_shirt = nil
    last_hands = nil
  end
end

--- REMOVE Mask FUNCTIONS
function tvRP.reapplyMask()
  if lastMask ~= nil and lastMask[1] > -1 and not tvRP.isHandcuffed() and not tvRP.isInComa() and not tvRP.getActionLock() then
    tvRP.playAnim(true,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
    Citizen.Wait(1000)
    SetPedComponentVariation(PlayerPedId(),1,lastMask[1],lastMask[2],lastMask[3] or 2)
  end
end

function tvRP.removeTargetMask_cl()
  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped)
  local nearServId = tvRP.getNearestPlayer(2)
  if nearServId ~= -1 then
    local target = PlayerPedId(GetPlayerFromServerId(nearServId))
    if target ~= 0 and IsEntityAPed(target) then
      if HasEntityClearLosToEntityInFront(ped,target) then
        vRPserver.removeTargetMask_sv({nearServId})
        tvRP.playAnim(true,{{"ped","push_l_front",1}},false)
      end
    end
  end
end
-- fix invisible players by resetting customization every minutes

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000)
    if state_ready then
      local custom = tvRP.getCustomization()
      custom.model = nil
      custom.modelhash = nil
      tvRP.setCustomization(custom,false)
    end
  end
end)


-- PLAYER POINTING ACTION
local mp_pointing = false
local keyPressed = false

local function startPointing()
    local ped = PlayerPedId()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

local once = true
local oldval = false
local oldvalped = false

Citizen.CreateThread(function()
    while true do
        Wait(0)

        if once then
            once = false
        end
        if not tvRP.isHandcuffed() then
          if not keyPressed then
              if IsControlPressed(0, 29) and not mp_pointing and IsPedOnFoot(PlayerPedId()) then
                  Wait(200)
                  if not IsControlPressed(0, 29) then
                      keyPressed = true
                      startPointing()
                      mp_pointing = true
                  else
                      keyPressed = true
                      while IsControlPressed(0, 29) do
                          Wait(50)
                      end
                  end
              elseif (IsControlPressed(0, 29) and mp_pointing) or (not IsPedOnFoot(PlayerPedId()) and mp_pointing) then
                  keyPressed = true
                  mp_pointing = false
                  stopPointing()
              end
          end

          if keyPressed then
              if not IsControlPressed(0, 29) then
                  keyPressed = false
              end
          end
        else
          mp_pointing = false
        end

        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) and not mp_pointing then
            stopPointing()
        end
        if Citizen.InvokeNative(0x921CE12C489C4C41, PlayerPedId()) then
            if not IsPedOnFoot(PlayerPedId()) then
                stopPointing()
            else
                local ped = PlayerPedId()
                local camPitch = GetGameplayCamRelativePitch()
                if camPitch < -70.0 then
                    camPitch = -70.0
                elseif camPitch > 42.0 then
                    camPitch = 42.0
                end
                camPitch = (camPitch + 70.0) / 112.0

                local camHeading = GetGameplayCamRelativeHeading()
                local cosCamHeading = Cos(camHeading)
                local sinCamHeading = Sin(camHeading)
                if camHeading < -180.0 then
                    camHeading = -180.0
                elseif camHeading > 180.0 then
                    camHeading = 180.0
                end
                camHeading = (camHeading + 180.0) / 360.0

                local blocked = 0
                local nn = 0

                local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
                local ray = Cast_3dRayPointToPoint(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7);
                nn,blocked,coords,coords = GetRaycastResult(ray)

                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Pitch", camPitch)
                Citizen.InvokeNative(0xD5BB4025AE449A4E, ped, "Heading", camHeading * -1.0 + 1.0)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isBlocked", blocked)
                Citizen.InvokeNative(0xB0A6CFD2C69C1088, ped, "isFirstPerson", Citizen.InvokeNative(0xEE778F8C7E1142E2, Citizen.InvokeNative(0x19CAFA3C87F7C2FF)) == 4)

            end
        end
    end
end)
-- END PLAYER POINTING ACTION

--[[
-- Player crouch
local crouched = false

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(1)

        local ped = PlayerPedId()

        if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
            DisableControlAction(0, 36, true) -- INPUT_DUCK

            if (not IsPauseMenuActive() and not IsPedInAnyVehicle(PlayerPedId())) then
                if (IsDisabledControlJustPressed(0, 36)) then
                    RequestAnimSet("move_ped_crouched")

                    while (not HasAnimSetLoaded("move_ped_crouched")) do
                        Citizen.Wait(100)
                    end

                    if (crouched == true) then
                        ResetPedMovementClipset(ped, 0)
                        crouched = false
                    elseif (crouched == false) then
                        SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                        crouched = true
                    end
                end
            end
        end
    end
end)
-- end player crouch
]]--

-- Player quickfire, firedelay, drawdelay, fire delay, draw delay
local firingBlockTime = 0

-- Firing block should be handled by weapon switching
---- TODO check out firing block
Citizen.CreateThread( function()
  while true do
    Citizen.Wait(0)
    local ped = PlayerPedId()
    if (firingBlockTime > GetGameTimer()) then
      DisablePlayerFiring(ped, true) -- Disable weapon firing
      DisableControlAction(0,24,true) -- disable attack
      DisableControlAction(0,47,true) -- disable weapon
      DisableControlAction(0,58,true) -- disable weapon
      DisableControlAction(0,263,true) -- disable melee
      DisableControlAction(0,264,true) -- disable melee
      DisableControlAction(0,257,true) -- disable melee
      DisableControlAction(0,140,true) -- disable melee
      DisableControlAction(0,141,true) -- disable melee
      DisableControlAction(0,142,true) -- disable melee
      DisableControlAction(0,143,true) -- disable melee
      DisableControlAction(0,47,true) -- disable weapon
      DisableControlAction(0,58,true) -- disable weapon
      DisableControlAction(0,257,true) -- disable melee
      DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
    end
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
      if GetIsTaskActive(ped, 56) then
        firingBlockTime = GetGameTimer() + 2000
      end
    end
  end
end)
-- end player quickfire


local player_incar = false

Citizen.CreateThread(function()
  while true do
    Wait(1)
    playerPed = PlayerPedId()
    car = GetVehiclePedIsIn(playerPed, false)
    if car then
      if GetPedInVehicleSeat(car, -1) == playerPed then --Driver
        --Eject player from driver seat if restrained
        if tvRP.isHandcuffed() then
          ClearPedTasksImmediately(playerPed)
          Citizen.Wait(1)
          if tvRP.isHandcuffed() then
            if not IsEntityPlayingAnim(PlayerPedId(),"mp_arresting","idle",3) then
              if tvRP.getAllowMovement() then
                tvRP.playAnim(false,{{"mp_arresting","idle",1}},true)
              else
                tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
              end
            end
          end
        end
      end
      if car ~= 0 then
        player_incar = true
      else
        player_incar = false
      end
    else
      player_incar = true
    end
  end
end)

function tvRP.isPedInCar()
  return player_incar
end

-- Start of TP code from Default Apartment Spawn
local tpLoopContinue = true
local canTP = false
function tvRP.disableTPMark()
  Citizen.Wait(30000) -- Delay Checking, if too early, it is missed.
  local ped = PlayerPedId()
  local playerPos = GetEntityCoords(ped, true)

  if (Vdist(playerPos.x, playerPos.y, playerPos.z, 152.89125061035, -1003.552734375, -99.000007629395) > 20.0) then
    tpLoopContinue = false
  end
end

function tvRP.canUseTP(flag)
  canTP = flag
  tvRP.disableTPMark()
end

Citizen.CreateThread(function()
  while tpLoopContinue do
    Citizen.Wait(0)

    local ped = PlayerPedId()
    local playerPos = GetEntityCoords(ped, true)

    DrawMarker(22, 151.38372802734,-1007.7125244141,-98.999961853027, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0.75, 0.5, 0.75, 204, 0, 204, 128, true, true, 2, false, 0, 0, 0)
    if (Vdist(playerPos.x, playerPos.y, playerPos.z, 151.38372802734,-1007.7125244141,-98.999961853027) < 2.5) and canTP then
      tvRP.teleport(290.37805175781,-646.89154052734,42.01863861084) -- Del Perro Subway
      tpLoopContinue = false
    end
  end
end)
-- End of TP code from Default Apartment Spawn

--[[------------------------------------------------------------------------
    Remove Reticle on ADS (Third Person)
------------------------------------------------------------------------]]--
local allowed =
{
    100416529   -- SniperRifle (reticle handled in hunting)
}

function HashInTable(hash)
  for k, v in pairs(allowed) do
    if (hash == v) then
      return true
    end
  end

  return false
end

function ManageReticle()
  local ped = PlayerPedId()

  if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
    local _, hash = GetCurrentPedWeapon(ped, true)
    if hash ~= nil then
      if not HashInTable(hash) then
        HideHudComponentThisFrame(14)
      end
    end
  end
end
--[[
Citizen.CreateThread( function()
  while true do
    HideHudComponentThisFrame(1)
    HideHudComponentThisFrame(2) -- Weapon icon
    HideHudComponentThisFrame(3)
    HideHudComponentThisFrame(4)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13)
    if not IsPlayerFreeAiming(GetPlayerPed(-1)) then
      HideHudComponentThisFrame(14)
    end

    Citizen.Wait(0)
  end
end)
]]--
-- Prevent player from shuffling seats
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
      if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), 0) == PlayerPedId() then
        if GetIsTaskActive(PlayerPedId(), 165) and not IsControlPressed(0,47) then
          SetPedIntoVehicle(PlayerPedId(), GetVehiclePedIsIn(PlayerPedId(), false), 0)
        end
      end
    end
  end
end)

------------------------------------------------------------------
-- Remove weapons rewards from vehicles. Prevent known exploit
-- Removes critical hits
------------------------------------------------------------------
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    DisablePlayerVehicleRewards(PlayerPedId())
    SetPedSuffersCriticalHits(PlayerPedId(), false)
  end
end)

----------------------------------------
--- Player Tackle start
---------------------------------------
local tackleThreadStarted = false
local tackleCooldown = 0
local tackleHandicapCooldown = 0

AddEventHandler("playerSpawned",function()
    if not tackleThreadStarted then
        tackleThreadStarted = true
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if (IsControlPressed(1, 32) and IsControlPressed(1, 21)) then
                  DisableControlAction(0, 44, true)
                  if IsDisabledControlJustPressed(1, 44) and tackleCooldown <= 0 and not tvRP.isInComa() and not tvRP.isHandcuffed() then
                    if not IsPedInAnyVehicle(PlayerPedId()) then
                      local ped = PlayerPedId()
                      local pedPos = GetEntityCoords(ped, nil)
                      tackleCooldown = 10 -- seconds
                      TriggerEvent("dpemotes:clearAll")
                      TriggerEvent('gcphone:resetPhonePropState')
                      TriggerEvent('core:client:doDropHairStrand')
                      local target = tvRP.getNearestPlayer(1.5)
                      if target ~= -1 then
                        vRPserver.tackle({target})
                        --if HasEntityClearLosToEntityInFront(PlayerPedId(),target) then
                        --end
                      end
                      SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
                    end
                  end
                end
            end
        end)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(1000)
                if tackleCooldown > 0 then
                    tackleCooldown = tackleCooldown-1
                end
            end
        end)
    end
end)

-- This is applied to the victim of the tackle
function tvRP.tackleragdoll()
    if not tvRP.isHandcuffed() and not tvRP.isInComa() then
        -- Don't override any existance cooldown with a lower value
        if tackleCooldown < 2 then
          tackleCooldown = 2
        end
        SetPedToRagdoll(PlayerPedId(), 1800, 1800, 0, 0, 0, 0)
       TriggerEvent("dpemotes:clearAll")
       TriggerEvent('gcphone:resetPhonePropState')
    end
end
----------------------------------------
--- Player Tackle end
---------------------------------------

-- Register decors to be used
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if NetworkIsSessionStarted() then
					DecorRegister("SpeedBomb",  3)
          DecorRegister("OfferedDrugs",  3)
          DecorRegister("AiRevived",  3)
          DecorRegister("DestroyedClear",  2)
          DecorRegister("lockpicked",  2)
          DecorRegister("VehicleID",1)
          DecorRegister("hotwired", 2)
          return
        end
    end
end)

---------------------------------------
-- GSR Stuff start
---------------------------------------
local recently_fired = false
local gsr_countdown = 0
local gsr_cooldown = 15*60 -- minutes
local gsr_test_cooldown = 0

function tvRP.setGunFired()
  recently_fired = true
  gsr_countdown = gsr_cooldown
end

function tvRP.getGunFired()
  if gsr_test_cooldown < 1 then
    return recently_fired
  else
    return false
  end
end

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if gsr_countdown > 0 then
            gsr_countdown = gsr_countdown - 1
            if gsr_countdown < 1 then
              recently_fired = false
            end
        end
        if gsr_test_cooldown > 0 then
          gsr_test_cooldown = gsr_test_cooldown - 1
        end
    end
end)

---------------------------------------
-- Firing pin Stuff
-- Param flag: true = give pin, false = remove pin
---------------------------------------
local firingPinThreadActive = false
local unarmed_hash = GetHashKey("WEAPON_UNARMED")
function tvRP.setFiringPinState(flag)
  if flag ~= nil then
    local ped = PlayerPedId()
    if not flag then
      if not firingPinThreadActive then
        Citizen.CreateThread(function()
          firingPinThreadActive = true
          if tvRP.isCop() then
            vRPserver.removePlayerToActivePolive({})
          end
          while firingPinThreadActive do
              Wait(0)
              SetCurrentPedWeapon(ped, unarmed_hash, true)
          end
          DisablePlayerFiring(ped, false) -- Enable weapon firing
        end)
      end
    else
      if firingPinThreadActive then
        if tvRP.isCop() then
          vRPserver.addPlayerToActivePolive({})
        end
      end
      firingPinThreadActive = false
    end
  end
end

function tvRP.getFiringPinState()
  return firingPinThreadActive
end

function tvRP.applyFlashlightMod()
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
  else
    tvRP.notify("The flashlight attachement is not compatible with your item in hand.")
  end
end

local male_pd_headgear = {
  -- item id, texture id, allow texture select
  [1] = {46,0,false}, -- patrol cap
  [2] = {17,1,false}, -- motor helmet
  [3] = {49,0,false}, -- bicyle helmet
  [4] = {10,6,false}, -- ball cap
}
local female_pd_headgear = {
  -- item id, texture id, allow texture select
  [1] = {46,0,false}, -- patrol cap
  [2] = {17,1,false}, -- motor helmet
  [3] = {48,0,false}, -- bicyle helmet
  [4] = {10,2,false}, -- ball cap
}
local male_fd_headgear = {
  -- item id, texture id, allow texture select
  [1] = {9,5,false}, -- ball cap
  [2] = {45,0,true}, -- fd helmet
}
local female_fd_headgear = {
  -- item id, texture id, allow texture select
  [1] = {45,0,true}, -- fd helmet
}

RegisterNetEvent("vRP:setHeadGear")
AddEventHandler("vRP:setHeadGear", function(id, variation)
  if id ~= nil then
    local ped = PlayerPedId()
    local hashMaleMPSkin = GetHashKey("mp_m_freemode_01")
    local hashFemaleMPSkin = GetHashKey("mp_f_freemode_01")
    local currentModel = GetEntityModel(ped)
    if tvRP.isCop() then
      local current_headgear = {GetPedPropIndex(ped,0), math.max(GetPedPropTextureIndex(ped,0),0)}
      Citizen.Trace("Current headgear ID = "..current_headgear[1].." Current texture ID = "..current_headgear[2])
      if id == 0 then
        tvRP.playAnim(false,{{"veh@common@fp_helmet@","take_off_helmet_stand",1}},false)
        Citizen.Wait(500)
        ClearPedProp(ped,0)
      elseif current_headgear[1] ~= id then
        tvRP.playAnim(false,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
        Citizen.Wait(1000)
        if currentModel == hashMaleMPSkin and male_pd_headgear[id] then
          SetPedPropIndex(ped,0,male_pd_headgear[id][1],male_pd_headgear[id][2],2)
        elseif currentModel == hashFemaleMPSkin and female_pd_headgear[id] then
          SetPedPropIndex(ped,0,female_pd_headgear[id][1],female_pd_headgear[id][2],2)
        end
      end
    elseif tvRP.isMedic() then
      local current_headgear = {GetPedPropIndex(ped,0), math.max(GetPedPropTextureIndex(ped,0),0)}
      Citizen.Trace("Current headgear ID = "..current_headgear[1].." Current texture ID = "..current_headgear[2])
      if id == 0 then
        tvRP.playAnim(false,{{"veh@common@fp_helmet@","take_off_helmet_stand",1}},false)
        Citizen.Wait(500)
        ClearPedProp(ped,0)
      elseif current_headgear[1] ~= id then
        tvRP.playAnim(false,{{"veh@common@fp_helmet@","put_on_helmet",1}},false)
        Citizen.Wait(1000)
        if currentModel == hashMaleMPSkin and male_fd_headgear[id] then
          local texture = male_fd_headgear[id][2]
          if variation ~= nil and male_fd_headgear[id][3] then
            texture = variation
          end
          SetPedPropIndex(ped,0,male_fd_headgear[id][1],texture,2)
        elseif currentModel == hashFemaleMPSkin and female_fd_headgear[id] then
          local texture = female_fd_headgear[id][2]
          if variation ~= nil and female_fd_headgear[id][3] then
            texture = variation
          end
          SetPedPropIndex(ped,0,female_fd_headgear[id][1],texture,2)
        end
      end
    end
  end
end)

function tvRP.GetZoneName(x, y, z)
  local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
  return zones[GetNameOfZone(x, y, z)] or "Unknown Area"
end

local relationship_hashes = {
  "COP",
  "SECURITY_GUARD",
  "PRIVATE_SECURITY",
  "ARMY",
}

Citizen.CreateThread(function()
  AddRelationshipGroup("blrp_noAgro")
  --Make all groups consider blrp_ems a companion so they will not agro
  for _,v in pairs(relationship_hashes) do
     SetRelationshipBetweenGroups(0, GetHashKey("blrp_noAgro"), GetHashKey(v))
     SetRelationshipBetweenGroups(0, GetHashKey(v), GetHashKey("blrp_noAgro"))
  end
	SetPedRelationshipGroupHash(PlayerPedId(), GetHashKey("blrp_noAgro")) --add player to non-agro group
end)

function CheckGender()
  local hashSkinMale = GetHashKey("mp_m_freemode_01")
  local hashSkinFemale = GetHashKey("mp_f_freemode_01")
  local PlayerGender = nil
  if GetEntityModel(PlayerPedId()) == hashSkinMale then
    PlayerGender = "male"
  elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
    PlayerGender = "female"
  end

  return PlayerGender
end

RegisterNetEvent('vrp:client:playerPkg')
AddEventHandler('vrp:client:playerPkg', function(cbr)
  local Task = cbr
  local pkg = tvRP.playerDataPkg()
  Task(pkg)
end)

function tvRP.playerDataPkg()
  local pkg = {
    isCop = tvRP.isCop(),
    copLevel = tvRP.getCopLevel(),
    isDoj = tvRP.isDoj(),
    isMedic = tvRP.isMedic(),
    emergencyLevel = tvRP.getEmergencyLevel(),
    isInComa = tvRP.isInComa(),
    isHandcuffed = tvRP.isHandcuffed(),
    isZiptied = tvRP.isZiptied(),
  }
  return pkg
end
