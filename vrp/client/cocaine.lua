--[[
    -- Filename: cocaine.lua
    -- Author: speed
    -- Description: Serves as a method to allow processing cocaine
    --              Lob equipment must be maintained to produce quality cocaine
    --              0 errors = pure cocaine, 1 error = poor quality cocaine
    --              2+ errors = no cocaine
    --              Heat: 10,000-50,000
    --              Acid: 2pH-7pH
]]--
local taskInProgress = false
local labPowerEnabled = true

local units = {
    ["heat"] = 0,
    ["coca_paste"] = 0,
    ["final_product"] = 0,
    ["inv_acid"] = 0,
    ["tank_acid"] = 7,
    ["processing_on"] = 0,
}

local final_product = {
    ["pure"] = 0,
    ["poor"] = 0
}

local function taskAnimation()
    Citizen.CreateThread(function()
        taskInProgress = true
        local animation = {true,{{"mp_common","givetake2_a",1}},false}
        tvRP.playAnim(animation[1],animation[2],animation[3])
        tvRP.setActionLock(true)
        Citizen.Wait(2000)
        tvRP.stopAnim(animation[1])
        tvRP.setActionLock(false)
        taskInProgress = false
    end)
end

local function addUnit(unit,increment)
    if not taskInProgress then
        if unit == "tank_acid" then
            if units["inv_acid"] > 0 and units["tank_acid"] > increment then
                taskAnimation()
                units["inv_acid"] = units["inv_acid"] - increment
                units["tank_acid"] = units["tank_acid"] - increment
            end
        elseif units[unit] < increment*5 then
            if unit == "coca_paste" then
                vRPserver.hasCocaPaste({}, function(ok)
                    if ok then
                        taskAnimation()
                        units["coca_paste"] = units["coca_paste"]+1
                    else
                        tvRP.notify("You do not have any Coca Paste.")
                    end
                end)
            else
                taskAnimation()
                units[unit] = units[unit]+increment
            end
        end
    end
end

local function takeFinalProduct()
    if units["final_product"] > 0 then
        taskAnimation()
        vRPserver.giveCocaine({"cocaine2",final_product["pure"]})
        vRPserver.giveCocaine({"cocaine1",final_product["poor"]})
        final_product["pure"] = 0
        final_product["poor"] = 0
    end
end

local function mixCement()
    if not taskInProgress then
        vRPserver.hasCocaPasteIngredients({}, function(ok)
            if ok then
                taskAnimation()
                vRPserver.mixCocaPasteIngredients({})
            else
                tvRP.notify("You do not have the ingredients to make Coca Paste")
            end
        end)
    end
end

local function cleanLab()
    taskAnimation()
    vRPserver.broadcastCleanLab({}, function(ok)
        tvRP.notify("You have cleaned the lab.")
    end)
end

function tvRP.setCocaineLabPowerStatus(status)
    labPowerEnabled = status
    if not status then
        units["processing_on"] = 0
    end
end

function tvRP.cleanCocaineLab()
    final_product = {
        ["pure"] = 0,
        ["poor"] = 0
    }

    units = {
        ["heat"] = 0,
        ["coca_paste"] = 0,
        ["final_product"] = 0,
        ["inv_acid"] = 0,
        ["tank_acid"] = 7,
        ["processing_on"] = 0,
    }
end

local function toggleLabPower()
    taskAnimation()
    if labPowerEnabled == true then
        vRPserver.broadcastCocaineLabPowerStatus({false})
    else
        vRPserver.broadcastCocaineLabPowerStatus({true})
    end
end

local function toggleProcessing()
    taskAnimation()
    if units["processing_on"] == 0 then
        vRPserver.setPlayersProcessing({1})
        units["processing_on"] = 1
    else
        vRPserver.setPlayersProcessing({-1})
        units["processing_on"] = 0
    end
end

local function produceCocaine()
    local errors = 0
    if units["coca_paste"] == 0 then
        tvRP.notify("The machine does not have any Coca Paste to process.")
        return
    elseif units["tank_acid"] < 2 then
        tvRP.notify("The solution is too acidic.")
        errors = errors + 1
    elseif units["tank_acid"] > 7 then
        tvRP.notify("The solution is too basic.")
        errors = errors + 1
    elseif units["heat"] > 50000 then
        tvRP.notify("The solution is too hot.")
        errors = errors + 1
    elseif units["heat"] < 10000 then
        tvRP.notify("The solution is too cold.")
        errors = errors + 1
    end

    units["coca_paste"] = units["coca_paste"] - 1
    if errors == 0 then
        tvRP.notify("Produced pure cocaine")
        final_product["pure"] = final_product["pure"] + 1
    elseif errors == 1 then
        tvRP.notify("Produced poor cocaine")
        final_product["poor"] = final_product["poor"] + 1
    else
        tvRP.notify("The Cocaine was ruined.")
    end
