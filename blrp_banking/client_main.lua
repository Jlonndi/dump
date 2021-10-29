local core = nil

TriggerEvent('core:client:require', function(pointer)
	core = pointer
end)

AddEventHandler('core:client:restart', function(pointer)
  if core ~= nil then
    core = pointer
  end
end)

-- Data transfer

RegisterNetEvent('blrp_banking:client:setData')
AddEventHandler('blrp_banking:client:setData', function(type, data)
	SendNUIMessage({
 		command = 'interface:setData',
		type = type,
		data = data
	})
end)

RegisterNetEvent('banking:updateCashBalance')
AddEventHandler('banking:updateCashBalance', function(balance)
	SendNUIMessage({
 		command = 'interface:setData',
		type = 'cash',
		data = balance
	})
end)

-- NUI related stuff

local guiVisible = false

RegisterNetEvent('blrp_banking:client:setInterfaceVisibility')
AddEventHandler('blrp_banking:client:setInterfaceVisibility', function(visible, access_type)
	if visible or guiVisible then
		guiVisible = visible
		SetNuiFocus(visible, visible)
		SendNUIMessage({
			command = 'interface:setVisible',
			visible = visible,
			access_type = access_type,
		})
	end
end)

RegisterNetEvent('blrp_banking:client:sendTransactionError')
AddEventHandler('blrp_banking:client:sendTransactionError', function(message)
	SendNUIMessage({
		command = 'interface:transactionError',
		message = message
	})
end)

Citizen.CreateThread(function()
	TriggerEvent('blrp_banking:client:setInterfaceVisibility', false)
end)

AddEventHandler('menu:forceCloseMenu', function()
	TriggerEvent('blrp_banking:client:setInterfaceVisibility', false)
end)

RegisterNUICallback('escape', function(data, callback)
  TriggerEvent('blrp_banking:client:setInterfaceVisibility', false)
  callback('ok')
end)

RegisterNUICallback('getTransactions', function(data, callback)
  TriggerServerEvent('blrp_banking:server:openTransactions', data.account_number)
  callback('ok')
end)

RegisterNUICallback('doTransaction', function(data, callback)
	TriggerServerEvent('blrp_banking:server:doTransaction', data)
	callback('ok')
end)
