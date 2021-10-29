local Keys = {
	["E"] = 38
}
-- this module define some police tools and functions

local handcuffed = false
local shackled = false
local ziptied = false
local cop = false
local copLevel = 0
-- set player as cop (true or false)
function tvRP.setCop(flag, training)
	if training == nil then
		training = false
	end
	SetPedAsCop(PlayerPedId(),flag)
	cop = flag
	if cop then
		escortThread()
		restrainThread()
		vRPserver.addPlayerToActivePolive({training})
		TriggerEvent("CustomScripts:setCop",true)
		TriggerEvent('chat:addSuggestion', '/headgear', 'Change current head gear.',{{name = "id", help = "Number"}})
		--cop = flag
	else
		-- Remove cop weapons when going off duty
		RemoveWeaponFromPed(PlayerPedId(),0x678B81B1) -- WEAPON_NIGHTSTICK
		RemoveWeaponFromPed(PlayerPedId(),0x3656C8C1) -- WEAPON_STUNGUN
		RemoveWeaponFromPed(PlayerPedId(),0x5EF9FEC4) -- WEAPON_COMBATPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0xD205520E) -- WEAPON_HEAVYPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0x1D073A89) -- WEAPON_PUMPSHOTGUN
		RemoveWeaponFromPed(PlayerPedId(),0x2BE6766B) -- WEAPON_SMG
		RemoveWeaponFromPed(PlayerPedId(),0x83BF0278) -- WEAPON_CARBINERIFLE
		RemoveWeaponFromPed(PlayerPedId(),0xC0A3098D) -- WEAPON_SPECIALCARBINE
		RemoveWeaponFromPed(PlayerPedId(),0x34A67B97) -- WEAPON_PETROLCAN
		RemoveWeaponFromPed(PlayerPedId(),0x497FACC3) -- WEAPON_FLARE
		--tvRP.RemoveGear("WEAPON_PUMPSHOTGUN")
		--tvRP.RemoveGear("WEAPON_SMG")
		--tvRP.RemoveGear("WEAPON_CARBINERIFLE")
		--tvRP.RemoveGear("WEAPON_SPECIALCARBINE")
		vRPserver.removePlayerToActivePolive({training})
		TriggerEvent("CustomScripts:setCop",false)
		TriggerEvent('chat:removeSuggestion', '/headgear')
	end
end

function tvRP.setBailiff(flag)
	SetPedAsCop(PlayerPedId(),flag)
	cop = flag
	if cop then
		escortThread()
		restrainThread()
		vRPserver.addPlayerToActiveDOC({})
		TriggerEvent("CustomScripts:setCop",true)
		TriggerEvent('chat:addSuggestion', '/headgear', 'Change current head gear.',{{name = "id", help = "Number"}})
		--cop = flag
	else
		-- Remove cop weapons when going off duty
		RemoveWeaponFromPed(PlayerPedId(),0x678B81B1) -- WEAPON_NIGHTSTICK
		RemoveWeaponFromPed(PlayerPedId(),0x3656C8C1) -- WEAPON_STUNGUN
		RemoveWeaponFromPed(PlayerPedId(),0x5EF9FEC4) -- WEAPON_COMBATPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0xD205520E) -- WEAPON_HEAVYPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0x1D073A89) -- WEAPON_PUMPSHOTGUN
		RemoveWeaponFromPed(PlayerPedId(),0x2BE6766B) -- WEAPON_SMG
		RemoveWeaponFromPed(PlayerPedId(),0x83BF0278) -- WEAPON_CARBINERIFLE
		RemoveWeaponFromPed(PlayerPedId(),0xC0A3098D) -- WEAPON_SPECIALCARBINE
		RemoveWeaponFromPed(PlayerPedId(),0x34A67B97) -- WEAPON_PETROLCAN
		RemoveWeaponFromPed(PlayerPedId(),0x497FACC3) -- WEAPON_FLARE
		tvRP.RemoveGear("WEAPON_PUMPSHOTGUN")
		tvRP.RemoveGear("WEAPON_SMG")
		tvRP.RemoveGear("WEAPON_CARBINERIFLE")
		tvRP.RemoveGear("WEAPON_SPECIALCARBINE")
		vRPserver.removePlayerToActiveDOC({})
		TriggerEvent("CustomScripts:setCop",false)
		TriggerEvent('chat:removeSuggestion', '/headgear')
	end
end

function tvRP.setEventSecurity(flag)
	SetPedAsCop(PlayerPedId(),flag)
	cop = flag
	if cop then
		escortThread()
		restrainThread()
		vRPserver.addPlayerToActiveDOC({})
		TriggerEvent("CustomScripts:setCop",true)
		TriggerEvent('chat:addSuggestion', '/headgear', 'Change current head gear.',{{name = "id", help = "Number"}})
		--cop = flag
	else
		-- Remove cop weapons when going off duty
		RemoveWeaponFromPed(PlayerPedId(),0x678B81B1) -- WEAPON_NIGHTSTICK
		RemoveWeaponFromPed(PlayerPedId(),0x3656C8C1) -- WEAPON_STUNGUN
		RemoveWeaponFromPed(PlayerPedId(),0x5EF9FEC4) -- WEAPON_COMBATPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0xD205520E) -- WEAPON_HEAVYPISTOL
		RemoveWeaponFromPed(PlayerPedId(),0x1D073A89) -- WEAPON_PUMPSHOTGUN
		RemoveWeaponFromPed(PlayerPedId(),0x2BE6766B) -- WEAPON_SMG
		RemoveWeaponFromPed(PlayerPedId(),0x83BF0278) -- WEAPON_CARBINERIFLE
		RemoveWeaponFromPed(PlayerPedId(),0xC0A3098D) -- WEAPON_SPECIALCARBINE
		RemoveWeaponFromPed(PlayerPedId(),0x34A67B97) -- WEAPON_PETROLCAN
		RemoveWeaponFromPed(PlayerPedId(),0x497FACC3) -- WEAPON_FLARE
		tvRP.RemoveGear("WEAPON_PUMPSHOTGUN")
		tvRP.RemoveGear("WEAPON_SMG")
		tvRP.RemoveGear("WEAPON_CARBINERIFLE")
		tvRP.RemoveGear("WEAPON_SPECIALCARBINE")
		vRPserver.removePlayerToActiveDOC({})
		TriggerEvent("CustomScripts:setCop",false)
		TriggerEvent('chat:removeSuggestion', '/headgear')
	end
