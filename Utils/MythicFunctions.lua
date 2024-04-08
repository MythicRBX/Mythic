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

local FindObj, FindObjOfClass = Get.FindFirstChild, Get.FindFirstChildOfClass

local MythicFunctions = {}

function MythicFunctions:GetPlayer()
	return Get.Players.LocalPlayer
end

function MythicFunctions:GetPlayerCount()
	local success, result = pcall(function()
		return Get.Players:GetPlayers()
	end)

	if success then return #result else return nil end
end

function MythicFunctions:GetCharacter()
	if MythicFunctions:GetPlayer().Character then
		return MythicFunctions:GetPlayer().Character
	end
end

function MythicFunctions:GetHumanoid()
	if MythicFunctions:GetCharacter().Humanoid then
		return MythicFunctions:GetCharacter().Humanoid
	end
end

function MythicFunctions:GetHRP()
	if MythicFunctions:GetCharacter().HumanoidRootPart then
		return MythicFunctions:GetCharacter().HumanoidRootPart
	end
end

function MythicFunctions:AnchorHRP(Value)
	MythicFunctions:GetHRP().Anchored = Value
end

function MythicFunctions:TweenPlayerToPart(Part, TweenSpeed, UntilNot)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = Get.Players.Player.Character.HumanoidRootPart.CFrame

	local Tween = Get.TweenService:Create(CFrameValue, TweenInfo.new((MythicFunctions:GetHRP().Position - Part.Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Value = Part.Position})
	Tween:Play()
	MythicFunctions:AnchorHRP(false)

	local Completed = false
	Tween.Completed:Connect(function()
		task.wait(0.5)
		Completed = true
		MythicFunctions:AnchorHRP(true)
	end)

	while not Completed do
		if not UntilNot then
			if Get.Players.Player.Character.Humanoid.Health <= 0 then
				Tween:Cancel()
				MythicFunctions:AnchorHRP(false)
				break
			end
		else
			if Get.Players.Player.Character.Humanoid.Health <= 0 or not UntilNot then
				Tween:Cancel()
				MythicFunctions:AnchorHRP(false)
				break
			end
		end

		Get.Players.Player.Character.HumanoidRootPart.CFrame = CFrameValue.Value
		MythicFunctions:AnchorHRP(false)
		task.wait()
	end

	CFrameValue:Destroy()
end

function MythicFunctions:TpPlayerToPart(Part)
	MythicFunctions:GetHRP().CFrame = Part.Value
end

function MythicFunctions:PressKey(KeyCode, Duration)
	Get.VirtualInputManager:SendKeyEvent(true, KeyCode, false, game)
	task.wait(Duration or 0.005)
	Get.VirtualInputManager:SendKeyEvent(false, KeyCode, false, game)
end

function MythicFunctions:EquipTool(Tool)
	MythicFunctions:GetPlayer().Backpack[Tool].Parent = MythicFunctions:GetCharacter()
end

function MythicFunctions:UnEquipTool(Tool)
	MythicFunctions:GetCharacter()[Tool].Parent = MythicFunctions:GetPlayer().Backpack
end

function MythicFunctions:GetEquippedTool(Tool)
	return MythicFunctions:GetCharacter()[Tool]
end

function MythicFunctions:UsingTool(Tool)
	if not FindObj(MythicFunctions:GetCharacter(), Tool) and FindObj(MythicFunctions:GetPlayer().Backpack, Tool) then return false else return true end
end

function MythicFunctions:Notify(Name, Description, ActiveDuration)
	local title = Name or "Equipe Mythic"

	Fluent:Notify({
		Title = title,
		Content = Description,
		Duration = ActiveDuration
	})
end



function MythicFunctions:GetClosestMob(Parent, Name, Checks)
	local TargetDistance = math.huge
	local Target

	for _, mob in pairs(Parent:GetChildren()) do
		if not mob:IsA("Model") then return end
		if not mob.Name == Name then return end
		if not FindObjOfClass(mob, "Humanoid").Health ~= 0 then return end

		for z_, check in ipairs(Checks) do
			for x_, child in ipairs(mob:GetChildren()) do
				if FindObj(mob, child.Name) then continue else break end
			end
		end

		local Magnitude = (MythicFunctions:GetHRP().Position - mob.HumanoidRootPart.Position).Magnitude

		if Magnitude < TargetDistance then
			TargetDistance = Magnitude
			Target = mob
		end
	end
	return Target
end

return MythicFunctions
