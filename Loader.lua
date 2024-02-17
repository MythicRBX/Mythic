local games = {
	[{11448431235}] = "https://raw.githubusercontent.com/MythicHubRBLX/Mythic/main/Games/Test.lua"
}

for ids, url in next, games do
	if table.find(ids, game.PlaceId) then
		loadstring(game:HttpGet(url))()
		break
	end
end
