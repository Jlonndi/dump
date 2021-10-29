RegisterNUICallback('printDocument', function(data, cb)
    local id = data.id
    if id == nil then return cb('error') end
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('core:client:printDocument', id)
    cb('ok')
end)