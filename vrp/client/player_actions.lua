-- Script Created by Giant Cheese Wedge (AKA Blü)
-- Script Modified and fixed by Hoopsure

local crouched = false
local proned = false
local hashFemaleMPSkin = GetHashKey("mp_f_freemode_01")
crouchKey = 26
proneKey = 36

function tvRP.getIsProned()
	return proned
end

Citizen.CreateThread( function()
	while true do
		Citizen.Wait( 1 )
		local ped = GetPlayerPed( -1 )
		if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
			ProneMovement()
			DisableControlAction( 0, proneKey, true )
			if ( not IsPauseMenuActive() ) then
				--[[
				if ( (IsDisabledControlJustPressed(0, proneKey) and IsControlPressed(0,131)) and not crouched and not IsPedInAnyVehicle(ped, true) and not IsPedFalling(ped) and not IsPedDiving(ped) and not IsPedInCover(ped, false) and not IsPedInParachuteFreeFall(ped) and (GetPedParachuteState(ped) == 0 or GetPedParachuteState(ped) == -1) ) and not tvRP.isHandcuffed() and not tvRP.getActionLock() and not tvRP.isInComa() then
					if proned then
						Citizen.Wait(200)
						ClearPedTasksImmediately(ped)
						proned = false
						coord = GetEntityCoords(ped)
						SetEntityCoords(ped,coord.x,coord.y,coord.z, true, true, true, false)
					elseif not proned and not IsPedJumping(ped) then
						Citizen.Wait(200)
						RequestAnimSet( "move_crawl" )
						while ( not HasAnimSetLoaded( "move_crawl" ) ) do
							Citizen.Wait( 100 )
						end
						ClearPedTasksImmediately(ped)
						proned = true
						if IsPedSprinting(ped) or IsPedRunning(ped) or GetEntitySpeed(ped) > 5 then
							TaskPlayAnim(ped, "move_jump", "dive_start_run", 8.0, 1.0, -1, 0, 0.0, 0, 0, 0)
							Citizen.Wait(1000)
						end
						SetProned()
					end
				elseif ( IsDisabledControlJustPressed( 0, proneKey ) ) then
				]]--
				if ( IsDisabledControlJustPressed( 0, proneKey ) ) and not IsPedInAnyVehicle(ped, true) then
					TriggerEvent("blrp_tablet:getTabletState", function(tablet_open)
						if not tablet_open then
							if proned then
								tvRP.UnSetProned()
							else
								RequestAnimSet( "move_ped_crouched" )
								while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
									Citizen.Wait( 100 )
								end
								playerModel = GetEntityModel(ped)
								animName = "MOVE_M@GENERIC"
								if playerModel == hashFemaleMPSkin then
									animName = "MOVE_F@GENERIC"
								end
								RequestAnimSet(animName)
								while ( not HasAnimSetLoaded( animName ) ) do
									Citizen.Wait( 100 )
								end

								if ( crouched and not proned ) then
									ResetPedMovementClipset( ped, 0.0 )
									ResetPedStrafeClipset(ped)
									SetPedMovementClipset( ped,animName, 0.5)
									crouched = false
									if playerModel == hashFemaleMPSkin then
										Citizen.Wait(600)
										ResetPedMovementClipset(ped, 0.0)
									end
								elseif ( not crouched and not proned ) and
										not IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) and
										not IsEntityPlayingAnim( ped, "random@arrests@busted", "idle_a", 3 ) then
									SetPedMovementClipset( ped, "move_ped_crouched", 0.55 )
									SetPedStrafeClipset(ped, "move_ped_crouched_strafing")
									crouched = true
								end
							end
						end
					end)
				end
			end
		else
			proned = false
			crouched = false
		end
		if proned or crouched then
			if tvRP.isInWater() then
				tvRP.UnSetCrouch()
			else
				SetPlayerSprint(ped, false)
				DisableControlAction(0, 23, true)

				DisableControlAction(0,21,true) -- disable sprint
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
	      DisableControlAction(0,47,true) -- disable weapon
	      DisableControlAction(0,58,true) -- disable weapon
	      DisableControlAction(0,257,true) -- disable melee
	      DisableControlAction(0,44,true) -- disable cover
	      DisableControlAction(0,22,true) -- disable cover
	      DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			end
		end
	end
