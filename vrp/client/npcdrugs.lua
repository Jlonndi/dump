--===============================================
--= Drug Script- Onlyserenity				 	=
--===============================================

local selling = false
local secondsRemaining = 0
local rejected = false
local actionInProgress = false
local drugSold = nil
local drugSellingZone = nil
local drugHandicap = false
local drugHandicapThreadRunning = false
local defaultDrugHandicapTime = 10 * 60
local drugHandicapTimeRemaining = 0

Citizen.CreateThread(function()
	while true do
		if selling then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end

		Citizen.Wait(0)
	end
end)

local zones = {
	['PBOX'] = "Pillbox Hill",
	['SKID'] = "Mission Row",
	['AIRP'] = "Los Santos International Airport",
}

local smoking_props = {
	"prop_cs_ciggy_01",
	"prop_sh_joint_01",
	"prop_cs_meth_pipe"
}

local currentped = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1, 74) and not actionInProgress and not tvRP.getActionLock() then
			TriggerEvent('gcphone:isPhoneOpen', function(result)
				if result then return end
				local player = PlayerPedId()
				local playerloc = GetEntityCoords(player, 0)
				local smoking = false
				local props = tvRP.getCurrentProps()
				for k,v in pairs(smoking_props) do
					if props[v] ~= nil then
						tvRP.notify("You smoked recently and no one wants to do business with you. You stink.")
						smoking = true
					end
				end
				if not smoking then
					local authorized_zone = zones[GetNameOfZone(playerloc.x, playerloc.y, playerloc.z)]
					local handle, ped = FindFirstPed()
					local success
					repeat
						success, ped = FindNextPed(handle)
						local pos = GetEntityCoords(ped)
						local distance = Vdist(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'])
						if canSell(ped) then
							if distance <= 2.5 and ped  ~= PlayerPedId() and ped ~= oldped then
								local pedType = GetPedType(ped)
								if pedType ~= 29 and pedType ~= 27 and pedType ~= 21 and pedType ~= 20 and pedType ~= 6 then
									actionInProgress = true
									tvRP.setActionLock(true)
									oldped = ped
									DecorSetInt(ped, "OfferedDrugs", 2)
									currentped = ped
									vRPserver.hasAnyDrugs({}, function(ok,drug)
										if ok then
											if not authorized_zone then
												local currentZone = GetNameOfZone(playerloc.x, playerloc.y, playerloc.z)
												if drugSellingZone == nil then
													drugSellingZone = currentZone
													drugHandicap = false
													drugHandicapThreadRunning = false
												elseif drugSellingZone ~= currentZone then
													drugHandicap = true
													startDrugHandicapThread()
												else
													drugHandicap = false
													drugHandicapThreadRunning = false
												end
												actionInProgress = true
												tvRP.setActionLock(true)
												SetEntityAsMissionEntity(currentped)
												--ClearPedTasks(currentped)
												ClearPedSecondaryTask(PlayerPedId())
												ClearPedTasks(PlayerPedId())
												TaskStandStill(currentped, 9.0)
												--FreezeEntityPosition(ped,true)
												local random = math.random(1, 7)
												if random == 3 then
													rejected = true
												end
												drugSold = drug
												TaskStandStill(currentped, 9.0)
												pos1 = GetEntityCoords(currentped)
												currentlySelling()
											else
												tvRP.notify("The people here are not interested in drugs")
												actionInProgress = false
												tvRP.setActionLock(false)
											end
										else
											tvRP.notify("You have no drugs to sell")
											actionInProgress = false
											tvRP.setActionLock(false)
										end
									end)
								else
									DecorSetInt(ped, "OfferedDrugs", 2)
									tvRP.notify("The person rejected your offer")
									local plyPos = GetEntityCoords(PlayerPedId())
									vRPserver.initDrugSaleAlert({plyPos})

									TriggerEvent('blrp_core:client:prepareAlert', {
										is_response = true,
										service_name = 'Police',
										can_accept = false,
										coords = plyPos,
										badge = 'Tip',
										badge_style = 'primary',
										msg = 'Suspicious Activity Reported',
										icon = 'fad fa-hand-holding-water',
										show_for = 5000,
										allow_gps = false
									})
								end
							end
						end
					until not success
					EndFindPed(handle)
				end
			end)
		end
	end
end)