end

function tvRP.isCop()
	return cop
end

function tvRP.setCopLevel(level)
	copLevel = tonumber(level)
end

function tvRP.getCopLevel()
	return copLevel or 0
end

-- HANDCUFF

function tvRP.toggleHandcuff()
	handcuffed = not handcuffed
	TriggerEvent("customscripts:handcuffed", handcuffed)
	ClearPedSecondaryTask(PlayerPedId())
	tvRP.UnSetProned()
	tvRP.UnSetCrouch()
	SetEnableHandcuffs(PlayerPedId(), handcuffed)
	tvRP.closeMenu()
	TriggerEvent('gcphone:forceClose')
	if handcuffed then
		if tvRP.getTransformerLock() then
			vRPserver.leaveArea({tvRP.getCurrentTransformer()})
		end
		TriggerEvent("dpemotes:clearAll")
		--tvRP.playAnim(false,{{"mp_arrest_paired","crook_p2_back_right",1}},false)
		tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
		tvRP.setActionLock(true)
		shackled = false
		ziptied = false
		TriggerEvent('chat:setHandcuffState', true)
		TriggerEvent('blrp_inventory:hide')
		TriggerEvent('core:client:registerCharacterState', 'handcuffed', true)
		TriggerEvent('core:client:registerCharacterState', 'shackled', false)
		TriggerEvent('core:client:registerCharacterState', 'ziptied', false)
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5.0, 'cuff', 0.1)
	else
		tvRP.stopAnim(false)
		tvRP.stopAnim(true)
		SetPedStealthMovement(PlayerPedId(),false,"")
		shackled = false
		TriggerEvent('core:client:registerCharacterState', 'shackled', false)
		TriggerEvent('core:client:registerCharacterState', 'handcuffed', false)
		TriggerEvent('core:client:registerCharacterState', 'ziptied', false)
		tvRP.setActionLock(false)
		TriggerEvent('chat:setHandcuffState',false)
	end
	tvRP.closeMenu()
	TriggerEvent('gcphone:forceClose')
end

function tvRP.setHandcuffed(flag)
	if handcuffed ~= flag then
		tvRP.toggleHandcuff()
	end
end

function tvRP.isHandcuffed()
	return handcuffed
end

AddEventHandler('vrp:client:checkHandcuffedOrComa', function(callback)
	callback(tvRP.isInComa() or handcuffed)
end)

function tvRP.isZiptied()
	return ziptied
end

function tvRP.isHandcuffedorDead()
	local isInComa = tvRP.isInComa()
	return handcuffed, isInComa
end

function tvRP.setAllowMovement(flag)
	shackled = flag
	tvRP.stopAnim(false)
	tvRP.stopAnim(true)
	if flag then
		tvRP.playAnim(false,{{"mp_arresting","idle",1}},true)
	else
		tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
	end
end

function tvRP.getAllowMovement()
	return shackled
end

function tvRP.putInNearestVehicleAsPassenger(radius)
	local veh = GetClosestVehicle(radius)

	if IsEntityAVehicle(veh) and veh ~= -1 then
		for i=1,math.max(GetVehicleMaxNumberOfPassengers(veh),3) do
			if IsVehicleSeatFree(veh,i) then
				TaskWarpPedIntoVehicle(PlayerPedId(),veh,i)
				local carPedisIn = GetVehiclePedIsIn(playerPed, false)
				if carPedisIn ~= nil and carPedisIn == veh and handcuffed then
					tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
				end
				return true
			end
		end
	end

	return false
end

function tvRP.putInNearestVehicleAsPassengerBeta(radius)
	local player = PlayerPedId()
	local vehicle = GetClosestVehicle(radius)

	if IsEntityAVehicle(vehicle) and vehicle ~= -1 then
		for i=1,math.max(GetVehicleMaxNumberOfPassengers(vehicle),3) do
			if IsVehicleSeatFree(vehicle,i) then
				ClearPedTasks(player)
				TaskWarpPedIntoVehicle(player,vehicle,i)
				tvRP.stopEscort()
				local carPedisIn = GetVehiclePedIsIn(player, false)
				if carPedisIn ~= nil and carPedisIn == vehicle then
					tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
				end
				return true
			end
		end
	end

	return false
end

function tvRP.pullOutNearestVehicleAsPassenger(radius)
	local veh = GetClosestVehicle(radius)
	if IsEntityAVehicle(veh) and veh ~= -1 then
		tvRP.ejectVehicle()
	end
	return false
end