end)

function SetProned()
	ped = PlayerPedId()
	ClearPedTasksImmediately(ped)
	TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
end

function tvRP.UnSetCrouch()
	ped = PlayerPedId()
	ClearPedTasksImmediately(ped)
	proned = false
	crouched = false
	--coord = GetEntityCoords(ped)
	--SetEntityCoords(ped,coord.x,coord.y,coord.z)
end

function tvRP.UnSetProned()
	ped = PlayerPedId()
	ClearPedTasksImmediately(ped)
	proned = false
	coord = GetEntityCoords(ped)
	SetEntityCoords(ped,coord.x,coord.y,coord.z, true, true, true, false)
end

function ProneMovement()
	if proned then
		ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			if veh ~= nil then
				TaskLeaveVehicle(ped, veh, 16 )
				tvRP.UnSetProned()
				return
			end
		else
			if IsControlPressed(0, 32) or IsControlPressed(0, 33) then
				DisablePlayerFiring(ped, true)
			 elseif IsControlJustReleased(0, 32) or IsControlJustReleased(0, 33) then
			 	DisablePlayerFiring(ped, false)
			 end
			if IsControlJustPressed(0, 32) and not movefwd then
				Citizen.Wait(200)
				movefwd = true
			    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
			elseif IsControlJustReleased(0, 32) and movefwd then
				Citizen.Wait(200)
			    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
				movefwd = false
			end
			if IsControlJustPressed(0, 33) and not movebwd then
				Citizen.Wait(200)
				movebwd = true
			    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
			elseif IsControlJustReleased(0, 33) and movebwd then
				Citizen.Wait(200)
			    TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(ped), 0.0, 0.0, GetEntityHeading(ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
			    movebwd = false
			end
			if IsControlPressed(0, 34) then
				SetEntityHeading(ped, GetEntityHeading(ped)+2.0 )
			elseif IsControlPressed(0, 35) then
				SetEntityHeading(ped, GetEntityHeading(ped)-2.0 )
			end
		end
	end
end


-- https://github.com/IndianaBonesUrMom/fivem-seatbelt
local gForcesToEject = 20
local gForcesToConcuss = 35
local minSpeed = 19.25 --THIS IS IN m/s
local strings = { belt_on = 'Seatbelt on.', belt_off = 'Seatbelt off' }
local speedBuffer = {}
local velBuffer = {}
local beltOn = false
local wasInCar = false
local gForce = 9.8	--acceleration due to gravity M/H

IsCar = function(veh)
			local vc = GetVehicleClass(veh)
			return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 15 and vc <= 20)
		end

function Fwv(entity)
  local hr = GetEntityHeading(entity) + 90.0
  if hr < 0.0 then hr = 360.0 + hr end
  hr = hr * 0.0174533
  return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end

function tvRP.getSeatbeltStatus()
	return beltOn
end

function tvRP.toggleSeatbelt()
	beltOn = not beltOn
	if beltOn then
		TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3, 'seatbelt', 0.2)
		tvRP.notify(strings.belt_on)
	else
		tvRP.notify(strings.belt_off)
	end
end
--Thread to monitor speed, I may have gotten carried away with this
function speedBuffer.new()
	speedBuffer.max = 0
	speedBuffer.min = 0
	speedBuffer.maxTime = 0
	speedBuffer.minTime = 0
	speedBuffer.tickCount = 0
end

function speedBuffer.push(value)
	if value > speedBuffer.max then
		speedBuffer.max = value
		speedBuffer.maxTime = speedBuffer.tickCount

		--reset the min because we only care about deceleration
		speedBuffer.min = value
		speedBuffer.minTime = speedBuffer.tickCount
	elseif value < speedBuffer.min then
		speedBuffer.min = value
		speedBuffer.minTime = speedBuffer.tickCount
	end

	--max is expiring
	if speedBuffer.maxTime + 10 < speedBuffer.tickCount  then
		speedBuffer.max = value
		speedBuffer.maxTime = speedBuffer.tickCount

		--reset the min because we only care about deceleration
		speedBuffer.min = value
		speedBuffer.minTime = speedBuffer.tickCount
	end
