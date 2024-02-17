local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/Fluent.lua"))()

local Games = {
	[11448431235] = "https://raw.githubusercontent.com/MythicHubRBLX/Mythic/main/Games/OmniX.lua"
}

local Link = Games[game.PlaceId]

if not Link then
	Fluent:Notify({
		Title = "Equipe Mythic",
		Content = "Mythic não possui suporte neste jogo!",
		Duration = 5
	})
else
	Fluent:Notify({
		Title = "Equipe Mythic",
		Content = "Mythic está iniciando!",
		Duration = 4
	})
end

loadstring(game:HttpGet(Link))()
