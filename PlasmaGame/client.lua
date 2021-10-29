-- You can modify this to use your own Notification system
function notification(msg,typeOfNotif)
	if typeOfNotif == "success" then
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~g~"..msg)
		DrawNotification(true, false)

	elseif typeOfNotif == "info" then
		SetNotificationTextEntry("STRING")
		AddTextComponentString(msg)
		DrawNotification(true, false)

	elseif typeOfNotif == "error" then
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~r~"..msg)
		DrawNotification(true, false)
	end

end

local PaintBallShop =  {
	{name="PaintBall", id=73, x=-1095.1264648438,y=-1269.3354492188,z=5.8505229949951,h=39.195293426514, typeM = "create"},
	{name="PaintBall", id=73, x=-1098.5012207031,y=-1270.7672119141,z=5.8445701599121,h=28.779960632324, typeM = "join"},
	{name="PaintBall", id=73, x=-1087.3604736328,y=-1264.7006835938,z=5.8445706367493,h=26.560817718506, typeM = "join"}
}

local outCoords = {x=-1098.0637207031,y=-1273.4953613281,z=5.8445663452148-1.0,h=305.61968994141}
local blueCoords = {x=-1183.4421386719,y=-1251.1754150391,z=-79.970603942871-1.0,h=342.79510498047}
local redCoords = {x=-1120.9388427734,y=-1225.8797607422,z=-79.970520019531-1.0,h=166.67802429199}
local blipCoords = {x=-1084.7562255859,y=-1280.9090576172,z=5.6599960327148,h=233.31866455078}
local mapRedOutCoords = {x=-1121.7076416016,y=-1231.3385009766,z=-79.970596313477,h=176.43196105957}
local mapBlueOutCoords = {x=-1183.0317382812,y=-1242.7570800781,z=-79.970611572266,h=2.2128314971924}
local GunName = "WEAPON_PLASMAP"

--Table de correpondance
-- Rappel Indice :
--0 Face          Tête
--1 Mask          Masque
--2 Hair          Cheveux
--3 Torso         Bras
--4 Legs          Pantalons
--5 Bags          Parachute
--6 Feet          Chaussures
--7 Accessories   Accessoires (colliers)
--8 Undershirt    T-shirt
--9 Body Armor    Gilet
--10 Decals       Marquages/Logos
--11 Tops         Vestes




--Specifique AURORA
-- local TenuFemme = {
-- [3] = {model = 8, colorA = 0, colorB = 0},
-- [4] = {model = 123, colorA = 2, colorB = 1},
-- [6] = {model = 96, colorA = 2, colorB = 1},

-- [7] = {model = 0, colorA = 0, colorB = 0},
-- [8] = {model = 8, colorA = 0, colorB = 0},
-- [11] = {model = 304, colorA = 2, colorB = 1}

-- }

-- local TenuHomme = {
-- [3] = {model = 7, colorA = 0, colorB = 0},
-- [4] = {model = 120, colorA = 2, colorB = 1},
-- [6] = {model = 80, colorA = 3, colorB = 5},

-- [7] = {model = 0, colorA = 0, colorB = 0},
-- [8] = {model = 15, colorA = 0, colorB = 0},
-- [11] = {model = 296, colorA = 2, colorB = 1},
-- }

--If you Want to change the team outfit modify this :
local TenuFemme = {
	[3] = {model = 8, colorA = 0, colorB = 0},
	[4] = {model = 98, colorA = 2, colorB = 1},
	[6] = {model = 71, colorA = 2, colorB = 1},

	[7] = {model = 0, colorA = 0, colorB = 0},
	[8] = {model = 8, colorA = 0, colorB = 0},
	[11] = {model = 254, colorA = 2, colorB = 1}

}

local TenuHomme = {
	[3] = {model = 7, colorA = 0, colorB = 0},
	[4] = {model = 95, colorA = 2, colorB = 1},
	[6] = {model = 68, colorA = 2, colorB = 1},

	[7] = {model = 0, colorA = 0, colorB = 0},
	[8] = {model = 15, colorA = 0, colorB = 0},
	[11] = {model = 246, colorA = 2, colorB = 1},
}

