local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Mythic Hub ",
	SubTitle = "por Equipe Mythic",
	TabWidth = 160,
	Size = UDim2.fromOffset(460, 340),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})

--Lucide Icons https://lucide.dev/icons
local Tabs = {
	Inicio = Window:AddTab({ Title = "Início", Icon = "home" }),
	Prototipo = Window:AddTab({ Title = "Protótipo", Icon = "atom" }),
	Configuracoes = Window:AddTab({ Title = "Configurações", Icon = "settings" })
}

local Options = Fluent.Options

do
	Tabs.Inicio:AddParagraph({
        Title = "Mensagem",
        Content = "Feito com ❤️ pela Equipe Mythic para vocês!"
	})
	Tabs.Inicio:AddButton({
		Title = "Discord",
		Description = "Copie e link para acessar nosso discord!",
		Callback = function()
			setclipboard("https://discord.com/invite/jDe7KxDfxa")
			Fluent:Notify({
				Title = "Equipe Mythic",
				Content = "Link para Discord copiado!",
				SubContent = "",
				Duration = 4
			})
		end
	})

	Tabs.Prototipo:AddButton({
		Title = "Obter Omnitrix Protótipo",
		Description = "Copie e link para acessar nosso discord!",
		Callback = function()
			fireclickdetector(workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt)
			Fluent:Notify({
				Title = "Equipe Mythic",
				Content = "Omnitrix Protótipo obtido!",
				SubContent = "",
				Duration = 2
			})
		end
	})
end

InterfaceManager:SetFolder("MythicHub")
SaveManager:SetFolder("MythicHub/OminiX")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Mythic Team",
    Content = "Mythic Hub foi carregado!",
    Duration = 4
})

SaveManager:LoadAutoloadConfig()
