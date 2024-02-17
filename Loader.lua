local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/Fluent.lua"))()

local Games = {
	[5210095481] = "https://raw.githubusercontent.com/MythicHubRBLX/Mythic/main/Games/OmniX.lua"
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
		Duration = 3
	})

	task.wait(1)
	loadstring(game:HttpGet(Link))()
end