--Custom Mask :
local useCustomMask = false

local MaskFemme = {
	[1]={model = 107, colorA = 7, colorB = 1},
	[2]={model = 108, colorA = 0, colorB = 1}
}

local MaskHomme = {
	[1]={model = 107, colorA = 7, colorB = 1},
	[2]={model = 108, colorA = 0, colorB = 1}
}

Citizen.CreateThread(function()
	blip=AddBlipForCoord(blipCoords.x,blipCoords.y,blipCoords.z)

	SetBlipSprite(blip, 650)
	SetBlipScale(blip, 0.8)
	SetBlipColour(blip, 2)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("PlasmaGame")
	EndTextCommandSetBlipName(blip)
end)

--Dont Touch This
local playerTenu = {
	[3] = {model = 0, color = 2},
	[4] = {model = 0, color = 2},
	[6] = {model = 0, color = 3},

	[7] = {model = 0, color = 2},
	[8] = {model = 0, color = 2},
	[11] = {model = 0, color = 2}
}

local playerMask = {model = 0, color = 2}

-- Dont touch This
local isCostumed = false
local isCurrentlyInGame = false
local isCurrentlyOutInGame = false
local currentTeam = "none"
local currentPartie = 0
local isLockWaiting = false

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

function teleport(coords)
	local xrand = math.random(-1000,1000) / 1000
	local yrand = math.random(-1000,1000) / 1000
	SetEntityCoords(PlayerPedId(),coords.x+xrand,coords.y+yrand,coords.z+1)
end

incircle = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		for k,v in ipairs(PaintBallShop) do
			if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 15.0)then
				DrawMarker(3, v.x, v.y, v.z , 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,165, 0, 0, 0,0)
				if(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) < 1.0)then
					if (incircle == false) then
						if v.typeM == "create" then
							DisplayHelpText("Press ~INPUT_CONTEXT~ to create a Lobby.")
						else
							DisplayHelpText("Press ~INPUT_CONTEXT~ to join a Lobby.")
						end
					end
					incircle = true
					if IsControlJustReleased(1, 51) then
						if v.typeM == "create" then
							EnableGui(true)
						else
							TriggerServerEvent("PaintBall:GetAllSessions")
						end
					end
				elseif(Vdist(pos.x, pos.y, pos.z, v.x, v.y, v.z) > 3.0)then
					incircle = false
				end
			end
		end
	end
end)

local incircleRed = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if(Vdist(pos.x, pos.y, pos.z, mapRedOutCoords.x, mapRedOutCoords.y, mapRedOutCoords.z) < 5.0)then
			DrawMarker(3, mapRedOutCoords.x, mapRedOutCoords.y, mapRedOutCoords.z , 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,165, 0, 0, 0,0)
			if(Vdist(pos.x, pos.y, pos.z, mapRedOutCoords.x, mapRedOutCoords.y, mapRedOutCoords.z) < 1.0)then
				if (incircleRed == false) then
					DisplayHelpText("Press ~INPUT_CONTEXT~ to leave the game.")
				end
				incircleRed = true
				if IsControlJustReleased(1, 51) then
					TriggerServerEvent("PaintBall:LeaveTheGame",currentPartie)
				end
			elseif(Vdist(pos.x, pos.y, pos.z, mapRedOutCoords.x, mapRedOutCoords.y, mapRedOutCoords.z) > 3.0)then
				incircleRed = false
			end
		end
	end
end)

local incircleBlue = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		if(Vdist(pos.x, pos.y, pos.z, mapBlueOutCoords.x, mapBlueOutCoords.y, mapBlueOutCoords.z) < 5.0)then
			DrawMarker(3, mapBlueOutCoords.x, mapBlueOutCoords.y, mapBlueOutCoords.z , 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,165, 0, 0, 0,0)
			if(Vdist(pos.x, pos.y, pos.z, mapBlueOutCoords.x, mapBlueOutCoords.y, mapBlueOutCoords.z) < 1.0)then
				if (incircleRed == false) then
					DisplayHelpText("Press ~INPUT_CONTEXT~ to leave the game.")
				end
				incircleRed = true
				if IsControlJustReleased(1, 51) then
					TriggerServerEvent("PaintBall:LeaveTheGame",currentPartie)
				end
			elseif(Vdist(pos.x, pos.y, pos.z, mapBlueOutCoords.x, mapBlueOutCoords.y, mapBlueOutCoords.z) > 3.0)then
				incircleRed = false
			end
		end
	end