function canSell(aiPed)
	if not IsPedInAnyVehicle(PlayerPedId()) or (GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), false) == `blazerm4`) and tvRP.getMyVrpId() == 10844) then
		if DoesEntityExist(aiPed)then
			if IsPedDeadOrDying(aiPed) == false then
				if IsPedInAnyVehicle(aiPed) == false then
					local pedType = GetPedType(aiPed)
					if pedType ~= 28 and IsPedAPlayer(aiPed) == false then
						if DecorGetInt(aiPed, "OfferedDrugs") ~= 2 then
							return true
						end
					end
				end
			end
		end
	end
	return false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if selling then
			local player = PlayerPedId()
			local playerloc = GetEntityCoords(player, 0)
			drawTxt(0.90, 1.40, 1.0,1.0,0.4, "Negotiating: ~b~" .. secondsRemaining .. "~w~ seconds remaining", 255, 255, 255, 255)
			local distance = Vdist(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'])

			if distance > 6 then
				tvRP.notify("Sale Canceled: You're far away now.")
				selling = false
				actionInProgress = false
				tvRP.setActionLock(false)
				SetEntityAsMissionEntity(oldped)
				--FreezeEntityPosition(oldped,false)
				--ClearPedTasks(oldped)
				TaskWanderStandard(oldped,true,true)
				SetPedAsNoLongerNeeded(oldped)
			end
			if secondsRemaining == 0 then
				if not rejected then
					TriggerEvent('gcphone:forceClose')
					local drugItem = drugSold
					sellDrug(true)
					local pid = PlayerPedId()
					SetEntityAsMissionEntity(oldped)
					RequestAnimDict("mp_common")
					while (not HasAnimDictLoaded("mp_common")) do
						Citizen.Wait(0)
					end
					RequestAnimDict("missfbi_s4mop")
					while (not HasAnimDictLoaded("missfbi_s4mop")) do
						Citizen.Wait(0)
					end
					if drugItem == "weed1" or drugItem == "weed2" then
						drugItem = "prop_weed_bottle"
					elseif drugItem == "meth" or drugItem == "cocaine2" or drugItem == "cocaine1" then
						drugItem = 'prop_meth_bag_01'
					else
						drugItem = 'ng_proc_drug01a002'
					end

					--local drugObj = CreateObject(GetHashKey(drugItem), tvRP.getPosition(), true, false, false);
					--SetEntityAsMissionEntity(drugObj, true, true)
					--local playerBoneIndex = GetPedBoneIndex(PlayerPedId(), 57005)
					--AttachEntityToEntity(drugObj, PlayerPedId(), playerBoneIndex, 0.1, 0.0, -0.05, 0.0, 90.0, 90.0, false, false, false, false, 2, true)


					--true,{{"missfbi_s4mop","plant_bomb_b",1}},false
					if IsPedInAnyVehicle(PlayerPedId()) then
						TaskPlayAnim(pid,"missfbi_s4mop","plant_bomb_b",100.0, 200.0, 0.3, 49, 0.2, 0, 0, 0)
					else
						TaskPlayAnim(pid,"missfbi_s4mop","plant_bomb_b",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
					end

					TaskPlayAnim(oldped,"mp_common","givetake2_a",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
					Citizen.Wait(1000)

					--DeleteObject(drugObj)
					--local cashObj = CreateObject(GetHashKey("prop_anim_cash_pile_01"), tvRP.getPosition(), true, false, false)
					--SetEntityAsMissionEntity(cashObj, true, true)
					--AttachEntityToEntity(cashObj, PlayerPedId(), playerBoneIndex, 0.1, 0.0, -0.05, 0.0, 90.0, 90.0, false, false, false, false, 2, true)

					StopAnimTask(pid, "missfbi_s4mop","plant_bomb_b", 1.0)
					StopAnimTask(oldped, "mp_common","givetake2_a", 1.0)
					Citizen.Wait(2000)
					--DeleteObject(cashObj)


					local random = math.random(1, 20)
					if random == 3 or random == 11 or random == 16 then
						local plyPos = GetEntityCoords(PlayerPedId())
						Citizen.CreateThread(function()
							local waitTime = math.random(3,6)
							Citizen.Wait(waitTime*1000)
							vRPserver.initDrugSaleAlert({plyPos})

							TriggerEvent('blrp_core:client:prepareAlert', {
								is_response = true,
								service_name = 'Police',
								can_accept = false,
								coords = plyPos,
								badge = 'Tip',
								badge_style = 'primary',
								msg = 'Suspicious Activity Reported',
								icon = 'fad fa-hand-holding-water',
								show_for = 5000,
								allow_gps = false
							})
						end)
					end
				else
					tvRP.notify("The person rejected your offer")
					selling = false
					actionInProgress = false
					tvRP.setActionLock(false)
					rejected = false
					SetEntityAsMissionEntity(oldped)
					local randomReport = math.random(1, 3)
					if randomReport == 3 then
						local plyPos = GetEntityCoords(PlayerPedId())
						Citizen.CreateThread(function()
							local waitTime = math.random(3,6)
							Citizen.Wait(waitTime*1000)
							vRPserver.initDrugSaleAlert({plyPos})

							TriggerEvent('blrp_core:client:prepareAlert', {
								is_response = true,
								service_name = 'Police',
								can_accept = false,
								coords = plyPos,
								badge = 'Tip',
								badge_style = 'primary',
								msg = 'Suspicious Activity Reported',
								icon = 'fad fa-hand-holding-water',
								show_for = 5000,
								allow_gps = false
							})
						end)
					end
				end
				--FreezeEntityPosition(oldped,false)
				--ClearPedTasks(oldped)
				TaskWanderStandard(oldped,true,true)
				SetPedAsNoLongerNeeded(oldped)
			end
		end
	end
end)

function sellDrug(flag)
	if flag then
		vRPserver.giveReward({drugSold,drugHandicap})
		drugSold = nil
		selling = false
		actionInProgress = false
		tvRP.setActionLock(false)
	end
end

function currentlySelling()
	selling = true
	secondsRemaining = 5
end

function tvRP.cancelDrug(drug)
	drugSold = drug
end

function tvRP.doneDrug()
	selling = false
	actionInProgress = false
	tvRP.setActionLock(false)
	secondsRemaining = 0
end

function startDrugHandicapThread()
	if not drugHandicapThreadRunning then
		drugHandicapThreadRunning = true
		drugHandicapTimeRemaining = defaultDrugHandicapTime
		Citizen.CreateThread(function()
			while drugHandicapThreadRunning and drugHandicapTimeRemaining > 0 do
				Citizen.Wait(1000)
				drugHandicapTimeRemaining = drugHandicapTimeRemaining - 1
			end
			drugHandicap = false
			drugSellingZone = nil
			drugHandicapThreadRunning = false
		end)
	end
end

function tvRP.publishDrugSaleAlert(pos)
  local transG = 100
  local centerX = pos.x+(math.random(-20,20))
  local centerY = pos.y+(math.random(-20,20))
  local drugSaleBlip = AddBlipForRadius(centerX, centerY, pos.z, 30.0)

  SetBlipColour(drugSaleBlip,  1)
  SetBlipAlpha(drugSaleBlip,  transG)
  SetBlipAsShortRange(drugSaleBlip,  1)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Suspicious Activity")
	EndTextCommandSetBlipName(drugSaleBlip)

  while transG ~= 0 do
    Wait(150 * 4)
    transG = transG - 1
    SetBlipAlpha(drugSaleBlip,  transG)
    if transG == 0 then
      if DoesBlipExist(drugSaleBlip) then
        RemoveBlip(drugSaleBlip)
      end
      return
    end
  end
end

local vehClasses = {}
vehClasses[0] = "compact car"
vehClasses[1] = "sedan"
vehClasses[2] = "SUV"
vehClasses[3] = "coupe"
vehClasses[4] = "muscle car"
vehClasses[5] = "sport classic"
vehClasses[6] = "sports car"
vehClasses[7] = "supercar"
vehClasses[8] = "motorcycle"
vehClasses[9] = "off-road vehicle"
vehClasses[10] = "industrial vehicle"
vehClasses[11] = "utility vehicle"
vehClasses[12] = "vans"
vehClasses[13] = "bicycle"
vehClasses[14] = "boat"
vehClasses[15] = "helicopter"
vehClasses[16] = "plane"
vehClasses[17] = "service vehicle"
vehClasses[18] = "emergency vehicle"
vehClasses[19] = "military vehicle"
vehClasses[20] = "commercial vehicle"
vehClasses[21] = "train"

local paintColors = {
	{name = "Black", colorindex = 0},
  {name = "Carbon Black", colorindex = 147},
	{name = "Graphite", colorindex = 1},
  {name = "Anthracite Black", colorindex = 11},
	{name = "Black Steel", colorindex = 2},
  {name = "Dark Steel", colorindex = 3},
	{name = "Silver", colorindex = 4},
  {name = "Bluish Silver", colorindex = 5},
	{name = "Rolled Steel", colorindex = 6},
  {name = "Shadow Silver", colorindex = 7},
	{name = "Stone Silver", colorindex = 8},
  {name = "Midnight Silver", colorindex = 9},
	{name = "Cast Iron Silver", colorindex = 10},
  {name = "Red", colorindex = 27},
	{name = "Torino Red", colorindex = 28},
  {name = "Formula Red", colorindex = 29},
	{name = "Lava Red", colorindex = 150},
  {name = "Blaze Red", colorindex = 30},
	{name = "Grace Red", colorindex = 31},
  {name = "Garnet Red", colorindex = 32},
	{name = "Sunset Red", colorindex = 33},
  {name = "Cabernet Red", colorindex = 34},
	{name = "Wine Red", colorindex = 143},
  {name = "Candy Red", colorindex = 35},
	{name = "Hot Pink", colorindex = 135},
  {name = "Pfsiter Pink", colorindex = 137},
	{name = "Salmon Pink", colorindex = 136},
  {name = "Sunrise Orange", colorindex = 36},
	{name = "Orange", colorindex = 38},
  {name = "Bright Orange", colorindex = 138},
	{name = "Gold", colorindex = 99},
  {name = "Bronze", colorindex = 90},
	{name = "Yellow", colorindex = 88},
  {name = "Race Yellow", colorindex = 89},
	{name = "Dew Yellow", colorindex = 91},
  {name = "Dark Green", colorindex = 49},
	{name = "Racing Green", colorindex = 50},
  {name = "Sea Green", colorindex = 51},
	{name = "Olive Green", colorindex = 52},
  {name = "Bright Green", colorindex = 53},
	{name = "Gasoline Green", colorindex = 54},
  {name = "Lime Green", colorindex = 92},
	{name = "Midnight Blue", colorindex = 141},
	{name = "Galaxy Blue", colorindex = 61},
  {name = "Dark Blue", colorindex = 62},
	{name = "Saxon Blue", colorindex = 63},
  {name = "Blue", colorindex = 64},
	{name = "Mariner Blue", colorindex = 65},
  {name = "Harbor Blue", colorindex = 66},
	{name = "Diamond Blue", colorindex = 67},
  {name = "Surf Blue", colorindex = 68},
	{name = "Nautical Blue", colorindex = 69},
  {name = "Racing Blue", colorindex = 73},
	{name = "Ultra Blue", colorindex = 70},
  {name = "Light Blue", colorindex = 74},
	{name = "Chocolate Brown", colorindex = 96},
  {name = "Bison Brown", colorindex = 101},
	{name = "Creeen Brown", colorindex = 95},
  {name = "Feltzer Brown", colorindex = 94},
	{name = "Maple Brown", colorindex = 97},
  {name = "Beechwood Brown", colorindex = 103},
	{name = "Sienna Brown", colorindex = 104},
  {name = "Saddle Brown", colorindex = 98},
	{name = "Moss Brown", colorindex = 100},
  {name = "Woodbeech Brown", colorindex = 102},
	{name = "Straw Brown", colorindex = 99},
  {name = "Sandy Brown", colorindex = 105},
	{name = "Bleached Brown", colorindex = 106},
  {name = "Schafter Purple", colorindex = 71},
	{name = "Spinnaker Purple", colorindex = 72},
  {name = "Midnight Purple", colorindex = 142},
	{name = "Bright Purple", colorindex = 145},
  {name = "Cream", colorindex = 107},
	{name = "Ice White", colorindex = 111},
  {name = "Frost White", colorindex = 112},
	{name = "Brushed Steel",colorindex = 117},
	{name = "Brushed Black Steel",colorindex = 118},
	{name = "Brushed Aluminum",colorindex = 119},
	{name = "Pure Gold",colorindex = 158},
	{name = "Brushed Gold",colorindex = 159},
	{name = "Black", colorindex = 12},
	{name = "Gray", colorindex = 13},
	{name = "Light Gray", colorindex = 14},
	{name = "Ice White", colorindex = 131},
	{name = "Blue", colorindex = 83},
	{name = "Dark Blue", colorindex = 82},
	{name = "Midnight Blue", colorindex = 84},
	{name = "Midnight Purple", colorindex = 149},
	{name = "Schafter Purple", colorindex = 148},
	{name = "Red", colorindex = 39},
	{name = "Dark Red", colorindex = 40},
	{name = "Orange", colorindex = 41},
	{name = "Yellow", colorindex = 42},
	{name = "Lime Green", colorindex = 55},
	{name = "Green", colorindex = 128},
	{name = "Frost Green", colorindex = 151},
	{name = "Foliage Green", colorindex = 155},
	{name = "Olive Drab", colorindex = 152},
	{name = "Dark Earth", colorindex = 153},
	{name = "Desert Tan", colorindex = 154},
  {name = "Chrome", colorindex = 120}
}

function triggerMissionPoliceAlert()
	local lastVehicle = GetPlayersLastVehicle()
	local playerSex = nil
	local vehColour = nil
	local vehType = nil
	local vehModel = nil
 	local vehPlate = nil
	local directionTravel = nil

	local male = IsPedMale(PlayerPedId())
	if male then
		playerSex = "Male"
	elseif not male then
		playerSex = "Female"
	end
	if lastVehicle ~= nil and lastVehicle ~= 0 and lastVehicle ~= -1 then
		vehPlate = GetVehicleNumberPlateText(lastVehicle)
		local carModel = GetEntityModel(lastVehicle)
	  vehModel = GetDisplayNameFromVehicleModel(carModel)
		local colour1, colour2 = GetVehicleColours(lastVehicle)
		local colour1Text = "Unknown"
		local colour2Text = "Unknown"
		for k,v in pairs(paintColors) do
			if v.colorindex == colour1 then
				colour1Text = v.name
			end
			if v.colorindex == colour2 then
				colour2Text = v.name
			end
		end
		vehColour = colour1Text.." paint with "..colour2Text.." trim"
		vehType = vehClasses[GetVehicleClass(lastVehicle)]
		local msg = "No info"
		math.randomseed(123213124)
		local alertOdds = math.random(0, 1)
		local sexOdds = math.random(0, 1)
		local vehColourOdds = math.random(1, 10)
		local vehTypeOdds = math.random(0, 1)
		local vehModelOdds = math.random(0, 1)
		local vehPlateOdds = math.random(0, 1)
		tvRP.notify("Crime<br>Sexe: "..playerSex.."<br>vehColour: "..vehColour.."<br>vehType: "..vehType.."<br>vehModel: "..vehModel.."<br>vehPlate: "..vehPlate)
	else
		tvRP.notify("Crime<br>Sexe: "..playerSex)
	end

end

local mission_in_progress = false

function tvRP.performDrugdelivery(delivery_items)
	if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		if not mission_in_progress then
			triggerMissionPoliceAlert()
			mission_in_progress = true

			exports['mythic_progbar']:Progress({
					name = "drug_delivery_action",
					duration = 1000,
					label = "Delivering Package",
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
							disableMovement = false,
							disableCarMovement = false,
							disableMouse = false,
							disableCombat = true,
					},
					animation = {
							task= "PROP_HUMAN_BUM_BIN", -- TODO change anim
					},
			}, function(status)
					if not status then
						tvRP.notify("Transaction complete")
						vRPserver.rewardMission({delivery_items})
					else
						tvRP.notify("Transaction cancelled")
					end
					mission_in_progress = false
			end)
		else
			tvRP.notify("Delivery in progress")
		end
	else
		tvRP.notify("Cancelled in veh")
	end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawSpecialText(m_text)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(250, 1)
end


function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	if(outline)then
		SetTextOutline()
	end
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
