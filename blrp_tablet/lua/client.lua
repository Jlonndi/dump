local guiEnabled = false
local authToken = nil
local apiEndpoint = nil

local isDev = GetConvarInt('dev', -1)

if isDev == 1 then
    apiEndpoint = 'http://dev-api.blrp.net'
else
    apiEndpoint = 'http://prod-api.blrp.net'
end

RegisterNetEvent('blrp_tablet:getTabletState')
AddEventHandler('blrp_tablet:getTabletState', function(cb)
    cb(guiEnabled)
end)

function tabletAnim(boolean)
    if boolean then

        -- New way of loading props in :)
        local model = GetHashKey('prop_cs_tablet')
        TriggerEvent('core:client:addPlayerProp', model, 28422, -0.03, 0.0, 0.0, 0.0, 0.0, 0.0)

        loadModels("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a")
        TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", 3.0, -8, -1, 49, 0, 0, 0, 0 )
        Citizen.CreateThread(function()
            while guiEnabled do
                Citizen.Wait(5)
                if not IsEntityPlayingAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", 3) then
                    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", 3.0, -8, -1, 49, 0, 0, 0, 0 )
                end
            end
            ClearPedTasks(PlayerPedId())
        end)
    else
        -- New way of removing a prop
        TriggerEvent('core:client:wipeProps')
    end
end

function loadModels(model)
    if IsModelValid(model) then
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(10)
        end
    else
        while not HasAnimDictLoaded(model) do
            RequestAnimDict(model)
            Citizen.Wait(10)
        end
    end
end

RegisterNetEvent('core:client:removeUI:tablet')
AddEventHandler('core:client:removeUI:tablet', function()
    TriggerEvent('blrp_tablet:hide')
    tabletAnim(false)
end)

RegisterNetEvent('menu:forceCloseMenu')
AddEventHandler('menu:forceCloseMenu', function()
    TriggerEvent('blrp_tablet:hide')
    tabletAnim(false)
end)

function focusNUI (shouldDisplay)
    guiEnabled = shouldDisplay
    SetNuiFocus(guiEnabled, guiEnabled)
    SetNuiFocusKeepInput(shouldDisplay)
    TriggerEvent('core:client:enableInterface', 'tablet', shouldDisplay)
end

-- Register the token with the client side to send to the vue application
RegisterNetEvent('blrp_tablet:register')
AddEventHandler('blrp_tablet:register', function(token, endpointUri)
    authToken = token
    apiEndpoint = endpointUri
end)

-- Set focus and tell vue to display
RegisterNetEvent('blrp_tablet:show')
AddEventHandler('blrp_tablet:show', function()
    TriggerEvent('core:client:isInterfaceOpened', function(is_ui_opened)
        if not is_ui_opened then
            TriggerEvent('badMenu:client:hideAll')
            TriggerEvent('menu:forceCloseRadialMenu')
            focusNUI(true)
            SendNUIMessage({
                type = "tablet:toggle",
                enable = true,
                endpoint = apiEndpoint,
                token = authToken,
                position = getPositionInformation(),
            })
            tabletAnim(true)
        end
    end)
end)

-- Set focus and tell vue to display
RegisterNetEvent('blrp_tablet:ghost')
AddEventHandler('blrp_tablet:ghost', function()
    SendNUIMessage({
        type = "tablet:toggle",
        enable = true,
        token = authToken,
        ghost = true,
        endpoint = apiEndpoint,
    })
end)

-- Set focus and tell vue to hide
RegisterNetEvent('blrp_tablet:hide')
AddEventHandler('blrp_tablet:hide', function()
    focusNUI(false)
    SendNUIMessage({
        type = "tablet:toggle",
        enable = false,
    })
    tabletAnim(false)
end)

Citizen.CreateThread(function()
    -- This is just in case the resources restarted whilst the NUI is focused
    TriggerEvent('blrp_tablet:hide')

end)

----------------------------
-- Helper Functions
----------------------------

function getPositionInformation()
    local data = {}
    local pos = GetEntityCoords(PlayerPedId())
    data.current_cords = "["..pos.x..","..pos.y..","..pos.z.."]"
    data.current_street_a, data.current_street_b = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    data.current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))
    data.current_street_a = GetStreetNameFromHashKey(data.current_street_a)
    data.current_street_b = GetStreetNameFromHashKey(data.current_street_b)
    return data
end

----------------------------
-- Callbacks
----------------------------

RegisterNUICallback('escape', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    cb('ok')
end)

RegisterNUICallback('show', function(data, cb)
    TriggerEvent('blrp_tablet:show')
    cb('ok')
end)

RegisterNUICallback('printNote', function(data, cb)
    local contents = data.contents
    cb('ok')
end)

---
--- Open a stored document
---
RegisterNUICallback('openDocument', function(data, cb)
    local id = data.id
    if id == nil then return cb('error') end
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('documents:displayDocument', id)
    cb('ok')
end)


---
--- Open Evidence button for police reports
---
RegisterNUICallback('openEvidence', function(data, cb)
    local id = data.id
    if id == nil then return cb('error') end
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('blrp_inventory:openEvidence', 'pd_evidence_' .. id)
    cb('ok')
end)

---
--- Create contract for citizens and other citizens
---
RegisterNUICallback('createContract', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('vrp:client:selectTargetPlayer', 2, function(selected_ped)
        if selected_ped ~= -1 then
            local target_player = GetPlayerServerId(selected_ped)
            TriggerServerEvent('blrp_tablet:createContractWithPlayer', target_player, data)
        end
    end)
    cb('ok')
end)