end)

function EnableGui(state)
	SetNuiFocus(state, state)
	guiEnabled = state
	SendNUIMessage({
		type = "enableui",
		enable = state
	})
end

RegisterNUICallback('escape', function(data, cb)
	EnableGui(false)
end)

RegisterNUICallback('validate', function(data, cb)
	local reason = ""
	EnableGui(false)
	for theData, value in pairs(data) do
		if theData == "sessionname" then
			if value == "" or value == nil then
				reason = "Invalid session name!"
				break
			end
		elseif theData == "creatorname" then
			if value == "" or value == nil then
				reason = "Invalid Nickname!"
				break
			end
		end
	end
	if reason == "" then
		TriggerServerEvent("PaintBall:NewSession",data)
		notification("Lobby created. It will be deleted in 3 minutes if not launched","success")
	else
		notification(reason,"error")
	end
end)

local configs = {
	positionX   = "90%",
	positionY   = "20%",
	size        = "0.55", -- size in proportion
	maxHeight   = "80vh", -- maximum menu size ( recommended from 30vh to 80vh )

	itemColor = "rgba(0, 0, 0, 0.8)", -- background color of the items
	itemSelectedColor = "rgba(92, 1, 1, 1.0)", -- background color of the selected item

	-- text1Color = "whitesmoke", -- title text color
	text1Color = "rgb(206, 0, 0)",
	text2Color = "rgb(206, 206, 206)" -- description text color
}

local CurrentOpenedMenu = "Main"
local allSession = {}

function JoinBlue(idx)
	TriggerServerEvent("PaintBall:JoinBlue",idx)
end

function JoinRed(idx)
	TriggerServerEvent("PaintBall:JoinRed",idx)
end

function StartTheGame(idx)
	TriggerServerEvent("PaintBall:StartTheGame",idx)
end

RegisterNetEvent("PaintBall:SendAllSessions")
AddEventHandler('PaintBall:SendAllSessions', function(data)
	allSession = {}
	allSession = data
	openMenuMain(allSession)
end)


RegisterNetEvent("PaintBall:Notif")
AddEventHandler('PaintBall:Notif', function(data,typeOfNotif)
	notification(data,typeOfNotif)
end)

_menuPool = MenuPool.New()
mainMenu = UIMenu.New("Plasma Game", "~b~Lobby")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled (false);
_menuPool:MouseEdgeEnabled (false);
_menuPool:ControlDisablingEnabled(false);

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		_menuPool:ProcessMenus()
	end
end)


local newitem = {}
local blueitem = {}
local reditem = {}
local launchitem = {}