function tvRP.putInNetVehicleAsPassenger(net_veh)
	local veh = NetworkGetEntityFromNetworkId(net_veh)
	if IsEntityAVehicle(veh) then
		for i=1,GetVehicleMaxNumberOfPassengers(veh) do
			if IsVehicleSeatFree(veh,i) then
				SetPedIntoVehicle(PlayerPedId(),veh,i)
				return true
			end
		end
	end
end

function tvRP.putInVehiclePositionAsPassenger(x,y,z)
	local veh = tvRP.getVehicleAtPosition(x,y,z)
	if IsEntityAVehicle(veh) then
		for i=1,GetVehicleMaxNumberOfPassengers(veh) do
			if IsVehicleSeatFree(veh,i) then
				SetPedIntoVehicle(PlayerPedId(),veh,i)
				return true
			end
		end
	end
end

function tvRP.adminImpound()
	player = PlayerPedId()
	vehicle = GetVehiclePedIsIn(player, false)
	px, py, pz = table.unpack(GetEntityCoords(player, true))
	coordA = GetEntityCoords(player, true)
	local plate = nil
	local carName = nil
	impounded = false
	tvRP.selectTargetVehicle(5, function(vehicle)
		if vehicle ~= -1 then
			carModel = GetEntityModel(vehicle)
			carName = GetDisplayNameFromVehicleModel(carModel)
			plate = GetVehicleNumberPlateText(vehicle)
			args = tvRP.stringsplit(plate)
			if args ~= nil then
				plate = args[1]
				local nid = NetworkGetNetworkIdFromEntity(vehicle)
				--SetEntityAsMissionEntity(vehicle, true, true)
				--DeleteVehicle(vehicle)
				TriggerServerEvent('core:server:unregisterOwnedVehicle', plate)
				vRPserver.setVehicleOutStatusPlate({plate,string.lower(carName),0,0})
				vRPserver.deleteVehicle_sv({nid})
				tvRP.removePlateFromList(plate)
			else
				tvRP.notify("No Vehicle Nearby.")
				return
			end
		end
	end)
end

function tvRP.impoundVehicle()
	player = PlayerPedId()
	vehicle = GetVehiclePedIsIn(player, false)
	px, py, pz = table.unpack(GetEntityCoords(player, true))
	coordA = GetEntityCoords(player, true)
	local plate = nil
	local carName = nil
	impounded = false
	tvRP.selectTargetVehicle(5, function(vehicle)
		if vehicle ~= -1 then
			carModel = GetEntityModel(vehicle)
			carName = GetDisplayNameFromVehicleModel(carModel)
			plate = GetVehicleNumberPlateText(vehicle)
			args = tvRP.stringsplit(plate)
			if args ~= nil then
				plate = args[1]
				local nid = NetworkGetNetworkIdFromEntity(vehicle)
				--SetEntityAsMissionEntity(vehicle, true, true)
				--DeleteVehicle(vehicle)
				vRPserver.setVehicleOutStatusPlate({plate,string.lower(carName),0,1})
				vRPserver.deleteVehicle_sv({nid})
				tvRP.removePlateFromList(plate)
				TriggerServerEvent('core:server:unregisterOwnedVehicle', plate)
				TriggerServerEvent('core:server:tryRemoveFromTrunk', nil, plate)
			else
				tvRP.notify("No Vehicle Nearby.")
				return
			end
		end
	end)
end

-- keep handcuffed animation
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if handcuffed and not vRPcustom.isBeingCarried({}) and not tvRP.isInComa() then
			if not IsEntityPlayingAnim(PlayerPedId(),"mp_arresting","idle",3) then
				if shackled and not IsPedInAnyVehicle(PlayerPedId(),false) then
					tvRP.playAnim(false,{{"mp_arresting","idle",1}},true)
				else
					tvRP.playAnim(true,{{"mp_arresting","idle",1}},true)
				end
			end
		end
	end
end)

-- force stealth movement while handcuffed (prevent use of fist and slow the player)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if handcuffed then
			--SetPedStealthMovement(PlayerPedId(),true,"")
			DisableControlAction(0,24,true) -- disable attack
			DisableControlAction(0,25,true) -- disable aim
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,263,true) -- disable melee
			DisableControlAction(0,264,true) -- disable melee
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,140,true) -- disable melee
			DisableControlAction(0,141,true) -- disable melee
			DisableControlAction(0,142,true) -- disable melee
			DisableControlAction(0,143,true) -- disable melee
			DisableControlAction(0,36,true) -- disable exit duck
			DisableControlAction(0,47,true) -- disable weapon
			DisableControlAction(0,58,true) -- disable weapon
			DisableControlAction(0,257,true) -- disable melee
			DisableControlAction(0,44,true) -- disable cover
			DisableControlAction(0,22,true) -- disable cover
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
			if not ziptied then
				DisableControlAction(0,23,true) -- disable exit vehicle
				DisableControlAction(27,23,true) -- disable exit vehicle
				DisableControlAction(0,75,true) -- disable exit vehicle
				DisableControlAction(27,75,true) -- disable exit vehicle
				DisableControlAction(0,21,true) -- disable sprint
			end
		end
		-- Clean up weapons that ai drop (https://pastebin.com/8EuSv2r1)
		RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
		RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
		RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
		RemoveAllPickupsOfType(0x88EAACA7) -- golfclub
	end
end)

-- JAIL

local jail = nil

