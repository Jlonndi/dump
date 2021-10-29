
local function TableContainsValue(tbl, val)
    for _, value in ipairs(tbl) do 
        if value == val then 
            return true
        end
    end
    return false
end

CreateThread(function()
    local plyId = PlayerId()
    local defaultPedModel = `a_m_y_skater_01`

    while true do 
        Wait(250)
        local ped = PlayerPedId()

        -- Vehicle Blacklist
        local vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle ~= 0 then 
            local model = GetEntityModel(vehicle)
            if TableContainsValue(Config.BlacklistedVehicles, model) then 
                DeleteEntity(vehicle)
            end
        end

        -- Weapon Blacklist
        local _, weapon = GetCurrentPedWeapon(ped, true)
        if TableContainsValue(Config.BlacklistedWeapons, weapon) then 
            RemoveWeaponFromPed(ped, weapon)
        end

        -- Ped Blacklist
        local pedModel = GetEntityModel(ped)
        if TableContainsValue(Config.BlacklistedPeds, pedModel) then 
            RequestModel(defaultPedModel)
            while not HasModelLoaded(defaultPedModel) do
                Wait(100)
            end
            SetPlayerModel(plyId, defaultPedModel)
            SetModelAsNoLongerNeeded(defaultPedModel)
        end
    end
end)