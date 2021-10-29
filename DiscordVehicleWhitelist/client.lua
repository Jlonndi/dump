------------------------------------------------
--- Discord Vehicle Whitelist, Made by FAXES ---
------------------------------------------------

--- Config ---
restrictedVehicles = {
{}, -- (civilian)
{
"buzzard2",
"frogger",
"frogger2",
"havok",
"maverick",
"seasparrow2",
"seasparrow3",
"supervolito",
"supervolito2",
"swift",
"swift2",
"volatus",
"alphaz1",
"besra",
"dodo",
"cuban800",
"duster",
"howard",
"luxor",
"luxor2",
"mammatus",
"microlight",
"miljet",
"seabreeze",
"shamal",
"stunt",
"velum",
"velum2",
"vestra",
"nimbus",
"impreza2019",
"m3kean",
"czr1",
"21camaro",
"razerx3",
"ss69",
"xkgt",
"nc1",
"vip8",
"mqgts",
"2ndgendually",
"18f350d",
"bc203500hd",
"bcrzrdune",
"bcguru",
"driftram",
"bc24vc",
}, -- (booster)
{
"2f2fgts",
"fnflan",
"2f2fmk4",
"ff4wrx",
"fnfmk4",
"2f2fmle7",
"fnf4r34",
"2f2fgtr34",
"fnfrx7",
"fnfmits",
}, -- (fafpack)
{
"f620",
"buffalo",
"ninef2",
"sultanrs",
"penumbra",
"intruder",
"mk2100",
"fk8",
}, -- (jdmpack)
{
"m3e36normal",
"mads14",
"gfreesc300",
"casup",
"ap2",
"mxrb",
"srt10",
"e34",
}, -- (driftpack)
{
"rmodmi8lb",
"g65top",
"fdstang",
"trhawk",
"rmodsianr",
"senna",
"f812",
"lp700",
"jes",
"evo10",
"rubi3d",
"rmz85cc",
"tr22",
"sandking",
"ksd",
"f350offroadspec",
"rx7veilside",
"19gt500",
"bcaustinmelo",
"bcal450",
"bcbuggyxl",
"bcfabjeep",
"bu2020",
"2020GMC",
}, -- (supporter)
{
"legacycap",
"legacycharg",
"legacycharg2",
"legacyram",
"legacytahoe",
"legacytahoe2",
"legacycvpi",
"legacyf150",
"legacyfpis",
"legacyfpiu",
"14charger",
"18charger",
"14tesla",
"16taurus",
"f250",
"chevyss",
"ram",
"gmc",
"cherokee",
"18tahoe",
"19durango",
"911turboleo",
"amggtrleo",
"viperleo",
"hillboaty",
"largeboat",
"smallboat",
"riot",
"mrap",
"swathummer",
"valor13tahoe",
"valor14charg",
"valor15f150",
"valor16fpiu",
"valor18charg",
"valor18tahoe",
"valor19silv",
"valor20fpiu",
"valor20ram",
"valorram",
"valorcvpi",
"valorcap",
"valorf250",
"valorcvpi",
"valorfpis",
"valorgmc",
}, -- (leo)
{
"mustang19",
"na",
}, -- (staff)
{
"na",
"na",
}, -- (st)
{
"na",
"na",
"na",
"na",
"na",
"na",
}, -- (mod)
{
"na",
"na",
"na",
"na",
"na",
"na",
}, -- (smod)
{
"na",
"na",
"na",
"na",
"na",
"na",
}, -- (admin)
{
"na",
"na",
"na",
"na",
"na",
"na",
}, -- (sadmin)
{
"bcss",
"na",
"na",
"na",
"na",
"na",
}, -- (hadmin)
{
"na",
"na",
"na",
"na",
"na",
"na",
}, -- (management)
{
"2ndgen3500",
"bcmmii",
"na",
"na",
"na",
}, -- (owner)
}

--- Code ---

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("FaxDisVeh:CheckPermission", src)
end)

allowedList = {}

RegisterNetEvent("FaxDisVeh:CheckPermission:Return")
AddEventHandler("FaxDisVeh:CheckPermission:Return", function(allowedVehicles, error)
    if error then
        print("[FAX DISCORD VEHICLE WHITELIST ERROR] No Discord identifier was found! Permissions set to false")
    end
	allowedList = allowedVehicles
end)

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(400)

		local ped = PlayerPedId()
		local veh = nil

		if IsPedInAnyVehicle(ped, false) then
			veh = GetVehiclePedIsUsing(ped)
		else
			veh = GetVehiclePedIsTryingToEnter(ped)
		end
		
		if veh and DoesEntityExist(veh) then
			local model = GetEntityModel(veh)
			local driver = GetPedInVehicleSeat(veh, -1)
			-- Check if it has one of the restricted vehicles
			local endLoop = false
			local requiredPerm = nil
			for i = 1, #restrictedVehicles do
				for j = 1, #restrictedVehicles[i] do
					if GetHashKey(restrictedVehicles[i][j]) == model then
						-- It requires a permission
						requiredPerm = i
						endLoop = true
						--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "Requires perm = " .. tostring(i)}}) -- TODO debug - get rid of
						break
					end
				end
				if endLoop then
					break
				end
			end
			local hasPerm = false
			if requiredPerm ~= nil then
				--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "RequiredPerm != nil"}}) -- TODO debug - get rid of
				if has_value(allowedList, requiredPerm) then
					--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "hasPerm = true"}}) -- TODO debug - get rid of
					hasPerm = true
				end
			end
			--TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "Value of hasPerm = " .. tostring(hasPerm)}}) -- TODO debug - get rid of
			-- If doesn't have permission, it's a restricted vehicle to them
			if not hasPerm and (requiredPerm ~= nil) then
				if driver == ped then
					ShowInfo("~r~Restricted Vehicle Model.")
					DeleteEntity(veh)
					ClearPedTasksImmediately(ped)
				end
			end
        end
        -- local src = source
        -- TriggerServerEvent("FaxDisVeh:CheckPermission", src)
    end
end)

--- Functions ---
function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, false)
end
function DeleteE(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end
