-----------------------
--- DiscordPedPerms ---
-----------------------
restrictedPeds = {
{}, -- civilian (1)
{}, -- booster (2)
{}, -- supporter (3)
{
"a_c_retriever",
"a_c_husky",
"a_c_shepherd",
"a_c_chop",
}, -- leo (4)
{}, -- staff (5)
{}, -- st (6)
{}, -- mod (7)
{}, -- smod (8)
{}, -- admin (9)
{}, -- sadmin (10)
{}, -- hadmin (11)
{}, -- management (12)
{
"a_c_boar",
"a_m_m_acult_01",
"a_c_chimp",
}, -- owner (13)
}
allowedPed = "xxxtentacion"
alreadyRan = false
isAllowed = {}
RegisterNetEvent('DiscordPedPerms:CheckPerms:Return')
AddEventHandler('DiscordPedPerms:CheckPerms:Return', function(hasPerms)
	isAllowed = hasPerms
end)
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
		local ped = GetPlayerPed(-1)
		local modelhashed = GetHashKey(allowedPed)
    
        -- Request the model, and wait further triggering untill fully loaded.
	    RequestModel(modelhashed)
	    while not HasModelLoaded(modelhashed) do 
	    	RequestModel(modelhashed)
	    	Citizen.Wait(0)
	    end
		if not alreadyRan then
			TriggerServerEvent('DiscordPedPerms:CheckPerms')
			alreadyRan = true
		end
		for i = 1, #restrictedPeds do
			for j = 1, #restrictedPeds[i] do
				if IsPedModel(ped, GetHashKey(tostring(restrictedPeds[i][j]))) then
					-- They can't use that ped
					if not has_value(isAllowed, i) then
						SetPlayerModel(PlayerId(), modelhashed)
						SetModelAsNoLongerNeeded(modelHashed)
						DisplayNotification('~r~RESTRICTED PED')
					end
				end
			end
		--[[
			if IsPedModel(ped, GetHashKey(restrictedPeds[i])) then
				-- They can't use that ped
				SetPlayerModel(PlayerId(), modelhashed)
				SetModelAsNoLongerNeeded(modelHashed)
				DisplayNotification('~r~RESTRICTED PED')
			end
			--]]--
		end
	end
end)

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end