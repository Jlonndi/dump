local guiEnabled = false
local current_lockpick = nil

function focusNUI (shouldDisplay)
    guiEnabled = shouldDisplay
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if guiEnabled then
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 32, true)
            DisableControlAction(0, 33, true)
            DisableControlAction(0, 34, true)
            DisableControlAction(0, 35, true)
            DisableControlAction(0, 46, true)
            if IsDisabledControlJustPressed(0, 46) then
                SendNUIMessage({
                    type = 'lockpick:hit',
                })
                Citizen.Wait(50)
            end
        end
    end
end)

-- This function is used to init a lockpick from the client only, ignores server
RegisterNetEvent('lockpick:client:startLockpickClient')
AddEventHandler('lockpick:client:startLockpickClient', function(data, callback)
    local id = math.random(1, 99999999)
    data.id = id
    current_lockpick = callback
    TriggerEvent('client:lockpick:start', data)
end)


RegisterNetEvent('client:lockpick:start')
AddEventHandler('client:lockpick:start', function(packet)
    TriggerEvent('client:lockpick:show', packet)
end)

RegisterNetEvent('client:lockpick:show')
AddEventHandler('client:lockpick:show', function(packet)
    focusNUI(true)
    SendNUIMessage({
        type = 'lockpick:show',
        enable = true,
        packet = packet,
    })
end)

RegisterNetEvent('client:lockpick:hide')
AddEventHandler('client:lockpick:hide', function()
    if guiEnabled then
        focusNUI(false)
        SendNUIMessage({
            type = 'lockpick:hide',
        })
    end
end)

-- This is just in case the resources restarted whilst the NUI is focused (for dev restarting)
Citizen.CreateThread(function()
    focusNUI(false)
    SendNUIMessage({
        type = 'lockpick:hide',
    })
end)


RegisterNUICallback('escape', function(data, cb)
    if current_lockpick then
        current_lockpick(false)
        current_lockpick = nil
    end
    TriggerEvent('client:lockpick:hide')
    cb('ok')
end)


RegisterNUICallback('died', function(data, cb)
    TriggerEvent('client:lockpick:hide')
    TriggerEvent('vrp:client:notify', 'You failed')
    if current_lockpick then
        current_lockpick(false)
        current_lockpick = nil
    end

    -- Server side callback
    TriggerServerEvent('lockpick:server:finished', data.id, false)
    cb('ok')
end)

RegisterNUICallback('right', function(data, cb)
    TriggerServerEvent('lockpick:server:tryHit')
    cb('ok')
end)

RegisterNUICallback('finished', function(data, cb)
    TriggerEvent('client:lockpick:hide')
    -- Client side callback only
    if current_lockpick then
        current_lockpick(true)
        current_lockpick = nil
        cb('ok')
        return
    end

    -- Server side callback
    TriggerServerEvent('lockpick:server:finished', data.id, true)
    cb('ok')
end)
