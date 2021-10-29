local guiEnabled = false

local default_options = {
    settings = {
        speed = 10; --pixels / second
        scoreWin = 1000; --Score to win
        scoreLose = -150; --Lose if this score is reached
        maxTime = 60000; --sec
        maxMistake = 5; --How many missed keys can there be before losing
        speedIncrement = 1; --How much should the speed increase when a key hit was successful
    },
    keys = {"a", "w", "d", "s", "g"}; --You can hash this out if you want to use default keys in the java side.
}

RegisterNetEvent('cd_keymaster:client:startGame')
AddEventHandler('cd_keymaster:client:startGame', function(callback_id, options)
  if not options then
    options = default_options
  end

  guiEnabled = true

  SendNUIMessage({
    action = 'start',
    settings = options.settings,
    keys = options.keys,
    callback_id = callback_id
  })

  while guiEnabled do
    Citizen.Wait(5)
    SetNuiFocus(guiEnabled, guiEnabled)
  end

  Citizen.Wait(100)
  SetNuiFocus(guiEnabled, guiEnabled)
end)

RegisterNUICallback('callback', function(data)
  TriggerServerEvent('cd_keymaster:server:callback', data.callback_id, data)

  Citizen.Wait(100)
  guiEnabled = false
end)