function openMenuMain(data)
	mainMenu = UIMenu.New("Plasma Game", "~b~Lobby")
	_menuPool:Add(mainMenu)
	_menuPool:MouseControlsEnabled (false);
	_menuPool:MouseEdgeEnabled (false);
	_menuPool:ControlDisablingEnabled(false);
	for k,v in pairs(allSession) do
		if v.CurStat == "WaitingPeople" then

			newitem[k] = _menuPool:AddSubMenu(mainMenu, "Join "..tostring(v.creator).."'s lobby")

			EquipeBleu = v.EquipA
			EquipeRouge = v.EquipB

			blueitem[k] = UIMenuItem.New("Join Blue ".. tostring(#EquipeBleu) .."/"..tostring(v.nbpersequip), "")
			newitem[k]:AddItem(blueitem[k])

			reditem[k] = UIMenuItem.New("Join Red ".. tostring(#EquipeRouge) .."/"..tostring(v.nbpersequip), "")
			newitem[k]:AddItem(reditem[k])

			if GetPlayerFromServerId(k) ~= -1 then
				if GetPlayerPed(GetPlayerFromServerId(k)) == PlayerPedId() then
					launchitem[k] = UIMenuItem.New("Start the Game", "Only creator can launch the game")
					newitem[k]:AddItem(launchitem[k])
				end
			end

			newitem[k].OnItemSelect = function(sender, item, index)

				newitem[k]:Visible(false)

				for k2,v2 in pairs(blueitem) do
					if v2 == item then
						JoinBlue(k)
					end
				end

				for k2,v2 in pairs(reditem) do
					if v2 == item then
						JoinRed(k)
					end
				end

				for k2,v2 in pairs(launchitem) do
					if v2 == item then
						StartTheGame(k)
					end
				end
			end
		end
	end
	mainMenu:Visible(true)
end

function switchTenu(color)
	local sex
	local ped = PlayerPedId()
	if IsPedModel(ped,GetHashKey('mp_m_freemode_01')) then
		sex = "men"
	elseif IsPedModel(ped,GetHashKey('mp_f_freemode_01')) then
		sex = "women"
	end

	if not isCostumed then -- Si n' pas sa tenue
		playerTenu[11].model = GetPedDrawableVariation(ped,11)
		playerTenu[11].color = GetPedTextureVariation(ped,11)

		playerTenu[4].model = GetPedDrawableVariation(ped,4)
		playerTenu[4].color = GetPedTextureVariation(ped,4)

		playerTenu[6].model = GetPedDrawableVariation(ped,6)
		playerTenu[6].color = GetPedTextureVariation(ped,6)

		playerTenu[7].model = GetPedDrawableVariation(ped,7)
		playerTenu[7].color = GetPedTextureVariation(ped,7)

		playerTenu[8].model = GetPedDrawableVariation(ped,8)
		playerTenu[8].color = GetPedTextureVariation(ped,8)

		playerTenu[3].model = GetPedDrawableVariation(ped,3)
		playerTenu[3].color = GetPedTextureVariation(ped,3)
		if sex == "men" then
			if color == "blue" then
				isCostumed = true
				for k,v in pairs(TenuHomme) do
					SetPedComponentVariation(ped,k,v.model,v.colorA,2)
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					SetPedComponentVariation(PlayerPedId(), 1, MaskHomme[randMath].model, MaskHomme[randMath].colorA, 0)
				end
			elseif color == "red" then
				isCostumed = true
				for k,v in pairs(TenuHomme) do
					SetPedComponentVariation(ped,k,v.model,v.colorB,2)
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					SetPedComponentVariation(PlayerPedId(), 1, MaskHomme[randMath].model, MaskHomme[randMath].colorB, 0)
				end
			else
				-- print("error color must be specified")
			end
		else
			if color == "blue" then
				isCostumed = true
				for k,v in pairs(TenuFemme) do
					SetPedComponentVariation(ped,k,v.model,v.colorA,2)
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					SetPedComponentVariation(PlayerPedId(), 1, MaskFemme[randMath].model, MaskFemme[randMath].colorA, 0)
					-- MaskHomme()
				end
			elseif color == "red" then
				isCostumed = true
				for k,v in pairs(TenuFemme) do
					SetPedComponentVariation(ped,k,v.model,v.colorB,2)
				end
				if useCustomMask then
					local randMath = math.random(1,2)
					playerMask.model = GetPedDrawableVariation(PlayerPedId(), 1)
					playerMask.color = GetPedTextureVariation(PlayerPedId(), 1)
					SetPedComponentVariation(PlayerPedId(), 1, MaskFemme[randMath].model, MaskFemme[randMath].colorB, 0)
				end
			else
				-- print("error color must be specified")
			end
		end
	else
		isCostumed = false
		for k,v in pairs(playerTenu) do
			SetPedComponentVariation(ped,k,v.model,v.color,2)
		end
		if useCustomMask then
			SetPedComponentVariation(PlayerPedId(), 1, playerMask.model, playerMask.color, 0)
		end
	end
end

function startGame(color,idx,manche)
	isCurrentlyOutInGame = false
	local activity = {}
	isLockWaiting = true

	if color == "red" then
		activity.x = redCoords.x
		activity.y = redCoords.y
		activity.z = redCoords.z
	elseif color == "blue" then
		activity.x = blueCoords.x
		activity.y = blueCoords.y
		activity.z = blueCoords.z
	end
	DoScreenFadeOut(1000)

	Citizen.Wait(2000)
	switchTenu(color)

	teleport(activity)
	GiveWeaponToPed(PlayerPedId(),GetHashKey(GunName),250,false,true)
	ClearPedBloodDamage(PlayerPedId())
	ResetPedVisibleDamage(PlayerPedId())
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)

	isCurrentlyInGame = true
	isCurrentlyOutInGame = false
	currentTeam = color
	currentPartie = idx

	Citizen.CreateThread(function()
		while isCurrentlyInGame do
			if GetSelectedPedWeapon(PlayerPedId()) ~= `WEAPON_PLASMAP` then
				GiveWeaponToPed(PlayerPedId(),GetHashKey('WEAPON_PLASMAP'),250,false,true)
			end
			Wait(0)
		end
		RemoveWeaponFromPed(PlayerPedId(),GetHashKey('WEAPON_PLASMAP'))
	end)

	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString("~g~Round : "..tostring(manche))
			PushScaleformMovieFunctionParameterString("Don't shoot your allies !")
			PopScaleformMovieFunctionVoid()
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		local temps = 0
		while temps < 500 do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			temps = temps + 1
		end
		Citizen.Wait(500)
		FreezeEntityPosition(PlayerPedId(),false)
		isLockWaiting = false
	end)
end

function startNextGame(color,idx,manche)
	isCurrentlyOutInGame = false
	isLockWaiting = true
	local activity = {}
	FreezeEntityPosition(PlayerPedId(),true)
	if color == "red" then
		activity.x = redCoords.x
		activity.y = redCoords.y
		activity.z = redCoords.z
	elseif color == "blue" then
		activity.x = blueCoords.x
		activity.y = blueCoords.y
		activity.z = blueCoords.z
	end
	DoScreenFadeOut(1000)

	Citizen.Wait(2000)
	teleport(activity)
	GiveWeaponToPed(PlayerPedId(),GetHashKey(GunName),250,false,true)
	ClearPedBloodDamage(PlayerPedId())
	ResetPedVisibleDamage(PlayerPedId())
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)

	isCurrentlyInGame = true
	isCurrentlyOutInGame = false
	currentTeam = color
	currentPartie = idx

	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString("~g~Round : "..tostring(manche))
			PushScaleformMovieFunctionParameterString("Don't shoot your allies !")
			PopScaleformMovieFunctionVoid()
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		local temps = 0
		while temps < 500 do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			temps = temps + 1
		end
		Citizen.Wait(500)
		FreezeEntityPosition(PlayerPedId(),false)
		isLockWaiting = false
	end)
