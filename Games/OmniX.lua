local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/Fluent.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicHubRBLX/MythicLib/main/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Mythic",
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
	Prototipo = Window:AddTab({ Title = "Protótipo", Icon = "watch" }),
	Configuracoes = Window:AddTab({ Title = "Configurações", Icon = "settings" })
}

local function Tween(Posicao, Duracao, onCompleteFunction)
	local TweenService = game:GetService("TweenService")
	local HumanoidRootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, Duracao)
	local goal = {}
	goal.CFrame = CFrame.new(Posicao)
	local tween = TweenService:Create(HumanoidRootPart, TweenInfo, goal)

	tween.Completed:Connect(function()
		if onCompleteFunction then
			onCompleteFunction()
		end
	end)

	tween:Play()
end

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
		Title = "Obter",
		Description = "Obtenha o Omnitrix Protótipo",
		Callback = function()
			Tween(workspace.Map.ScriptsParts.OMCAPSULE.Interact.CFrame, 3, function()
				fireproximityprompt(workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt)
			end)
			Fluent:Notify({
				Title = "Equipe Mythic",
				Content = "Omnitrix Protótipo obtido!",
				SubContent = "",
				Duration = 2
			})
		end
	})
end

InterfaceManager:SetLibrary(Fluent)
SaveManager:SetLibrary(Fluent)

InterfaceManager:SetFolder("Mythic")
SaveManager:SetFolder("Mythic/OminiX")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Equipe Mythic",
    Content = "Mythic foi carregado!",
    Duration = 4
})

SaveManager:LoadAutoloadConfig()
