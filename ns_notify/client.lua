function sendNotify(title, message, time, type)

	-- if GetCurrentResourceName() ~= 'nightstudio_notify' then
	-- 	SendNUIMessage({
	-- 		action = 'open',
	-- 		type = 'error',
	-- 		message = 'You dont have permission to rename this resource.',
	-- 		time = 10000,
	-- 	})
	-- else
		SendNUIMessage({
			action = 'open',
			title = title,
			type = type,
			message = message,
			time = time,
		})
	-- end

end


RegisterNetEvent('ns_notify:sendNotify')
AddEventHandler('ns_notify:sendNotify', function(title, message, time, type)
	sendNotify(title, message, time, type)
end)

