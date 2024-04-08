--[[

                                                                                           
 #   #    #            ###   #        #        #      #                               #    
 #   #                #   #  #                 #      #                         #      #   
 #   #   ##           #      #   #   ##     ## #   ## #   ###   # ##           ###      #  
 #####    #            ###   #  #     #    #  ##  #  ##  #   #  ##  #           #       #  
 #   #    #               #  ###      #    #   #  #   #  #####  #                       #  
 #   #    #           #   #  #  #     #    #  ##  #  ##  #      #               #      #   
 #   #   ###           ###   #   #   ###    ## #   ## #   ###   #              ###    #    
                                                                                #          
                                                                                           
By Mythic Team :) ❤️
Por Equipe Mythic! :) ❤️
]]--

local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/MythicRBX/MythicLib/main/Addons/Fluent.lua"))()
local Get = setmetatable({}, {
	__index = function(a, b)
		return game:GetService(b) or game[b]
	end
})

local FindObj = Get.FindFirstChild

local Functions = {}

function Functions:GetPlayer(Player)
	return Get.Players[Player] or Get.Players.LocalPlayer
end

function Functions:GetPlayerCount()
	local success, result = pcall(function()
		return Get.Players:GetPlayers()
	end)

	if success then return #result else return nil end
end

function Functions:GetCharacter(Player)
	if Functions:GetPlayer(Player).Character then
		return Functions:GetPlayer(Player).Character
	end
end

function Functions:GetHumanoid(Player)
	if Functions:GetCharacter(Player).Humanoid then
		return Functions:GetCharacter(Player).Humanoid
	end
end

function Functions:GetHRP(Player)
	if Functions:GetCharacter(Player).HumanoidRootPart then
		return Functions:GetCharacter(Player).HumanoidRootPart
	end
end

function Functions:AnchorHRP(Value)
	Functions:GetHRP().Anchored = Value
end

function Functions:TweenPlayerToPart(Part, TweenSpeed, UntilNot)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = Get.Players.Player.Character.HumanoidRootPart.CFrame

	local Tween = Get.TweenService:Create(CFrameValue, TweenInfo.new((Functions:GetHRP().Position - Part.Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Value = Part.Position})
	Tween:Play()
	Functions:AnchorHRP(false)

	local Completed = false
	Tween.Completed:Connect(function()
		task.wait(0.5)
		Completed = true
		Functions:AnchorHRP(true)
	end)

	while not Completed do
		if not UntilNot then
			if Get.Players.Player.Character.Humanoid.Health <= 0 then
				Tween:Cancel()
				Functions:AnchorHRP(false)
				break
			end
		else
			if Get.Players.Player.Character.Humanoid.Health <= 0 or not UntilNot then
				Tween:Cancel()
				Functions:AnchorHRP(false)
				break
			end
		end

		Get.Players.Player.Character.HumanoidRootPart.CFrame = CFrameValue.Value
		Functions:AnchorHRP(false)
		task.wait()
	end

	CFrameValue:Destroy()
end

function Functions:TpPlayerToPart(Part)
	Functions:GetHRP().CFrame = Part.Value
end

function Functions:PressKey(KeyCode, options)
	Get.VirtualInputManager:SendKeyEvent(true, KeyCode, false, game)
	task.wait(options.Duration or 0.005)
	Get.VirtualInputManager:SendKeyEvent(false, KeyCode, false, game)
end

function Functions:EquipTool(Tool)
	Functions:GetPlayer().Backpack[Tool].Parent = Functions:GetCharacter()
end

function Functions:UnEquipTool(Tool)
	Functions:GetCharacter()[Tool].Parent = Functions:GetPlayer().Backpack
end

function Functions:UsingTool(Tool)
	if not FindObj(Functions:GetCharacter(), Tool) and FindObj(Functions:GetPlayer().Backpack, Tool) then return false end
end

function Functions:Notify(Name, Description, ActiveDuration)
	local title = Name or "Equipe Mythic"

	Fluent:Notify({
		Title = title,
		Content = Description,
		Duration = ActiveDuration
	})
end

return Functions