end

speedBuffer.new()

Citizen.CreateThread(function()
	Citizen.Wait(500)
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)

		while wasInCar do
			Citizen.Wait(10)

			speedBuffer.push(GetEntitySpeed(car))
			speedBuffer.tickCount = speedBuffer.tickCount + 1

			local max = speedBuffer.max
			local min = speedBuffer.min

			local appliedGForces = ((max - min)/0.1)/gForce

			--DEBUG-------------
			-- if appliedGForces > 5 then
			-- 	print("High Gs: "..tostring(appliedGForces).."Gs")
			-- 	print(max)
			-- 	print(min)
			-- end
			--END DEBUG---------

			if appliedGForces > gForcesToEject or appliedGForces > gForcesToConcuss then
				if GetEntitySpeedVector(car, true).y > 1.0
					 and max > minSpeed
					 and appliedGForces > gForcesToEject
					 and not tvRP.isHandcuffed()
					 and not tvRP.isInComa()
					 and not beltOn then
						 	local co = GetEntityCoords(ped)
							local fw = Fwv(ped)
							SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true, false)
							SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
							Citizen.Wait(1)
							SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
				elseif GetEntitySpeedVector(car, true).y > 1.0
					 and max > minSpeed
					 and appliedGForces > gForcesToConcuss
					 and not tvRP.isHandcuffed()
					 and not tvRP.isInComa()
					 and beltOn then
							tvRP.setKnockedOut(true)
							tvRP.playAnim(true, {{"random@crash_rescue@car_death@std_car", "loop", 1}},true)
							tvRP.setConcussion(true)
							speedBuffer.new()
				end
			end

			velBuffer[2] = velBuffer[1]
			velBuffer[1] = GetEntityVelocity(car)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	while true do

		local ped = PlayerPedId()
		local car = GetVehiclePedIsIn(ped)

		if car ~= 0 and (wasInCar or IsCar(car)) then

			wasInCar = true

			if beltOn then DisableControlAction(0, 75) end

			if IsDisabledControlJustReleased(0,75) and beltOn then
				tvRP.notify("You need to remove your seatbelt to do that")
			end

			if IsControlJustReleased(0, 311) then
				tvRP.toggleSeatbelt()
			end

		elseif wasInCar then
			wasInCar = false
			beltOn = false
			speedBuffer.new()
		end
		Citizen.Wait(10)
	end
end)

function tvRP.sendCarCrashEvent()
	local ped = PlayerPedId()
	local car = GetVehiclePedIsIn(ped)

	if car ~= 0 and IsPedInAnyVehicle(ped) and not tvRP.isHandcuffed() and not beltOn then
		local co = GetEntityCoords(ped)
		local fw = Fwv(ped)
		SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true, false)
		SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
		Citizen.Wait(1)
		SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
	end
end

local customEmoteBinds = {
	["f1"] = nil,
	["f2"] = nil,
	["f3"] = nil,
	["f5"] = nil,
	["f6"] = nil,
	["f7"] = nil,
	["f9"] = nil,
	["f10"] = nil,
	["f11"] = nil,
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 288) or IsControlJustPressed(0, 288)) then
			playBoundEmote("f1")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 289) or IsControlJustPressed(0, 289)) then
			playBoundEmote("f2")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 170) or IsControlJustPressed(0, 170)) then
			playBoundEmote("f3")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 318) or IsControlJustPressed(0, 318)) then
			playBoundEmote("f5")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 167) or IsControlJustPressed(0, 167)) then
			playBoundEmote("f6")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 168) or IsControlJustPressed(0, 168)) then
			playBoundEmote("f7")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 56) or IsControlJustPressed(0, 56)) then
			playBoundEmote("f9")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 57) or IsControlJustPressed(0, 57)) then
			playBoundEmote("f10")
		elseif (IsDisabledControlPressed(0, 121) or IsControlPressed(0, 121)) and (IsDisabledControlJustPressed(0, 344) or IsControlJustPressed(0, 344)) then
			playBoundEmote("f11")
		end
	end