end



function endTheGame(winner)
	local activity = {}
	local message = ""
	local message1 = ""
	isCurrentlyOutInGame = false
	if winner == "tie" then
		message = "~y~Tie"
	else
		if winner == currentTeam then
			message = "~g~Victory !"
		else
			message = "~r~Defeat !"
		end
	end
	DoScreenFadeOut(1000)

	Citizen.Wait(2000)
	switchTenu(color)
	teleport(outCoords)
	RemoveWeaponFromPed(PlayerPedId(),GetHashKey(GunName))
	ClearPedBloodDamage(PlayerPedId())
	ResetPedVisibleDamage(PlayerPedId())
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)

	isCurrentlyInGame = false
	isCurrentlyOutInGame = false
	currentTeam = "none"
	currentPartie = 0
	FreezeEntityPosition(PlayerPedId(),false)
	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString(message)
			PushScaleformMovieFunctionParameterString(message1)
			PopScaleformMovieFunctionVoid()
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		local temps = 0
		while temps < 500 do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			temps = temps + 1
		end
		FreezeEntityPosition(PlayerPedId(),false)
		isLockWaiting = false
	end)
end

function leaveTheGame(winner)
	local activity = {}
	local message = "Fearful !"
	local message1 = "Flee is not a solution"
	isCurrentlyOutInGame = false

	DoScreenFadeOut(1000)

	Citizen.Wait(2000)
	if isCostumed then
		switchTenu(color)
	end
	teleport(outCoords)
	RemoveWeaponFromPed(PlayerPedId(),GetHashKey(GunName))
	ClearPedBloodDamage(PlayerPedId())
	ResetPedVisibleDamage(PlayerPedId())
	Citizen.Wait(1000)
	DoScreenFadeIn(1000)

	isCurrentlyInGame = false
	isCurrentlyOutInGame = false
	currentTeam = "none"
	currentPartie = 0
	FreezeEntityPosition(PlayerPedId(),false)
	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString(message)
			PushScaleformMovieFunctionParameterString(message1)
			PopScaleformMovieFunctionVoid()
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		local temps = 0
		while temps < 500 do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			temps = temps + 1
		end
		FreezeEntityPosition(PlayerPedId(),false)
		isLockWaiting = false
	end)
