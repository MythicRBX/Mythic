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

-- Lucide Icons https://lucide.dev/icons
local Tabs = {
    Inicio = Window:AddTab({Title = "Início", Icon = "home"}),
    Prototipo = Window:AddTab({Title = "Protótipo", Icon = "watch"}),
    Recalibrado = Window:AddTab({Title = "Recalibrado", Icon = "timer-reset"})
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
    ----------------------------------------------------------------------------
    Tabs.Prototipo:AddButton({
        Title = "Obter",
        Description = "Obtenha o Omnitrix Protótipo",
        Callback = function()
            Tween(workspace.Map.ScriptsParts.OMCAPSULE.Interact.Position, 3.5, function()
                fireproximityprompt(workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt)
                task.wait()
                fireproximityprompt(workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt)
                task.wait()
                fireproximityprompt(workspace.Map.ScriptsParts.OMCAPSULE.Interact.ProximityPrompt)
                task.wait(0.3)

                Fluent:Notify({
                    Title = "Equipe Mythic",
                    Content = "Omnitrix Protótipo obtido!",
                    SubContent = "",
                    Duration = 2
                })
            end)
        end
    })
    Tabs.Prototipo:AddButton({
        Title = "Destransformar",
        Description = "Faz você se destransformar do alien atual",
        Callback = function()
            local args = {
                [1] = false
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnMorph")
                :FireServer(unpack(args))
        end
    })
    local Dropdown1 = Tabs.Prototipo:AddDropdown("PrototipoAliens", {
        Title = "Transformar (Bateria infinita)",
        Values = {"heatblast", "wildmutt", "diamond", "xrl8", "graymatter", "fourarms", "stinkfly", "ripjaws", "ultrat","ghostfreak", "cannonbolt", "wildvine", "blitzwolfer", "snareoh", "frankenstrike", "upchuck","eyeguy", "waybig", "ditto", "feedback", "buzzshock", "articguana", "spitter", "clockwork"},
        Multi = false,
        Default = nil
    })

    Dropdown1:OnChanged(function(Value)
        local args = {
            [1] = "OS",
            [2] = Value,
            [3] = (game:GetService("ReplicatedStorage").Aliens.OS[Value].Character[Value].Humanoid.Health - 100),
            [4] = true
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AlienMorph"):FireServer(unpack(args))
        Dropdown1:SetValue(nil)
    end)
    ----------------------------------------------------------------------------
    Tabs.Recalibrado:AddButton({
        Title = "Obter (Nível 190)",
        Description = "Obtenha o Omnitrix Recalibrado",
        Callback = function()
            Tween(workspace.SpaceStar.TPSpaceShip.TP1.Position, 3.5, function()
                fireproximityprompt(workspace.SpaceStar.TPSpaceShip.TP1.ProximityPrompt)
                task.wait()
                fireproximityprompt(workspace.SpaceStar.TPSpaceShip.TP1.ProximityPrompt)
                task.wait()
                fireproximityprompt(workspace.SpaceStar.TPSpaceShip.TP1.ProximityPrompt)
				task.wait(7.5)

				Tween(workspace.SpaceStar.RECALIBRATE, 1.5, function()
					fireproximityprompt(workspace.SpaceStar.RECALIBRATE.ProximityPrompt)
					task.wait()
					fireproximityprompt(workspace.SpaceStar.RECALIBRATE.ProximityPrompt)
					task.wait()
					fireproximityprompt(workspace.SpaceStar.RECALIBRATE.ProximityPrompt)
					task.wait(0.3)

					Fluent:Notify({
						Title = "Equipe Mythic",
						Content = "Omnitrix Protótipo obtido!",
						SubContent = "",
						Duration = 2
					})
				end)
            end)
        end
    })
	Tabs.Recalibrado:AddButton({
        Title = "Destransformar",
        Description = "Faz você se destransformar do alien atual",
        Callback = function()
            local args = {
                [1] = false
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UnMorph")
                :FireServer(unpack(args))
        end
    })
    local Dropdown2 = Tabs.Recalibrado:AddDropdown("RecalibradoAliens", {
        Title = "Transformar (Bateria infinita)",
        Values = {"swampfire", "echoecho", "humungousaur", "jetray", "bigchill", "chromastone", "brainstorm", "spidermonkey", "goop", "waybig", "alienx", "lodestar", "rath", "nanomech", "heatblast", "wildmutt", "diamond", "xrl8", "graymatter", "fourarms", "stinkfly", "ripjaws", "ultrat","ghostfreak", "cannonbolt", "wildvine", "blitzwolfer", "snareoh", "frankenstrike", "upchuck","eyeguy", "ditto", "feedback", "buzzshock", "articguana", "spitter", "clockwork"},
        Multi = false,
        Default = nil
    })

    Dropdown2:OnChanged(function(Value)
        local args = {
            [1] = "AF",
            [2] = Value,
            [3] = (game:GetService("ReplicatedStorage").Aliens.AF[Value].Character[Value].Humanoid.Health - 100),
            [4] = true
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AlienMorph"):FireServer(unpack(args))
        Dropdown1:SetValue(nil)
    end)
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