end)

local emote_cooldown = 10 * 1000
local emote_cooldown_active = false

function startEmoteCoolDownThread()
	if not emote_cooldown_active then
		emote_cooldown_active = true
		Citizen.CreateThread(function()
			Citizen.Wait(emote_cooldown)
			emote_cooldown_active = false
		end)
	end
end

function playBoundEmote(key)
	if emote_cooldown_active then
		tvRP.notify("You can not use another emote so soon.")
	else
		if customEmoteBinds[key] ~= nil and not tvRP.isHandcuffed() and not tvRP.getActionLock() and not tvRP.isInComa() then
			startEmoteCoolDownThread()
			tvRP.playAnim(customEmoteBinds[key][1], customEmoteBinds[key][2], customEmoteBinds[key][3])
		end
	end
	Citizen.Wait(1000)
end

function tvRP.syncEmoteBinding(emoteBinding)
	customEmoteBinds = emoteBinding
end

RegisterNetEvent('vRP:setemote')
AddEventHandler('vRP:setemote', function(selectedKey, emote)
	if emote ~= nil then
		customEmoteBinds[selectedKey] = emote
		vRPserver.saveEmoteBinds({customEmoteBinds})
	else
		tvRP.notify("No emote found")
	end
end)

local takingNotesActive = false
local ad = "missheistdockssetup1clipboard@base"
local notesPrimaryProp = nil
local notesSecondaryProp = nil
local note_prop_name = 'prop_notepad_01'
local note_secondaryprop_name = 'prop_pencil_01'

