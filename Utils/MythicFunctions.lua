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

local Functions = {
	String = {},
	Table = {},
}

function Functions:AnchorHRP(HRP, Value)
	HRP.Anchored = Value
end

function Functions:TweenPlayerToPart(HRP, Part, TweenSpeed, UntilNot)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = Get.Players.Player.Character.HumanoidRootPart.CFrame

	local Tween = Get.TweenService:Create(CFrameValue, TweenInfo.new((HRP.Position - Part.Position).Magnitude / TweenSpeed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {Value = Part.Position})
	Tween:Play()
	Functions:AnchorHRP(HRP, false)

	local Completed = false
	Tween.Completed:Connect(function()
		task.wait(0.5)
		Completed = true
		Functions:AnchorHRP(HRP, true)
	end)

	while not Completed do
		if not UntilNot then
			if Get.Playeres.Player.Character.Humanoid.Health <= 0 then
				Tween:Cancel()
				Functions:AnchorHRP(HRP, false)
				break
			end
		else
			if Get.Playeres.Player.Character.Humanoid.Health <= 0 or not UntilNot then
				Tween:Cancel()
				Functions:AnchorHRP(HRP, false)
				break
			end
		end

		Get.Playeres.Player.Character.HumanoidRootPart.CFrame = CFrameValue.Value
		Functions:AnchorHRP(HRP, false)
		task.wait()
	end

	CFrameValue:Destroy()
end

function Functions:TpPlayerToPart(HRP, Part)
	HRP.CFrame = Part.Value
end

function Functions:PressKey(KeyCode, options)
	Get.VirtualInputManager:SendKeyEvent(true, KeyCode, false, game)
	task.wait(options.Duration or 0.005)
	Get.VirtualInputManager:SendKeyEvent(false, KeyCode, false, game)
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