-- jail the player in a no-top no-bottom cylinder
function tvRP.jail(x,y,z,radius)
	tvRP.teleport(x,y,z) -- teleport to center
	jail = {x+0.0001,y+0.0001,z+0.0001,radius+0.0001}
	tvRP.setFriendlyFire(false)
	tvRP.setAllowMovement(false)
	TriggerEvent('chat:setJailState',true)
end

-- unjail the player
function tvRP.unjail()
	jail = nil
	tvRP.setFriendlyFire(true)
	TriggerEvent('chat:setJailState',false)
end

function tvRP.isJailed()
	return jail
end

-- Prison (time based)
local prison = nil
local prisonTime = 0

RegisterNetEvent('vrp:client:prison')
AddEventHandler('vrp:client:prison', function(time)
	tvRP.prison(time)
end)

function tvRP.prison(time)
	local x = 1766.9271240234
	local y = 2488.5393066406
	local z = 45.740699768066
	local radius = 5
	jail = nil -- release from HQ cell
	prison = {x+0.0001,y+0.0001,z+0.0001,radius+0.0001}
	TriggerEvent('core:client:registerCharacterState', 'in_prison', true)
	tvRP.teleport(x,y,z) -- teleport to center
	prisonTime = time * 60
	tvRP.setHandcuffed(false)
	TriggerEvent('chat:setPrisonState',true)
	TriggerServerEvent('core:server:prison:syncTime', time)
end

RegisterNetEvent('vrp:client:unprison')
AddEventHandler('vrp:client:unprison', function()
	leavePrison()
end)

-- unprison the player
function tvRP.unprison()
	prison = nil
	TriggerEvent('core:client:registerCharacterState', 'in_prison', false)
	prisonTime = 0
	local ped = PlayerPedId()
	local x = 1851.0986328125
	local y = 2586.0791015625
	local z = 45.672046661377
	tvRP.teleport(x,y,z) -- teleport to center
	TriggerEvent('chat:setPrisonState',false)
end

function tvRP.isInPrison()
	return prison
end

RegisterNetEvent('vrp:client:getPrisonTime')
AddEventHandler('vrp:client:getPrisonTime', function(cb)
  cb(prisonTime)
end)

RegisterNetEvent('vrp:client:setPrisonTime')
AddEventHandler('vrp:client:setPrisonTime', function(time)
	if not prison then return end

	prisonTime = time * 60
	local timeLeft = prisonTime/60
	vRPserver.updatePrisonTime({timeLeft})
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30000)
		if prison then
			local ped = PlayerPedId()
			TriggerEvent("izone:isPlayerInZone", "prisonPen", function(cb)
				if cb ~= nil and not cb then
					SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
					SetEntityCoordsNoOffset(ped,prison[1],prison[2],prison[3],true,true,true)
				end
			end)
			RemoveAllPedWeapons(ped, true)
			if IsPedInAnyVehicle(ped, false) then
				ClearPedTasksImmediately(ped)
			end
			if math.floor(prisonTime) <= 0 and allowShowPrompt then
				vRPserver.updatePrisonTime({0})
				promptPrisonLeave()
			else
				local timeLeft = prisonTime/60
				vRPserver.updatePrisonTime({timeLeft})
			end
		end
	end
end)

function leavePrison()
	displayPrompt = false
	allowShowPrompt = true
	prison = nil
	TriggerEvent('core:client:registerCharacterState', 'in_prison', false)
	tvRP.unprison()
	vRPserver.updatePrisonTime({0})
end

local displayPrompt = false
local allowShowPrompt = true

function promptPrisonLeave()
	allowShowPrompt = false
	if not displayPrompt then
		Citizen.CreateThread(function()
			displayPrompt = true
			exports['mythic_notify']:PersistentAlert('start', prisonLeavePrmpt, 'inform', 'Press [Y] to leave prison<br>Press [N] to remain in prison.')
			while displayPrompt do
				if IsControlPressed(0, 246) then
					displayPrompt = false
					leavePrison()
				elseif IsControlPressed(0, 249) then
					displayPrompt = false
				end
				Citizen.Wait(0)
			end
			exports['mythic_notify']:PersistentAlert('end', prisonLeavePrmpt)
			allowShowPrompt = true
		end)
	end
end

Citizen.CreateThread(function() -- prison time decrease thread
	while true do
		Citizen.Wait(1000)
		if prison then
			if prisonTime > 0 then
				prisonTime = prisonTime-1
			end
		end
	end
end)

RegisterNetEvent("vrp:client:leaveprison")
AddEventHandler("vrp:client:leaveprison", function()
	if not prison then
		tvRP.notify('The DOC does not have any paperwork on you, so they will not let you leave')
		return
	end

	if prisonTime > 0 then
		tvRP.notify('You still have time remaining on your sentence')
		return
	end

	leavePrison()
end)

-- Escort

local otherPed = 0
local escort = false

RegisterNetEvent('vrp:client:police:toggleEscort')
AddEventHandler('vrp:client:police:toggleEscort', function(other_source)
	tvRP.toggleEscort(other_source)
end)

function tvRP.toggleEscort(pl)
	otherPed = GetPlayerPed(GetPlayerFromServerId(pl))
	escort = not escort
	TriggerEvent('core:client:registerCharacterState', 'being_escorted', escort)
	if escort then escortPlayer() end
end

RegisterNetEvent('vrp:client:police:stopEscort')
AddEventHandler('vrp:client:police:stopEscort', function()
	tvRP.stopEscort()
end)