function tvRP.takeNotes()
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, "base", 3 ) ) or takingNotesActive then
			tvRP.takeNotesEnd(player)
		else
			local x,y,z = table.unpack(GetEntityCoords(player))
			--notesPrimaryProp = CreateObject(GetHashKey(note_prop_name), x, y, z+0.2,  true,  true, true)
			--notesSecondaryProp = CreateObject(GetHashKey(note_secondaryprop_name), x, y, z+0.2,  true,  true, true)
			--AttachEntityToEntity(notesPrimaryProp, player, GetPedBoneIndex(player, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true, true, false, true, 1, true) -- notepad
			--AttachEntityToEntity(notesSecondaryProp, player, GetPedBoneIndex(player, 58866), 0.12, 0.0, 0.001, -150.0, 0.0, 0.0, true, true, false, true, 1, true) -- pencil
			TaskPlayAnim( player, ad, "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			takingNotesActive = true
			Citizen.CreateThread(function()
				while takingNotesActive do
					Citizen.Wait(1)
					if not IsEntityPlayingAnim( player, ad, "base", 3 ) then
						tvRP.takeNotesEnd(player)
					end
					SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
					DisableControlAction(0, 24, true) -- Attack
					DisableControlAction(0, 25, true) -- Aim
					DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
					DisableControlAction(0, 142, true) -- MeleeAttackAlternate
					DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
					DisableControlAction(0,263,true) -- disable melee
					DisableControlAction(0,264,true) -- disable melee
					DisableControlAction(0,140,true) -- disable melee
					DisableControlAction(0,141,true) -- disable melee
					DisableControlAction(0,143,true) -- disable melee
				end
			end)
		end
	end
end

function tvRP.takeNotesEnd(player)
	takingNotesActive = false
	TaskPlayAnim( player, ad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Citizen.Wait (100)
	ClearPedSecondaryTask(PlayerPedId())
	--DetachEntity(notesPrimaryProp, 1, 1)
	--DeleteObject(notesPrimaryProp)
	--DetachEntity(notesSecondaryProp, 1, 1)
	--DeleteObject(notesSecondaryProp)
end

local boxCarryActive = false
local boxad = "anim@heists@box_carry@"
local boxCarryPrimaryProp = nil
local boxCarry_prop_name = 'hei_prop_heist_box'

function tvRP.boxCarry()
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( boxad )
		if ( IsEntityPlayingAnim( player, boxad, "idle", 3 ) ) or boxCarryActive then
			tvRP.boxCarryEnd(player)
		else
			local x,y,z = table.unpack(GetEntityCoords(player))
			--boxCarryPrimaryProp = CreateObject(GetHashKey(boxCarry_prop_name), x, y, z+0.2,  true,  true, true)
			--AttachEntityToEntity(boxCarryPrimaryProp, player, GetPedBoneIndex(player, 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true) -- notepad
			TaskPlayAnim( player, boxad, "idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			boxCarryActive = true
			Citizen.CreateThread(function()
				while boxCarryActive do
					Citizen.Wait(1)
					if not IsEntityPlayingAnim( player, boxad, "idle", 3 ) then
						tvRP.boxCarryEnd(player)
					end
					SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
					DisableControlAction(0, 24, true) -- Attack
					DisableControlAction(0, 25, true) -- Aim
					DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
					DisableControlAction(0, 142, true) -- MeleeAttackAlternate
					DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
					DisableControlAction(0,263,true) -- disable melee
					DisableControlAction(0,264,true) -- disable melee
					DisableControlAction(0,140,true) -- disable melee
					DisableControlAction(0,141,true) -- disable melee
					DisableControlAction(0,143,true) -- disable melee
				end
			end)
		end
	end
end

function tvRP.boxCarryEnd(player)
	boxCarryActive = false
	TaskPlayAnim( player, boxad, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Citizen.Wait (100)
	ClearPedSecondaryTask(PlayerPedId())
	--DetachEntity(boxCarryPrimaryProp, 1, 1)
	--DeleteObject(boxCarryPrimaryProp)
end

local briefcaseCarryActive = false
local briefcasead = "missheistdocksprep1hold_cellphone"
local briefcaseCarryPrimaryProp = nil
local briefcaseCarry_prop_name = 'prop_ld_case_01'

function tvRP.briefcaseCarry()
	local player = PlayerPedId()

	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( briefcasead )
		if ( IsEntityPlayingAnim( player, briefcasead, "static", 3 ) ) or briefcaseCarryActive then
			tvRP.briefcaseCarryEnd(player)
		else
			local x,y,z = table.unpack(GetEntityCoords(player))
			--briefcaseCarryPrimaryProp = CreateObject(GetHashKey(briefcaseCarry_prop_name), x, y, z+0.2,  true,  true, true)
			--AttachEntityToEntity(briefcaseCarryPrimaryProp, player, GetPedBoneIndex(player, 57005), 0.10, 0.0, 0.0, 0.0, 280.0, 53.0, true, true, false, true, 1, true) -- notepad
			TaskPlayAnim( player, briefcasead, "static", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
			briefcaseCarryActive = true
			Citizen.CreateThread(function()
				while briefcaseCarryActive do
					Citizen.Wait(1)
					if not IsEntityPlayingAnim( player, briefcasead, "static", 3 ) then
						tvRP.briefcaseCarryEnd(player)
					end
					SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
					DisableControlAction(0, 24, true) -- Attack
					DisableControlAction(0, 25, true) -- Aim
					DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
					DisableControlAction(0, 142, true) -- MeleeAttackAlternate
					DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
					DisableControlAction(0,263,true) -- disable melee
					DisableControlAction(0,264,true) -- disable melee
					DisableControlAction(0,140,true) -- disable melee
					DisableControlAction(0,141,true) -- disable melee
					DisableControlAction(0,143,true) -- disable melee
				end
			end)
		end
	end
end

function tvRP.briefcaseCarryEnd(player)
	briefcaseCarryActive = false
	TaskPlayAnim( player, briefcasead, "exit", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	Citizen.Wait (100)
	ClearPedSecondaryTask(PlayerPedId())
	--DetachEntity(briefcaseCarryPrimaryProp, 1, 1)
	--DeleteObject(briefcaseCarryPrimaryProp)
end

local handcuffPickInProgress = false

function tvRP.useLockPickPlayer()
	tvRP.selectTargetPlayer(2, function(selectedPed)
		if not handcuffPickInProgress and selectedPed ~= -1 then
			handcuffPickInProgress = true
			exports['mythic_progbar']:Progress({
					name = "init_lockpick",
					duration = 15000,
					label = "Preparing Tools",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
							disableMovement = true,
							disableCarMovement = true,
							disableMouse = false,
							disableCombat = true,
					},
					animation = {
						animDict = "mp_common_heist",
						anim = "pick_door",
						flags = 49,
					},
			}, function(status)
					if not status then
						init_pedLockpick(selectedPed)
					else
						handcuffPickInProgress = false
					end
			end)
		else
			if selectedPed == -1 then
				tvRP.notify("There is no one nearby")
			else
				tvRP.notify("You are already performing this action")
			end
		end
	end)
end

function init_pedLockpick(selectedPed)
	exports['mythic_progbar']:Progress({
			name = "init_lockpick_phase_1",
			duration = 20000,
			label = "Picking Handcuff",
			useWhileDead = false,
			canCancel = true,
			controlDisables = {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
			},
			animation = {
				animDict = "mp_common_heist",
				anim = "pick_door",
				flags = 49,
			},
	}, function(status)
			if not status then
				local odds = 60
				local randNum = math.random(1,100)
				if randNum > odds then
					local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(selectedPed)))
					if distance < 5 then
						tvRP.notify("Lockpick Succeeded")
						vRPserver.civUnrestrain({GetPlayerServerId(selectedPed)})
					else
						tvRP.notify("Lockpick Failed. Target is too far.")
					end
				else
					tvRP.notify("Lockpick Failed")
				end
			else
				tvRP.notify("Action Cancelled")
			end
			handcuffPickInProgress = false
	end)
end

local selectingTargetThreadActive = false
local checkCanTargetPlayerLoopCount = 0

RegisterNetEvent('vrp:client:selectTargetPlayer')
AddEventHandler('vrp:client:selectTargetPlayer', function(range, callback)
	tvRP.selectTargetPlayer(range, callback)
end)

function tvRP.selectTargetPlayer(range, cbr)
	local task = cbr
	selectingTargetThreadActive = false
	local closestPlayers = {}
	for _, i in ipairs(GetActivePlayers()) do
		if (GetPlayerPed(i) ~= PlayerPedId()) then
			if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(GetPlayerPed(i))) < range then
				if (HasEntityClearLosToEntity(PlayerPedId(), GetPlayerPed(i), 17) and IsEntityVisible(GetPlayerPed(i))) then
					table.insert(closestPlayers, GetPlayerPed(i))
				end
			end
		end
	end
	local arrayPos = 1
	local arraySize = #closestPlayers
	local activeMarkerPos = nil
	if arraySize > 0 then
		selectingTargetThreadActive = true
		arrayPos = checkCanTargetPlayer(closestPlayers,arrayPos,arraySize,1)
		if arrayPos ~= -1 and arrayPos ~= nil then
			if arraySize == 1 then
				if (HasEntityClearLosToEntity(PlayerPedId(), closestPlayers[arrayPos], 17) and IsEntityVisible(closestPlayers[arrayPos])) then
					local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestPlayers[arrayPos]))
					if distanceCheck < range then
						selectingTargetThreadActive = false
						local player = GetPlayerByEntityID(closestPlayers[arrayPos])
						task(player)
					end
				end
			else
				activeMarkerPos = GetEntityCoords(closestPlayers[arrayPos])
				while selectingTargetThreadActive do
					Citizen.Wait(0)
					if arrayPos ~= nil then
						if IsControlJustReleased(0, 177) then -- backspace
							selectingTargetThreadActive = false
							task(-1)
						elseif IsControlJustReleased(0, 174) then -- Left arrow
							-- Cycle left in array <
							arrayPos = arrayPos - 1
							if arrayPos < 1 then
								arrayPos = arraySize
							end
							arrayPos = checkCanTargetPlayer(closestPlayers,arrayPos,arraySize,-1)
							if arrayPos == -1 then
								selectingTargetThreadActive = false
								task(-1)
							end
						elseif IsControlJustReleased(0, 175) then -- Right arrow
							-- Cycle right in array >
							arrayPos = arrayPos + 1
							if arrayPos > arraySize then
								arrayPos = 1
							end
							arrayPos = checkCanTargetPlayer(closestPlayers,arrayPos,arraySize,1)
							if arrayPos == -1 then
								selectingTargetThreadActive = false
								task(-1)
							end
						elseif IsControlJustReleased(0, 176) then -- enter
							if (HasEntityClearLosToEntity(PlayerPedId(), closestPlayers[arrayPos], 17) and IsEntityVisible(closestPlayers[arrayPos])) then
								local distanceCheck = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(closestPlayers[arrayPos]))
								if distanceCheck < range then
									selectingTargetThreadActive = false
									local player = GetPlayerByEntityID(closestPlayers[arrayPos])
									task(player)
								end
							end
						end
						if activeMarkerPos ~= nil then
							if (HasEntityClearLosToEntity(PlayerPedId(), closestPlayers[arrayPos], 17) and IsEntityVisible(closestPlayers[arrayPos])) then
								if not IsPedInAnyVehicle(closestPlayers[arrayPos], false) then
									activeMarkerPos = GetEntityCoords(closestPlayers[arrayPos])
									local distanceCheck = #(GetEntityCoords(PlayerPedId()) - activeMarkerPos)
									if distanceCheck < range then
										DrawMarker(20, activeMarkerPos.x, activeMarkerPos.y, activeMarkerPos.z+1.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2,0.2,0.2, 202, 207, 203, 175, 1, 1, 2, 0, 0, 0, 0)
									end
								else
									local vehicle = GetVehiclePedIsIn(closestPlayers[arrayPos], false)
									if vehicle ~= nil then
										local carModel = GetEntityModel(vehicle)
										local numSeats = GetVehicleModelNumberOfSeats(carModel)
										activeMarkerPos = GetEntityCoords(closestPlayers[arrayPos])
										local distanceCheck = #(GetEntityCoords(PlayerPedId()) - activeMarkerPos)
										if distanceCheck < range then
											local label = ""
											for seatPos = -1,numSeats,1 do
												if (GetPedInVehicleSeat(vehicle, seatPos) == closestPlayers[arrayPos]) then
													if seatPos == -1 then
														label = "Driver"
													elseif seatPos == 0 then
														label = "Passenger"
													elseif seatPos == 1 then
														label = "Rear Left Passenger"
													elseif seatPos == 2 then
														label = "Rear Right Passenger"
													elseif seatPos == 3 then
														label = "Far Rear Left Passenger"
													elseif seatPos == 4 then
														label = "Far Rear Right Passenger"
													else
														label = "Passenger"
													end
													break
												end
											end
											DrawMarker(20, activeMarkerPos.x, activeMarkerPos.y, activeMarkerPos.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2,0.2,0.2, 202, 207, 203, 175, 1, 1, 2, 0, 0, 0, 0)
											tvRP.drawText3Ds(label, activeMarkerPos.x, activeMarkerPos.y, activeMarkerPos.z+1.2)
										end
									end
								end
							end
						end
					else
						selectingTargetThreadActive = false
						task(-1)
					end
				end
				selectingTargetThreadActive = false
				task(-1)
			end
		else
			selectingTargetThreadActive = false
			task(-1)
		end
	else
		selectingTargetThreadActive = false
		task(-1)
	end
end


function checkCanTargetPlayer(closestPlayers, arrayPos, arraySize, direction) -- direction will either be 1 or -1
	if selectingTargetThreadActive then
		if (HasEntityClearLosToEntity(PlayerPedId(), closestPlayers[arrayPos], 17) and IsEntityVisible(closestPlayers[arrayPos])) then
			return arrayPos
		else
			if direction == nil then
				direction = 1
			end
			if direction == 1 then
				arrayPos = arrayPos + 1
				if arrayPos > arraySize then
					arrayPos = 1
				end
			else
				arrayPos = arrayPos - 1
				if arrayPos < 1 then
					arrayPos = arraySize
				end
			end
			checkCanTargetPlayerLoopCount = checkCanTargetPlayerLoopCount + 1
			if checkCanTargetPlayerLoopCount <= arraySize then
				checkCanTargetPlayer(closestPlayers, arrayPos, arraySize, direction)
			else
				return -1
			end
		end
	end
end

local robbingThreadRunning = false

RegisterNetEvent("vrp:client:initRobbingThread")
AddEventHandler("vrp:client:initRobbingThread", function(targetId)
	if not robbingThreadRunning and targetId ~= nil then
		robbingThreadRunning = true
		local targetPed = GetPlayerPed(GetPlayerFromServerId(targetId))
		Citizen.CreateThread(function()
			while robbingThreadRunning do
				Citizen.Wait(100)
				if #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(targetPed)) > 3 then
					robbingThreadRunning = false
					TriggerEvent('blrp_inventory:hide')
				end
			end
		end)
	end
end)

RegisterNetEvent("vrp:client:robbingThreadStatus")
AddEventHandler("vrp:client:robbingThreadStatus", function(cb)
	cb(robbingThreadRunning)
end)

RegisterNetEvent("vrp:client:killRobbingThread")
AddEventHandler("vrp:client:killRobbingThread", function()
	robbingThreadRunning = false
end)

local puttingArmourOn = false

function tvRP.tryPutOnArmour(amount, type)
	if not puttingArmourOn then
		if not tvRP.isInComa() and not tvRP.isHandcuffed() then
			exports['mythic_progbar']:Progress({
					name = "init_putonarmour",
					duration = 10000,
					label = "Putting on body armour",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
							disableMovement = true,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = true,
					},
					animation = {
						animDict = "mp_safehouseshower@female@",
						anim = "shower_towel_dry_to_get_dressed",
						flags = 49,
					},
			}, function(status)
					if not status then
						vRPserver.processArmourRequest({amount, type})
					end
					puttingArmourOn = false
			end)
		end
	else
		tvRP.notify("You are already performing this action")
	end
