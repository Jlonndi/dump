local app = nil

local UI_MOUSE_FOCUS = true
local USER_DOCUMENTS = {}
local fontId
local CURRENT_DOCUMENT = nil
local DOCUMENT_FORMS = nil
local current_document_id = nil

local MENU_OPTIONS = {
    x = 0.5,
    y = 0.2,
    width = 0.5,
    height = 0.04,
    scale = 0.4,
    font = fontId,
    --menu_title = "Document Actions",
    menu_subtitle = 'Document Options',
    color_r = 0,
    color_g = 128,
    color_b = 255,
}


Citizen.CreateThread(function()
    TriggerEvent('core:client:require', function(pointer) app = pointer end)
    DOCUMENT_FORMS = Config.Documents['en']
    -- print(dump(DOCUMENT_FORMS))
    if Config.UseCustomFonts == true then
        RegisterFontFile(Config.CustomFontFile)
        fontId = RegisterFontId(Config.CustomFontId)
        MENU_OPTIONS.font = fontId
    else
        MENU_OPTIONS.font = 4
    end
    SetNuiFocus(false, false)
end)



RegisterNetEvent('documents:startNewForm')
AddEventHandler('documents:startNewForm', function(form_name, player_data, merge_data)
    local document = Config.Templates[form_name]
    CreateNewForm(document, player_data, merge_data)
end)

RegisterNetEvent('documents:parseFormWithoutShowing')
AddEventHandler('documents:parseFormWithoutShowing', function(form_name, player_data, merge_data)
    local document = Config.Templates[form_name]
    local auto_sign = true
    CreateNewForm(document, player_data, merge_data, auto_sign)
end)

function getLocationString()
    local properties = {}
    local playerCoords = GetEntityCoords(PlayerPedId(),  true)
    local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerCoords.x, playerCoords.y, playerCoords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local zoneNameId = GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)
    properties.location_a = street1
    properties.location_b = street2
    properties.zone = GetLabelText(zoneNameId)
    if properties.location_a and properties.location_b then
        return properties.location_a .. ' and ' .. properties.location_b .. ' (' .. properties.zone .. ') '
    end
    if properties.location_a then
        return properties.location_a .. ' (' .. properties.zone .. ') '
    end
end

function CreateNewForm(document, data, merge_data, auto_sign)
    document.id = data.id
    current_document_id = document.id
    document.headerFirstName = data.firstname
    document.headerLastName = data.lastname
    document.headerDateOfBirth = data.dob
    document.headerJobLabel = data.job_name
    document.headerJobGrade = data.rank_name
    document.headerPhone = data.phone
    document.locale = 'en'
    if merge_data then
        for _, key in pairs(document.elements) do
            local label = key.label
            if merge_data[label] then
                if label == 'LOCATION' then
                    document.elements[_].value = getLocationString()
                    document.elements[_].disabled = true
                else
                    document.elements[_].value = merge_data[label]
                    document.elements[_].disabled = true
                end
            end
        end
    end

    -- Parse and handle form without actually showing it
    if auto_sign then
        TriggerServerEvent('documents:submitDocument', document)
        current_document_id = nil
        return
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'createNewForm',
        data = document
    })
end

function ShowDocument(aPlayer)
    TriggerServerEvent('documents:ShowToPlayer', aPlayer, CURRENT_DOCUMENT)
    CURRENT_DOCUMENT = nil
    CloseMenu()
end

RegisterNetEvent('documents:viewDocument')
AddEventHandler('documents:viewDocument', function(data)
    ViewDocument(data)
end)

function ViewDocument(aDocument)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ShowDocument",
        data = aDocument
    })
end

RegisterNUICallback('form_close', function()
    SetNuiFocus(false, false)
    TriggerServerEvent('documents:cancelSubmit', current_document_id)
    current_document_id = nil

end)

RegisterNUICallback('form_submit', function(data, cb)
    TriggerServerEvent('documents:submitDocument', data)
    SetNuiFocus(false, false)
    current_document_id = nil
    cb('ok')
end)


function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players_clean = {}
    table.insert(players_clean, {
        playerName = 'playerName',
        playerId = 'playereId',
    })
    return players_clean
end


function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
