local menuOpen = false

RegisterNetEvent('cb_vaulthack:client:startGame')
AddEventHandler('cb_vaulthack:client:startGame', function(callback_id)
	local health = 1

	if not menuOpen then
		menuOpen = true
		SendNUIMessage({
			menu = 'open',
			health = health,
			callback_id = callback_id
		})

		SetNuiFocus(true, true)
	end
end)

RegisterNUICallback('menuClose', function(data)
	TriggerServerEvent('cb_vaulthack:server:callback', data.callback_id, data)

	closeMenu()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		closeMenu()
	end
end)

function closeMenu()
	SetNuiFocus(false, false)
	menuOpen = false
end