function tvRP.stopEscort()
	escort = false
	TriggerEvent('core:client:registerCharacterState', 'being_escorted', false)
	otherPed = 0
end

function tvRP.getIsBeingEscorted()
	return escort
end

function escortPlayer()
	Citizen.CreateThread(function()
		while escort do
			Citizen.Wait(0)
			local myped = PlayerPedId()
			AttachEntityToEntity(myped, otherPed, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		end
		DetachEntity(PlayerPedId(), true, false)
	end)
end

function restrainThread()
	Citizen.CreateThread(function()
		while cop do
			Citizen.Wait(10)
			local ped = PlayerPedId()
			local nearServId = tvRP.getNearestPlayer(2)
			if nearServId ~= -1 then
				local target = GetPlayerPed(GetPlayerFromServerId(nearServId))
				if target ~= 0 and IsEntityAPed(target) and (IsEntityPlayingAnim(target,"random@mugging3","handsup_standing_base",3) or IsEntityPlayingAnim( target, "random@arrests@busted", "idle_a", 3 )) then
					if HasEntityClearLosToEntityInFront(ped,target) then
						DisplayHelpText("Press ~g~E~s~ to restrain")
						if IsControlJustReleased(1, Keys['E']) then
							vRPserver.restrainPlayer({nearServId})
						end
					end
				end
			end
		end
	end)
end

function escortThread()
	Citizen.CreateThread(function()
		while cop do
			Citizen.Wait(10)
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			local nearServId = tvRP.getNearestPlayer(2)
			if nearServId ~= -1 and not IsPedInAnyVehicle(ped, true) then
				local target = GetPlayerPed(GetPlayerFromServerId(nearServId))
				if target ~= 0 and IsEntityAPed(target) and IsEntityPlayingAnim(target,"mp_arresting","idle",3) and not IsPedInAnyVehicle(target, true) then
					if HasEntityClearLosToEntityInFront(ped,target) then
						DisplayHelpText("Press ~g~E~s~ to escort")
						if IsControlJustReleased(1, Keys['E']) then
							vRPserver.escortPlayer({nearServId})
						end
					end
				end
			end
		end
	end)
end


-- WANTED

-- wanted level sync
local robbingBank = false

function tvRP.robbingBank(status)
	robbingBank = status
	if not status then
		SetPlayerWantedLevel(PlayerId(),0,false)
		SetPlayerWantedLevelNow(PlayerId(),false)
	end
end

-- update wanted level
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--ClearPlayerWantedLevel(PlayerId())
		SetPlayerWantedLevel(GetPlayerPed(-1),0,false)
		SetPlayerWantedLevelNow(GetPlayerPed(-1),false)
	end
end)

