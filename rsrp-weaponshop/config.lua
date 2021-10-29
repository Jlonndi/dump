Config               = {}

Config.DrawDistance  = 2
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 155, b = 253 }
Config.Type          = 27

Config.Blur			 = true

Config.Zones = {
	GunShop = {
		-- These are in ALPHABETICAL ORDER
		Items = {
			{
				label = GetLabelText("WT_PIST_AP"),
				item = 'WEAPON_APPISTOL',
				desc = GetLabelText("WTD_PIST_AP")
			},
			{
				label = GetLabelText("WT_RIFLE_ADV"),
				item = 'WEAPON_ADVANCEDRIFLE',
				desc = GetLabelText("WTD_RIFLE_ADV")
			},
			{
				label = GetLabelText("WT_RIFLE_ASL"),
				item = 'WEAPON_ASSAULTRIFLE',
				desc = GetLabelText("WTD_RIFLE_ASL")
			},
			{
				label = GetLabelText("WT_RIFLE_ASL2"),
				item = 'WEAPON_ASSAULTRIFLE_MK2',
				desc = GetLabelText("WTD_RIFLE_ASL2")
			},
			{
				label = GetLabelText("WT_SMG_ASL"),
				item = 'WEAPON_ASSAULTSMG',
				desc = GetLabelText("WTD_SMG_ASL")
			},
			{
				label = GetLabelText("WT_AUTOSHGN"),
				item = 'WEAPON_AUTOSHOTGUN',
				desc = GetLabelText("WTD_AUTOSHGN")
			},
			{
				label = GetLabelText("WT_BAT"),
				item = 'WEAPON_BAT',
				desc = GetLabelText("WTD_BAT")
			},
			{
				label = GetLabelText("WT_BALL"),
				item = 'WEAPON_BALL',
				desc = GetLabelText("WT_BALL").."."
			},
			{
				label = GetLabelText("WT_BATTLEAXE"),
				item = 'WEAPON_BATTLEAXE',
				desc = GetLabelText("WTD_BATTLEAXE")
			},
			{
				label = GetLabelText("WT_BOTTLE"),
				item = 'WEAPON_BOTTLE',
				desc = GetLabelText("WTD_BOTTLE")
			},
			{
				label = GetLabelText("WT_BULLRIFLE"),
				item = 'WEAPON_BULLPUPRIFLE',
				desc = GetLabelText("WTD_BULLRIFLE")
			},
			{
				label = GetLabelText("WT_BULLRIFLE2"),
				item = 'WEAPON_BULLPUPRIFLE_MK2',
				desc = GetLabelText("WTD_BULLRIFLE2")
			},
			{
				label = GetLabelText("WT_BZGAS"),
				item = 'WEAPON_BZGAS',
				desc = GetLabelText("WT_BZGAS") .. "."
			},
			{
				label = GetLabelText("WT_RIFLE_CBN"),
				item = 'WEAPON_CARBINERIFLE',
				desc = GetLabelText("WTD_RIFLE_CBN")
			},
			{
				label = GetLabelText("WT_RIFLE_CBN2"),
				item = 'WEAPON_CARBINERIFLE_MK2',
				desc = GetLabelText("WTD_RIFLE_CBN2")
			},
			--[[
			{
				label = GetLabelText("WT_CERPST"),
				item = 'WEAPON_CERAMICPISTOL',
				desc = GetLabelText("WTD_CERPST")
			},
			]]--
			{
				label = GetLabelText("WT_MG_CBT"),
				item = 'WEAPON_COMBATMG',
				desc = GetLabelText("WTD_MG_CBT")
			},
			{
				label = GetLabelText("WT_PIST_CBT"),
				item = 'WEAPON_COMBATPISTOL',
				desc = GetLabelText("WTD_PIST_CBT")
			},
			--[[
			{
				label = GetLabelText("WT_CMBSHGN"),
				item = 'WEAPON_COMBATSHOTGUN',
				desc = GetLabelText("WTD_CMBSHGN")
			},
			]]--
			{
				label = GetLabelText("WT_CMPRIFLE"),
				item = 'WEAPON_COMPACTRIFLE',
				desc = GetLabelText("WTD_CMPRIFLE")
			},
			{
				label = GetLabelText("WT_CROWBAR"),
				item = 'WEAPON_CROWBAR',
				desc = GetLabelText("WTD_CROWBAR")
			},
			{
				label = GetLabelText("WT_DAGGER"),
				item = 'WEAPON_DAGGER',
				desc = GetLabelText("WTD_DAGGER")
			},
			{
				label = GetLabelText("WT_DBSHGN"),
				item = 'WEAPON_DBSHOTGUN',
				desc = GetLabelText("WTD_DBSHGN")
			},
			{
				label = GetLabelText("WT_REV_DA"),
				item = 'WEAPON_DOUBLEACTION',
				desc = GetLabelText("WTD_REV_DA")
			},
			{
				label = GetLabelText("WT_FIRE"),
				item = 'WEAPON_FIREEXTINGUISHER',
				desc = GetLabelText("WT_FIRE") .. "."
			},
			{
				label = GetLabelText("WT_FWRKLNCHR"),
				item = 'WEAPON_FIREWORK',
				desc = GetLabelText("WT_FWRKLNCHR") .. "."
			},
			{
				label = GetLabelText("WT_FLARE"),
				item = 'WEAPON_FLARE',
				desc = GetLabelText("WT_FLARE") .. "."
			},
			{
				label = GetLabelText("WT_FLAREGUN"),
				item = 'WEAPON_FLAREGUN',
				desc = GetLabelText("WTD_FLAREGUN")
			},
			{
				label = GetLabelText("WT_FLASHLIGHT"),
				item = 'WEAPON_FLASHLIGHT',
				desc = GetLabelText("WTD_FLASHLIGHT")
			},
			{
				label = GetLabelText("WT_GOLFCLUB"),
				item = 'WEAPON_GOLFCLUB',
				desc = GetLabelText("WTD_GOLFCLUB")
			},
			{
				label = GetLabelText("WT_GUSENBERG"),
				item = 'WEAPON_GUSENBERG',
				desc = GetLabelText("WTD2_GUSNBRG")
			},
			{
				label = GetLabelText("WT_HAMMER"),
				item = 'WEAPON_HAMMER',
				desc = GetLabelText("WTD_HAMMER")
			},
			{
				label = GetLabelText("WT_HATCHET"),
				item = 'WEAPON_HATCHET',
				desc = GetLabelText("WTD_HATCHET")
			},
			{
				label = GetLabelText("WT_HEAVYPSTL"),
				item = 'WEAPON_HEAVYPISTOL',
				desc = GetLabelText("WTD2_HVYPISTOL")
			},
			{
				label = GetLabelText("WT_HVYSHOT"),
				item = 'WEAPON_HEAVYSHOTGUN',
				desc = GetLabelText("WTD2_HVYSHGN")
			},
			{
				label = GetLabelText("WT_SNIP_HVY"),
				item = 'WEAPON_HEAVYSNIPER',
				desc = GetLabelText("WTD_SNIP_HVY")
			},
			{
				label = GetLabelText("WT_SNIP_HVY2"),
				item = 'WEAPON_HEAVYSNIPER_MK2',
				desc = GetLabelText("WTD_SNIP_HVY2")
			},
			{
				label = GetLabelText("WT_KNIFE"),
				item = 'WEAPON_KNIFE',
				desc = GetLabelText("WTD_KNIFE")
			},
			{
				label = GetLabelText("WT_KNUCKLE"),
				item = 'WEAPON_KNUCKLE',
				desc = GetLabelText("WTD_KNUCKLE")
			},
			{
				label = GetLabelText("WT_MACHETE"),
				item = 'WEAPON_MACHETE',
				desc = GetLabelText("WTD_MACHETE")
			},
			{
				label = GetLabelText("WT_MCHPIST"),
				item = 'WEAPON_MACHINEPISTOL',
				desc = GetLabelText("WTD_MCHPIST")
			},
			{
				label = GetLabelText("WT_MKRIFLE"),
				item = 'WEAPON_MARKSMANRIFLE',
				desc = GetLabelText("WTD_MKRIFLE")
			},
			{
				label = GetLabelText("WT_MKRIFLE2"),
				item = 'WEAPON_MARKSMANRIFLE_MK2',
				desc = GetLabelText("WTD_MKRIFLE2")
			},
			{
				label = GetLabelText("WT_MG"),
				item = 'WEAPON_MG',
				desc = GetLabelText("WTD_MG")
			},
			{
				label = GetLabelText("WT_SMG_MCR"),
				item = 'WEAPON_MICROSMG',
				desc = GetLabelText("WTD_SMG_MCR")
			},
			--[[
			{
				label = GetLabelText("WT_MLTRYRFL"),
				item = 'WEAPON_MILITARYRIFLE',
				desc = GetLabelText("WTD_MLTRYRFL")
			},
			]]--
			{
				label = GetLabelText("WT_MINISMG"),
				item = 'WEAPON_MINISMG',
				desc = GetLabelText("WTD_MINISMG")
			},
			{
				label = GetLabelText("WT_MOLOTOV"),
				item = 'WEAPON_MOLOTOV',
				desc = GetLabelText("WTD_MOLOTOV")
			},
			{
				label = GetLabelText("WT_MUSKET"),
				item = 'WEAPON_MUSKET',
				desc = GetLabelText("WTD_MUSKET")
			},
			--[[
			{
				label = GetLabelText("WT_REV_NV"),
				item = 'WEAPON_NAVYREVOLVER',
				desc = GetLabelText("WTD_REV_NV")
			},
			]]--
			{
				label = GetLabelText("WT_NGTSTK"),
				item = 'WEAPON_NIGHTSTICK',
				desc = GetLabelText("WTD_NGTSTK")
			},
			{
				label = GetLabelText("WT_PETROL"),
				item = 'WEAPON_PETROLCAN',
				desc = GetLabelText("WTD_PETROL")
			},
			{
				label = GetLabelText("WT_PIST"),
				item = 'WEAPON_PISTOL',
				desc = GetLabelText("WT_PIST_DESC")
			},
			{
				label = GetLabelText("WT_PIST_50"),
				item = 'WEAPON_PISTOL50',
				desc = GetLabelText("WTD_PIST_50")
			},
			{
				label = GetLabelText("WT_PIST2"),
				item = 'WEAPON_PISTOL_MK2',
				desc = GetLabelText("WTD_PIST2")
			},
			{
				label = GetLabelText("WT_POOLCUE"),
				item = 'WEAPON_POOLCUE',
				desc = GetLabelText("WTD_POOLCUE")
			},
			{
				label = GetLabelText("WT_SG_PMP"),
				item = 'WEAPON_PUMPSHOTGUN',
				desc = GetLabelText("WTD_SG_PMP")
			},
			{
				label = GetLabelText("WT_SG_PMP2"),
				item = 'WEAPON_PUMPSHOTGUN_MK2',
				desc = GetLabelText("WTD_SG_PMP2")
			},
			{
				label = GetLabelText("WT_REVOLVER"),
				item = 'WEAPON_REVOLVER',
				desc = GetLabelText("WTD_REVOLVER")
			},
			{
				label = GetLabelText("WT_REVOLVER2"),
				item = 'WEAPON_REVOLVER_MK2',
				desc = GetLabelText("WTD_REVOLVER2")
			},
			{
				label = GetLabelText("WT_SG_SOF"),
				item = 'WEAPON_SAWNOFFSHOTGUN',
				desc = GetLabelText("WTD_SG_SOF")
			},
			{
				label = GetLabelText("WT_SMG"),
				item = 'WEAPON_SMG',
				desc = GetLabelText("WTD_SMG")
			},
			{
				label = GetLabelText("WT_SMG2"),
				item = 'WEAPON_SMG_MK2',
				desc = GetLabelText("WTD_SMG2")
			},
			{
				label = GetLabelText("WT_GNADE_SMK"),
				item = 'WEAPON_SMOKEGRENADE',
				desc = GetLabelText("WTD_GNADE_SMK")
			},
			{
				label = GetLabelText("WT_SNIP_RIF"),
				item = 'WEAPON_SNIPERRIFLE',
				desc = GetLabelText("WTD_SNIP_RIF")
			},
			{
				label = GetLabelText("WT_SNWBALL"),
				item = 'WEAPON_SNOWBALL',
				desc = GetLabelText("WT_SNWBALL") .. "."
			},
			{
				label = GetLabelText("WT_SNSPISTOL"),
				item = 'WEAPON_SNSPISTOL',
				desc = GetLabelText("WTD_SNSPISTOL")
			},
			{
				label = GetLabelText("WT_SNSPISTOL2"),
				item = 'WEAPON_SNSPISTOL_MK2',
				desc = GetLabelText("WTD_SNSPISTOL2")
			},
			{
				label = GetLabelText("WT_RIFLE_SCBN"),
				item = 'WEAPON_SPECIALCARBINE',
				desc = GetLabelText("WTD_SPCARBINE")
			},
			--[[
			{
				label = GetLabelText("WT_SPCARBINE2"),
				item = 'WEAPON_SPECIALCARBINE_MK2',
				desc = GetLabelText("WTD_SPCARBINE2")
			},
			]]--
			--[[
			{
				label = GetLabelText("WT_SHATCHET"),
				item = 'WEAPON_STONEHATCHET',
				desc = GetLabelText("WTD_SHATCHET")
			},
			]]--
			{
				label = GetLabelText("WT_STUN"),
				item = 'WEAPON_STUNGUN',
				desc = GetLabelText("WTD_STUN")
			},
			{
				label = GetLabelText("WT_SWBLADE"),
				item = 'WEAPON_SWITCHBLADE',
				desc = GetLabelText("WTD_SWBLADE")
			},
			{
				label = GetLabelText("WT_VPISTOL"),
				item = 'WEAPON_VINTAGEPISTOL',
				desc = GetLabelText("WTD_VPISTOL")
			},
			{
				label = GetLabelText("WT_WRENCH"),
				item = 'WEAPON_WRENCH',
				desc = GetLabelText("WT_WRENCH")
			}
		},
		Locations = {
			{
				ShopLocation = vector3(-662.1, -935.3, 20.8),
				ShopClerkLocation = vector4(-661.69, -933.09, 21.83, 175.3)
			},
			{
				ShopLocation = vector3(1693.89, 3759.7, 34.71),
				ShopClerkLocation = vector4(1692.65, 3761.62, 34.71, 220.50)
			},
			{
				ShopLocation = vector3(-1117.5, 2698.6, 17.5),
				ShopClerkLocation = vector4(-1118.64, 2700.52, 18.55, 208.77)
			},
			{
				ShopLocation = vector3(810.2, -2157.3, 28.6),
				ShopClerkLocation = vector4(809.26, -2159.26, 29.62, 335.26)
			},
			{
				ShopLocation = vector3(-330.2, 6083.8, 30.4),
				ShopClerkLocation = vector4(-331.19, 6085.64, 31.45, 207.51)
			},
			{
				ShopLocation = vector3(252.3, -50.0, 68.9),
				ShopClerkLocation = vector4(253.86, -51.57, 69.94, 57.39)
			},
			{
				ShopLocation = vector3(22.0, -1107.2, 28.8),
				ShopClerkLocation = vector4(23.43, -1105.48, 29.8, 145.58)
			},
			{
				ShopLocation = vector3(2567.6, 294.3, 107.7),
				ShopClerkLocation = vector4(2567.21, 292.23, 108.73, 343.66)
			},
			{
				ShopLocation = vector3(842.4, -1033.4, 27.1),
				ShopClerkLocation = vector4(841.55, -1035.42, 28.19, 344.5)
			},
			{
				ShopLocation = vector3(-1305.96, -394.39, 36.7),
				ShopClerkLocation = vector4(-1304.08, -395.48, 36.7, 59.99)
			},
			{
				ShopLocation = vector3(-3171.38, 1087.79, 20.84),
				ShopClerkLocation = vector4(-3173.44, 1089.15, 20.84, 237.11)
			},
		}
	},
}
