
local DiscordAppId = 775204257565507634
local DiscordAppAsset = "BadlandsRP"

Citizen.CreateThread(function()
	SetDiscordAppId(DiscordAppId)
	SetDiscordRichPresenceAsset(DiscordAppAsset)
	SetRichPresence("FiveM Roleplay")
	SetDiscordRichPresenceAsset("logo_name")
	SetDiscordRichPresenceAssetSmall("logo_name")
end)