-- Hands up action by pressing X
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(1, 323) then --Start holding X
			if not IsEntityDead(PlayerPedId()) and not handcuffed and not tvRP.isInComa() then
				TriggerEvent('blrp_inventory:client:ForceDisarm')
				TriggerEvent('gundraw:client:holsterWeapon')
				if ( IsEntityPlayingAnim( PlayerPedId(), "random@arrests@busted", "idle_a", 3 ) ) then
					TaskPlayAnim( PlayerPedId(), "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (3000)
					TaskPlayAnim( PlayerPedId(), "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
					Wait (1000)
					ClearPedSecondaryTask(PlayerPedId())
				end
				if IsEntityPlayingAnim(PlayerPedId(),"random@mugging3","handsup_standing_base",3) then
					ClearPedSecondaryTask(PlayerPedId())
				else
					tvRP.playAnim(true,{{"random@mugging3", "handsup_standing_base", 1}},true)
					TriggerEvent('gcphone:forceClose')
				end
			end
			if tvRP.getTransformerLock() then
				vRPserver.leaveArea({tvRP.getCurrentTransformer()})
			end
		end
		if IsDisabledControlJustPressed( 0, 36 ) then
			if not IsEntityDead(PlayerPedId()) and not handcuffed and not tvRP.isInComa() and not IsPedInAnyVehicle(PlayerPedId(), false) and not tvRP.isInWater() then
				if IsEntityPlayingAnim(PlayerPedId(),"random@mugging3","handsup_standing_base",3) then
					ClearPedSecondaryTask(PlayerPedId())
					tvRP.kneelHU()
				end
				if IsEntityPlayingAnim( PlayerPedId(), "random@arrests@busted", "idle_a", 3 ) then
					TaskPlayAnim( PlayerPedId(), "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
					Wait (3000)
					TaskPlayAnim( PlayerPedId(), "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
					Wait (1000)
					ClearPedSecondaryTask(PlayerPedId())
				end
			end
		end
	end
end)

-- Weapon cleanup
Citizen.CreateThread( function()
	while true do
		Citizen.Wait(500)
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		if not cop then
			if (#(vector3(pos.x, pos.y, pos.z)-vector3(136.17930603028, -761.70587158204, 234.15194702148)) > 15
			and #(vector3(pos.x, pos.y, pos.z)-vector3(2800.000, -3800.000, 100.000)) > 250
			and #(vector3(pos.x, pos.y, pos.z)-vector3(458.80065917968,-3094.4453125,6.0700526237488)) > 29.75) then
				RemoveWeaponFromPed(ped,0x1D073A89) -- remove pumpshot shotgun. Only cops have access 0xDF711959
				RemoveWeaponFromPed(ped,0x83BF0278) -- carbine rifle from fbi2 vehicle
				RemoveWeaponFromPed(ped,0x678B81B1) -- nightstick
				RemoveWeaponFromPed(ped,0x2BE6766B) -- WEAPON_SMG
				RemoveWeaponFromPed(ped,0x5EF9FEC4) -- WEAPON_COMBATPISTOL
				RemoveWeaponFromPed(ped,0xD205520E) -- WEAPON_HEAVYPISTOL
				RemoveWeaponFromPed(ped,0xC0A3098D) -- WEAPON_SPECIALCARBINE
			end
		end

		if not tvRP.isMedic() and not cop then
			RemoveWeaponFromPed(ped,0x497FACC3) -- WEAPON_FLARE
			RemoveWeaponFromPed(ped,0x3656C8C1) -- stun gun
			RemoveWeaponFromPed(ped,0x060EC506) -- WEAPON_FIREEXTINGUISHER
		end
		--RemoveWeaponFromPed(ped,0x05FC3C11) -- sniper rifle
		RemoveWeaponFromPed(ped,0x0C472FE2) -- heavy sniper rifle

		--RemoveWeaponFromPed(ped,0xEFE7E2DF) -- WEAPON_ASSAULTSMG
		--RemoveWeaponFromPed(ped,0xAF113F99) -- WEAPON_ADVANCEDRIFLE
		--RemoveWeaponFromPed(ped,0x9D07F764) -- WEAPON_MG
		--RemoveWeaponFromPed(ped,0x7FD62962) -- WEAPON_COMBATMG
		--RemoveWeaponFromPed(ped,0x7846A318) -- WEAPON_SAWNOFFSHOTGUN
		--RemoveWeaponFromPed(ped,0xE284C527) -- WEAPON_ASSAULTSHOTGUN
		--RemoveWeaponFromPed(ped,0x9D61E50F) -- WEAPON_BULLPUPSHOTGUN
		--RemoveWeaponFromPed(ped,0x33058E22) -- WEAPON_REMOTESNIPER
		--RemoveWeaponFromPed(ped,0xA284510B) -- WEAPON_GRENADELAUNCHER
		--RemoveWeaponFromPed(ped,0x4DD2DC56) -- WEAPON_GRENADELAUNCHER_SMOKE
		--RemoveWeaponFromPed(ped,0xB1CA77B1) -- WEAPON_RPG
		--RemoveWeaponFromPed(ped,0x687652CE) -- WEAPON_STINGER
		--RemoveWeaponFromPed(ped,0x42BF8A85) -- WEAPON_MINIGUN
		--RemoveWeaponFromPed(ped,0x93E220BD) -- WEAPON_GRENADE
		--RemoveWeaponFromPed(ped,0x2C3731D9) -- WEAPON_STICKYBOMB
		--RemoveWeaponFromPed(ped,0xFDBC8A50) -- WEAPON_SMOKEGRENADE
		--RemoveWeaponFromPed(ped,0xA0973D5E) -- WEAPON_BZGAS
		--RemoveWeaponFromPed(ped,0x24B17070) -- WEAPON_MOLOTOV
		--RemoveWeaponFromPed(ped,0x61012683) -- WEAPON_GUSENBERG
		--RemoveWeaponFromPed(ped,0x7F229F94) -- WEAPON_BULLPUPRIFLE
		--RemoveWeaponFromPed(ped,0xA89CB99E) -- WEAPON_MUSKET
		--RemoveWeaponFromPed(ped,0x3AABBBAA) -- WEAPON_HEAVYSHOTGUN
		--RemoveWeaponFromPed(ped,0xC734385A) -- WEAPON_MARKSMANRIFLE
		--RemoveWeaponFromPed(ped,0x63AB0442) -- WEAPON_HOMINGLAUNCHER
		--RemoveWeaponFromPed(ped,0x7F7497E5) -- WEAPON_FIREWORK
		--RemoveWeaponFromPed(ped,0xAB564B93) -- WEAPON_PROXMINE
		--RemoveWeaponFromPed(ped,0x787F0BB) -- WEAPON_SNOWBALL
		--RemoveWeaponFromPed(ped,0x47757124) -- WEAPON_FLAREGUN
		--RemoveWeaponFromPed(ped,0xDC4DB296) -- WEAPON_MARKSMANPISTOL
		--RemoveWeaponFromPed(ped,0x0A3D4D34) -- WEAPON_COMBATPDW
		--RemoveWeaponFromPed(ped,0xD8DF3C3C) -- WEAPON_KNUCKLE
		--RemoveWeaponFromPed(ped,0x6D544C99) -- WEAPON_RAILGUN
		--RemoveWeaponFromPed(ped,0xDD5DF8D9) -- WEAPON_MACHETE
		--RemoveWeaponFromPed(ped,0xEF951FBB) -- WEAPON_DBSHOTGUN
		--RemoveWeaponFromPed(ped,0x624FE830) -- WEAPON_COMPACTRIFLE
		--RemoveWeaponFromPed(ped,0x12E82D3D) -- WEAPON_AUTOSHOTGUN
		--RemoveWeaponFromPed(ped,0x0781FE4A) -- WEAPON_COMPACTLAUNCHER
		--RemoveWeaponFromPed(ped,0xCD274149) -- WEAPON_BATTLEAXE
		--RemoveWeaponFromPed(ped,0xBD248B55) -- WEAPON_MINISMG
		--RemoveWeaponFromPed(ped,0xBA45E8B8) -- WEAPON_PIPEBOMB
		--RemoveWeaponFromPed(ped,0x94117305) -- WEAPON_POOLCUE
		--RemoveWeaponFromPed(ped,0x19044EE0) -- WEAPON_WRENCH
		--
		--RemoveWeaponFromPed(ped,0x22D8FE39) -- WEAPON_APPISTOL
		--RemoveWeaponFromPed(ped,0xBFEFFF6D) -- WEAPON_ASSAULTRIFLE
		--RemoveWeaponFromPed(ped,0x166218FF) -- WEAPON_PASSENGER_ROCKET
		--RemoveWeaponFromPed(ped,0x13579279) -- WEAPON_AIRSTRIKE_ROCKET
		--RemoveWeaponFromPed(ped,0x23C9F95C) -- WEAPON_BALL
		--RemoveWeaponFromPed(ped,0xBEFDC581) -- WEAPON_VEHICLE_ROCKET
		--RemoveWeaponFromPed(ped,0x48E7B178) -- WEAPON_BARBED_WIRE
		--RemoveWeaponFromPed(ped,0xBFE256D4) -- WEAPON_PISTOL_MK2
		--RemoveWeaponFromPed(ped,0x78A97CD0) -- WEAPON_SMG_MK2
		--RemoveWeaponFromPed(ped,0x394F415C) -- WEAPON_ASSAULTRIFLE_MK2
		--RemoveWeaponFromPed(ped,0xFAD1F1C9) -- WEAPON_CARBINERIFLE_MK2
		--RemoveWeaponFromPed(ped,0xDBBD7280) -- WEAPON_COMBATMG_MK2
		--RemoveWeaponFromPed(ped,0xA914799) -- WEAPON_HEAVYSNIPER_MK2
		--RemoveWeaponFromPed(ped,0xDB1AA450) -- WEAPON_MACHINEPISTOL
		--RemoveWeaponFromPed(ped,0x13532244) -- WEAPON_MICROSMG
	end
end)

---------------
--SPIKE STRIP
-- source https://forum.fivem.net/t/release-police-spike-strip-non-scripthook-version/41587
---------------
local spike_deployed = false

RegisterNetEvent('c_setSpike')
AddEventHandler('c_setSpike', function()
	tvRP.setSpikesOnGround()
end)

function tvRP.setSpikesOnGround()
	if not spike_deployed then
		local ped = PlayerPedId()
		local pedCoord = GetEntityCoords(ped)
		if DoesObjectOfTypeExistAtCoords(pedCoord["x"], pedCoord["y"], pedCoord["z"], 2.0, GetHashKey("P_ld_stinger_s"), true) then
			tvRP.pickupSpikestrip(pedCoord["x"],pedCoord["y"],pedCoord["z"])
		else
			local rot = GetEntityHeading(ped)
			local x, y, z = table.unpack(GetEntityCoords(ped, true))
			local fx,fy,fz = table.unpack(GetEntityForwardVector(ped))
			x = x+(fx*2.0)
			y = y+(fy*2.0)

			spike = GetHashKey("P_ld_stinger_s")

			RequestModel(spike)
			while not HasModelLoaded(spike) do
				Citizen.Wait(1)
			end

			local object = CreateObject(spike, x, y, z, true, true, false) -- x+1
			SetEntityHeading(object, rot-180)
			PlaceObjectOnGroundProperly(object)
			tvRP.notify("Spikestrip deployed")
			tvRP.playAnim(true,{{"pickup_object","pickup_low",1}},false)
			spike_deployed = true
			Citizen.CreateThread(function()
				local spikeObj = object
				local spikex = x
				local spikey = y
				local spikez = z
				while spike_deployed do
					Citizen.Wait(5000)
					pedx, pedy, pedz = table.unpack(GetEntityCoords(ped, true))
					local distance = #(vector3(pedx,pedy,pedz)-vector3(spikex,spikey,spikez))
					if distance > 25 then
						tvRP.pickupSpikestrip(spikex,spikey,spikez)
						spike_deployed = false
						tvRP.notify("Spikestrip returned")
					end
				end
			end)
		end
	else
		tvRP.pickupSpikestrip()
	end
end

function tvRP.pickupSpikestrip(x,y,z)
	if x == nil and y == nil and z == nil then
		local ped = PlayerPedId()
		local pedCoord = GetEntityCoords(ped)
		if DoesObjectOfTypeExistAtCoords(pedCoord["x"], pedCoord["y"], pedCoord["z"], 2.0, GetHashKey("P_ld_stinger_s"), true) then
			spike = GetClosestObjectOfType(pedCoord["x"], pedCoord["y"], pedCoord["z"], 2.0, GetHashKey("P_ld_stinger_s"), false, false, false)
			SetEntityAsMissionEntity(spike, true, true)
			DeleteObject(spike)
			spike_deployed = false
			tvRP.notify("Spikestrip returned")
			tvRP.playAnim(true,{{"pickup_object","pickup_low",1}},false)
			return true
		end
		return false
	else
		if DoesObjectOfTypeExistAtCoords(x, y, z, 0.9, GetHashKey("P_ld_stinger_s"), true) then
			spike = GetClosestObjectOfType(x, y, z, 0.9, GetHashKey("P_ld_stinger_s"), false, false, false)
			SetEntityAsMissionEntity(spike, true, true)
			DeleteObject(spike)
			spike_deployed = false
			return true
		end
		return false
	end
	return false
end

local odds_list = {
	"a",
	"b",
	"c",
	"d",
	"e",
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)
		local vehCoord = GetEntityCoords(veh)
		if IsPedInAnyVehicle(ped, false) then
			if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
				-- Front Driver
				rnd = math.random(#odds_list)
				if rnd == 1 or rnd == 3 or rnd == 5 then
					SetVehicleTyreBurst(veh, 0, true, 50.0)
				else
					SetVehicleTyreBurst(veh, 0, true, 5.0)
				end
				-- Front Passenger
				rnd = math.random(#odds_list)
				if rnd == 1 or rnd == 3 or rnd == 5 then
					SetVehicleTyreBurst(veh, 1, true, 50.0)
				else
					SetVehicleTyreBurst(veh, 1, true, 5.0)
				end
				Citizen.Wait(1000)
				-- Rear Driver
				rnd = math.random(#odds_list)
				if rnd == 2 or rnd == 4 then
					SetVehicleTyreBurst(veh, 2, true, 50.0)
				else
					SetVehicleTyreBurst(veh, 2, true, 5.0)
				end
				-- Rear Passenger
				rnd = math.random(#odds_list)
				if rnd == 2 or rnd == 4 then
					SetVehicleTyreBurst(veh, 3, true, 50.0)
				else
					SetVehicleTyreBurst(veh, 3, true, 5.0)
				end
				Citizen.Wait(1000)
				SetVehicleTyreBurst(veh, 4, true, 5.0)
				SetVehicleTyreBurst(veh, 5, true, 5.0)
				SetVehicleTyreBurst(veh, 6, true, 5.0)
				SetVehicleTyreBurst(veh, 7, true, 5.0)
			end
		end
	end
end)
--------------------------------------------------------------------------------------------------------------
-- Spike strip end
--------------------------------------------------------------------------------------------------------------

function tvRP.setArmour(amount)
	SetPedArmour(PlayerPedId(),amount)
end

-- Hand on radio
-- Modified to prevent players from diyng while in animation
Citizen.CreateThread(function()
	while true do
		Citizen.Wait( 0 )
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and (tvRP.isCop() or tvRP.isMedic()) and not tvRP.isInComa() then
			if tvRP.isInWater() then
				if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) or IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
					ClearPedTasks(ped)
					SetEnableHandcuffs(ped, false)
				end
			end
		end
	end
end )

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

-- Search for given vechile. Vehicle name and plate.
-- Returns true if found, false if not.
function tvRP.searchForVeh(player,radius,vplate,vname)
	local retValue = false
	if player ~= nil and vplate ~= nil and vname ~= nil then
		if radius == nil then
			radius = 5
		end
		retValue = TargetVehicleInProximity(radius,vplate,vname)
	end
	return retValue
end

function tvRP.kneelHU()
	local player = PlayerPedId()
	TriggerEvent('gcphone:forceClose')
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
			TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
		else
			TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
			TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
		end
	end
end

local arrested = false
local arresting = false

function tvRP.getZiptied(actor)
	arresting = true
	local playerPed = PlayerPedId()
	RequestAnimDict('mp_arrest_paired')

	while not HasAnimDictLoaded('mp_arrest_paired') do
		Citizen.Wait(10)
	end
	actor = GetPlayerPed(GetPlayerFromServerId(actor))
	AttachEntityToEntity(playerPed, actor, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(950)
	DetachEntity(playerPed, true, false)

	tvRP.toggleHandcuff()
	ziptied = true
	TriggerEvent('core:client:registerCharacterState', 'ziptied', true)
	arresting = false
end

function tvRP.getArrested(officer)
	arresting = true
	local playerPed = PlayerPedId()
	RequestAnimDict('mp_arrest_paired')

	while not HasAnimDictLoaded('mp_arrest_paired') do
		Citizen.Wait(10)
	end
	--officer = GetPlayerPed(GetPlayerFromServerId(officer))
	--AttachEntityToEntity(playerPed, officer, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(2100)
	--DetachEntity(playerPed, true, false)

	tvRP.toggleHandcuff()
	arresting = false
end

function tvRP.performArrest()
	local playerPed = PlayerPedId()
	RequestAnimDict('mp_arrest_paired')

	while not HasAnimDictLoaded('mp_arrest_paired') do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)
	Citizen.Wait(3000)
	arrested = false
end

RegisterNetEvent('vrp:cutZiptie')
AddEventHandler('vrp:cutZiptie', function(from_scalpel)
	if not tvRP.isInComa() and not tvRP.isZiptied() and not tvRP.isHandcuffed() then
		local ped = PlayerPedId()
		local currentWeapon = GetSelectedPedWeapon(ped)
		if currentWeapon == GetHashKey("WEAPON_BOTTLE") or currentWeapon == GetHashKey("WEAPON_DAGGER") or currentWeapon == GetHashKey("WEAPON_KNIFE") or currentWeapon == GetHashKey("WEAPON_SWITCHBLADE") or currentWeapon == GetHashKey("WEAPON_BATTLEAXE") or from_scalpel then
			local nearServId = tvRP.getNearestPlayer(2)
			if nearServId ~= -1 then
				exports['mythic_progbar']:Progress({
					name = "cutting_ziptie",
					duration = 5000,
					label = "Cutting Ziptie",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = true,
					},
					animation = {
						task= "PROP_HUMAN_BUM_BIN",
					},
				}, function(status)
					if not status then
						vRPserver.removeZiptie_sv({nearServId})
					end
				end)
			end
		end
	end
end)

function tvRP.removeZiptie_cl()
	if tvRP.isZiptied() and not tvRP.isInComa() then
		tvRP.toggleHandcuff()
	end
end