end


Citizen.CreateThread(function()
	while true do
		Wait(0)
		if HasPedBeenDamagedByWeapon(PlayerPedId(),GetHashKey(GunName),0) then
			if not isCurrentlyOutInGame then
				isCurrentlyOutInGame = true
				SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1.0)
				TriggerServerEvent("PaintBall:addPoint",currentTeam,currentPartie)
				FreezeEntityPosition(PlayerPedId(),true)
				isLockWaiting = true
				Wait(3000)
				if currentTeam == "red" then
					isLockWaiting = true
					activity = {}
					activity.x = redCoords.x
					activity.y = redCoords.y
					activity.z = redCoords.z-1.0

					teleport(activity)
				elseif currentTeam == "blue" then
					isLockWaiting = true
					activity = {}

					activity.x = blueCoords.x
					activity.y = blueCoords.y
					activity.z = blueCoords.z-1.0

					teleport(activity)
				end
				ClearEntityLastDamageEntity(PlayerPedId())
			end
		end
	end
end)



Citizen.CreateThread(function()
	while true do
		Wait(0)
		if isLockWaiting then
			DisablePlayerFiring(PlayerPedId(),true)
		end
	end
end)



RegisterNetEvent('PaintBall:GoToNextMancheMSG')
AddEventHandler('PaintBall:GoToNextMancheMSG', function(winner)
	FreezeEntityPosition(PlayerPedId(),true)
	isLockWaiting = true
	local message = "Empty String"
	local message2 = ""

	if winner == "tie" then
		message = "~y~Tie !"
	else
		if winner == currentTeam then
			message = "~g~You win !"
		else
			message = "~r~You lose !"
		end
	end

	Citizen.CreateThread(function()
		function Initialize(scaleform)
			local scaleform = RequestScaleformMovie(scaleform)

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(0)
			end
			PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
			PushScaleformMovieFunctionParameterString(message)
			PushScaleformMovieFunctionParameterString(message2)
			PopScaleformMovieFunctionVoid()
			return scaleform
		end
		scaleform = Initialize("mp_big_message_freemode")
		local temps = 0
		while temps < 500 do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			temps = temps + 1
		end
		FreezeEntityPosition(PlayerPedId(),false)
	end)
end)

RegisterNetEvent('PaintBall:GoForTheNextGame')
AddEventHandler('PaintBall:GoForTheNextGame', function(color,idx,manche)
	startNextGame(color,idx,manche)
end)


RegisterNetEvent('PaintBall:GoForStartTheGame')
AddEventHandler('PaintBall:GoForStartTheGame', function(color,idx,manche)
	startGame(color,idx,manche)
end)

RegisterNetEvent('PaintBall:GoToFinMatchMSG')
AddEventHandler('PaintBall:GoToFinMatchMSG', function(winner)
	endTheGame(winner)
end)

RegisterNetEvent('PaintBall:GoToLeaveMatchMSG')
AddEventHandler('PaintBall:GoToLeaveMatchMSG', function(winner)
	leaveTheGame(winner)
end)

RegisterNetEvent('PaintBall:Test')
AddEventHandler('PaintBall:Test', function(color,idx,manche)
	-- print("hfdkjigsbgskgsbk")
end)