RegisterNUICallback('printReport', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('printer:isNearPrinter', function(result)
        if result then
            TriggerServerEvent('core:server:printPdReport', data)
        else
            TriggerEvent('vrp:client:notify', 'Not near a printer')
        end
    end)
    cb('ok')
end)

RegisterNUICallback('printPaper', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('printer:isNearPrinter', function(result)
        if result then
            TriggerEvent('core:client:printPaper', data.id, data.title, data.content)
        else
            TriggerEvent('vrp:client:notify', 'Not near a printer')
        end
    end)
    cb('ok')
end)

RegisterNUICallback('publishPaper', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('vrp:client:notify', 'Paper *should* now be published')
    TriggerServerEvent('paper:registerContents', {
        document_id = data.id,
        document_title = data.title,
        document_contents = data.content
    })
    TriggerServerEvent('blrp_tablet:registerPapers')
    cb('ok')
end)

RegisterNUICallback('showExistingPaper', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('blrp_paper:viewExistingPaper', data.id)
    cb('ok')
end)

RegisterNUICallback('printExistingPaper', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerEvent('printer:isNearPrinter', function(result)
        if result then
            TriggerEvent('core:client:printExistingPaper', data.id, data.title)
        else
            TriggerEvent('vrp:client:notify', 'Not near a printer')
        end
    end)
    cb('ok')
end)

RegisterNUICallback('setHouseLocation', function(data, cb)
    local coords = GetEntityCoords(PlayerPedId())
    SendNUIMessage({
        type = "tablet:message",
        name = 'housing:location_callback',
        packet = {
            type = data.type,
            coords = coords,
        }
    })
end)

RegisterNUICallback('getVehicleData', function(data, cb)
  TriggerServerEvent('blrp_core:server:getVehicleData', data.term)
  cb('ok')
end)

RegisterNUICallback('getVehicleDataByDL', function(data, cb)
  TriggerServerEvent('blrp_core:server:getVehicleDataByDL', data.term)
  cb('ok')
end)

RegisterNetEvent('blrp_tablet:client:getVehicleData')
AddEventHandler('blrp_tablet:client:getVehicleData', function(vehicle)
  if vehicle ~= nil then
    local vehicleModelName = GetDisplayNameFromVehicleModel(GetHashKey(vehicle.vehicle))
    local vehicleModelNameLocalised = GetLabelText(vehicleModelName)

    if vehicleModelNameLocalised and vehicleModelNameLocalised ~= 'NULL' then
      vehicle.vehicle = vehicleModelNameLocalised
    end
  end

  SendNUIMessage({
      type = "tablet:message",
      name = 'vehicle:data_callback',
      packet = {
          vehicle = vehicle
      }
  })
end)

local exclude_vehicles = {
  ["cuban800"] = true,
  ["dodo"] = true,
  ["duster"] = true,
  ["luxor"] = true,
  ["mammatus"] = true,
  ["nimbus"] = true,
  ["shamal"] = true,
  ["velum2"] = true,
  ["buzzard2"] = true,
  ["frogger"] = true,
  ["maverick"] = true,
  ["supervolito"] = true,
  ["swift"] = true,
  ["volatus"] = true,
	["polmav"] = true,
	["polmav2"] = true,
	["predator"] = true,
	["predator2"] = true,
	["seashark2"] = true,
	["dinghy"] = true,
	["dinghy2"] = true,
	["jetmax"] = true,
	["marquis"] = true,
	["seashark"] = true,
	["speeder"] = true,
	["squalo"] = true,
	["submersible"] = true,
	["submersible2"] = true,
	["suntrap"] = true,
	["toro"] = true,
	["tropic"] = true,
	["tug"] = true,
}

RegisterNetEvent('blrp_tablet:client:getVehicleDataByDL')
AddEventHandler('blrp_tablet:client:getVehicleDataByDL', function(vehicles)
  local _vehicles = {}

  if vehicles ~= nil then
    for v_key, v_data in pairs(vehicles) do
      if not exclude_vehicles[v_data.vehicle] then
        local vehicleModelName = GetDisplayNameFromVehicleModel(GetHashKey(v_data.vehicle))
        local vehicleModelNameLocalised = GetLabelText(vehicleModelName)

        if vehicleModelNameLocalised and vehicleModelNameLocalised ~= 'NULL' then
          vehicles[v_key].vehicle = vehicleModelNameLocalised
        end

        table.insert(_vehicles, vehicles[v_key])
      end
    end
  end

  SendNUIMessage({
      type = "tablet:message",
      name = 'vehicle:data_callback_dl',
      packet = {
          vehicles = _vehicles
      }
  })
end)

RegisterNUICallback('houseInit', function(data, cb)
    TriggerServerEvent('blrp_tablet:registerHouse', data.id)
end)

RegisterNUICallback('waypointHouse', function(data, cb)
    local coords = data.coords
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('vrp:server:selfMarkGps', coords)
end)

RegisterNUICallback('sellClosest', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('core:server:sellHouseClosest', data.id)
end)

RegisterNUICallback('makeClosestCoowner', function(data, cb)
    TriggerEvent('blrp_tablet:hide')
    TriggerServerEvent('core:server:makeClosestCoowner', data.id)
end)

RegisterNUICallback('updateProperty', function(data, cb)
    TriggerServerEvent('core:server:syncSingleHouse', data)
end)
