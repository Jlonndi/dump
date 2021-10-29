--					 ==========================
--					 Copyright © 2020 SenkaWolf
--					 ==========================

if EnableChatCommand == true then

	Citizen.CreateThread(function()

			TriggerEvent('chat:addSuggestion', '/ad', 'Send an ad in game (Global Chat)', {
				{ name="Message", help="Ad Message."}
			})

	end)

	--Standard Chat
	RegisterNetEvent('SendProximityMessage')
	AddEventHandler('SendProximityMessage', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "^r" .. name .. "", {128, 128, 128}, "^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "^r" .. name .. "", {128, 128, 128}, "^r " .. message)
	  end
	end)

	--/me Command
	RegisterNetEvent('SendProximityMessageMe')
	AddEventHandler('SendProximityMessageMe', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. message)
	  end
	end)

	--/do Command
	RegisterNetEvent('SendProximityMessageDo')
	AddEventHandler('SendProximityMessageDo', function(id, name, message)
	  local myID = PlayerId()
	  local pID = GetPlayerFromServerId(id)
	  if pID == myID then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .."^7:  ".."^r  " .. message)
	  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myID)), GetEntityCoords(GetPlayerPed(pID)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255, 0, 0}, " ^9 ^*DO | " .. name .."^7:  ".."^r  " .. message)
	  end
	end)
end
