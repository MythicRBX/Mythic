local games = {
	[{11448431235}] = "loadstring(game:HttpGet("")()",
}

for ids, url in next, games do
	if table.find(ids, game.PlaceId) then
		loadstring(game:HttpGet(url))()
		break
	end
end
