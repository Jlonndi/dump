RegisterNetEvent("mythic_progbar:client:serverProcess")
AddEventHandler("mythic_progbar:client:serverProcess", function(action, finish, actionId)
	if actionId then
		action.id = actionId -- set the action ID from the proxy
	end
	Progress(action, nil)
end)


RegisterNetEvent("mythic_progbar:client:progress")
AddEventHandler("mythic_progbar:client:progress", function(action, finish)
	Process(action, nil, nil, finish)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithStartEvent")
AddEventHandler("mythic_progbar:client:ProgressWithStartEvent", function(action, start, finish)
	Process(action, start, nil, finish)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithTickEvent")
AddEventHandler("mythic_progbar:client:ProgressWithTickEvent", function(action, tick, finish)
	Process(action, nil, tick, finish)
end)

RegisterNetEvent("mythic_progbar:client:ProgressWithStartAndTick")
AddEventHandler("mythic_progbar:client:ProgressWithStartAndTick", function(action, start, tick, finish)
	Process(action, start, tick, finish)
end)

RegisterNetEvent("mythic_progbar:client:cancel")
AddEventHandler("mythic_progbar:client:cancel", function()
	Cancel()
end)

RegisterNUICallback('actionFinish', function(data, cb)
	Finish()
end)

RegisterNUICallback('skillCheckFailed', function(data, cb)
	FinishSkillCheck(false)
end)

RegisterNUICallback('skillCheckPassed', function(data, cb)
	FinishSkillCheck(true)
end)