end

function tvRP.setArmour(amount)
	if amount ~= nil then
		if amount > 100 then
			amount = 100
		end
		SetPedArmour(GetPlayerPed(-1),amount)
	end
end

function tvRP.addArmour(amount)
	if amount ~= nil then
		local currentArmour = GetPedArmour(GetPlayerPed(-1))
		local newArmour = currentArmour + amount
		if newArmour > 100 then
			newArmour = 100
		end
		SetPedArmour(GetPlayerPed(-1),newArmour)
	end
end

function tvRP.showTabletPrecheck()
	if not tvRP.getActionLock() and not tvRP.isInComa() and not tvRP.isHandcuffed() and not tvRP.isInPrison() and not tvRP.getFiringPinState() then
		TriggerEvent('blrp_tablet:getTabletState', function(state)
			if not state then
				TriggerEvent("blrp_tablet:show")
			end
		end)
	end
end

RegisterNetEvent('vrp:client:isAbleUsePhone')
AddEventHandler('vrp:client:isAbleUsePhone', function(callback)
	if      not tvRP.isHandcuffed({})
			and not tvRP.isInComa({})
			and not tvRP.getFiringPinState({}) then
		callback(true)
	end

	callback(false)
end)

RegisterNetEvent('vrp:client:isAbleUseInventory')
AddEventHandler('vrp:client:isAbleUseInventory', function(callback)
	if      not tvRP.isHandcuffed({})
			and not tvRP.isInComa({})
			and not tvRP.getFiringPinState({}) then
		callback(true)
	end

	callback(false)
end)

function tvRP.rollDiceAnimation()
	local player = PlayerPedId()
	loadAnimDict('anim@mp_player_intcelebrationmale@wank')
	TaskPlayAnim(player, "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
	Citizen.Wait(1500)
	ClearPedTasks(player)
end

RegisterCommand("vrp-open-tablet", function(source, args, rawCommand)
    if not tvRP.isHandcuffed() and not tvRP.isInComa() then
      TriggerEvent("gcphone:getPhoneState", function(retValue)
        if not retValue then
          tvRP.showTabletPrecheck()
        end
      end)
    end
end, false)

RegisterKeyMapping("vrp-open-tablet", "Shortcut to Tablet", "keyboard", "o");