end

local tasks = {
    [1] = {
        pos = {961.6506, -1150.344, -2.625481},
        description = "Mix Cement/Coca",
        action = mixCement,
        unit = nil,
        unit_increment = nil
    },
    [2] = {
        pos = {965.3694, -1150.124, -2.30193},
        description = "Add Coca Paste",
        action = addUnit,
        unit = "coca_paste",
        unit_increment = 1
    },
    [3] = {
        pos = {963.6115, -1153.327, -2.654922},
        description = "Apply Heat",
        action = addUnit,
        unit = "heat",
        unit_increment = 10000
    },
    [4] = {
        pos = {960.3622, -1146.094, -2.900759},
        description = "Collect Final Product",
        action = takeFinalProduct,
        unit = "final_product",
        unit_increment = 1
    },
    [5] = {
        pos = {964.853, -1142.252, -3.020903},
        description = "Reduce pH",
        action = addUnit,
        unit = "tank_acid",
        unit_increment = 1
    },
    [6] = {
        pos = {959.8847, -1157.248, -3.20077},
        description = "Collect Acid",
        action = addUnit,
        unit = "inv_acid",
        unit_increment = 2
    },
    [7] = {
        pos = {965.7438, -1145.165, -2.587357},
        description = "Turn Processing On/Off",
        action = toggleProcessing,
        unit = "processing_on",
        unit_increment = 0
    },
    [8] = {
        pos = {965.7438, -1145.165, -100.0}, -- Not used
        description = "Turn Power On/Off",
        action = toggleLabPower,
        unit = "power",
        unit_increment = nil
    }
}

local tasks_cop = {
    [8] = {
        pos = {965.7438, -1145.165, -100.0}, -- Not used
        description = "Turn Power On/Off",
        action = toggleLabPower,
        unit = "power",
        unit_increment = nil
    },
    [100] = {
        pos = {960.3622, -1146.094, -2.900759},
        description = "Clean Lab Equipment",
        action = cleanLab,
        unit = nil,
        unit_increment = nil
    }
}

Citizen.CreateThread(function()
    local cooldown = 1000
    while true do
        Citizen.Wait(cooldown)

        local t_tasks = tasks
        if(tvRP.isCop()) then
            t_tasks = tasks_cop
        end

        units["final_product"] = final_product["pure"] + final_product["poor"]
        -- Skill Check, reduce lab resources over time
        if units["tank_acid"] < 14 then
            units["tank_acid"] = units["tank_acid"] + 0.0004
        end
        if units["heat"] > 0 then
            units["heat"] = units["heat"] - 2
        end

        local player_coords = GetEntityCoords(PlayerPedId(), true)

        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
        if #(player_coords - vector3(962.122, -1151.068, -3.085)) < 20.0 then
            cooldown = 0
            for k,task in pairs(t_tasks) do
                local distance = #(player_coords - vector3(task.pos[1], task.pos[2], task.pos[3]))

                if distance <= 2 then
                    if not taskInProgress then
                        DisplayHelpText("Press ~INPUT_CONTEXT~ to "..task.description)
                    end
                    if task.unit_increment == nil then
                        if task.unit == "power" then
                            if labPowerEnabled == true then
                                tvRP.DrawText3d(task.pos[1],task.pos[2],task.pos[3],task.description,0.35,0,255,0)
                            else
                                tvRP.DrawText3d(task.pos[1],task.pos[2],task.pos[3],task.description,0.35,255,0,0)
                            end
                        else
                            tvRP.DrawText3d(task.pos[1],task.pos[2],task.pos[3],task.description,0.35)
                        end
                    else
                        tvRP.DrawText3d(task.pos[1],task.pos[2],task.pos[3],task.description.." ("..units[task.unit]..")",0.35)
                    end
                    if IsControlJustReleased(1, 51) then
                        task.action(task.unit,task.unit_increment)
                    end
                end
            end
        else
            cooldown = 1000
            if units["processing_on"] == 1 then
                vRPserver.setPlayersProcessing({-1})
                units["processing_on"] = 0
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        if units["processing_on"] == 1 then
            if labPowerEnabled == true then
                produceCocaine()
            else
                tvRP.notify("The lab's power has been disabled! Fix it!")
            end
        end
    end
end)
