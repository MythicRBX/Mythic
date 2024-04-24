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

local Games = {
	[11448431235] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Sea1.lua", -- Rock Fruit
	[12241341621] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Sea2.lua", -- Rock Fruit
	[16723079713] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Raid.lua", -- Rock Fruit

	[8426789885] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/BUDS/Main.lua", -- Beat Up Dummies Simulator

	[10679239752] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/Furinfection/Main.lua", -- Furinfection

	[662417684] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/LuckyBlocksBG/Main.lua", -- Lucky Blocks Battegrounds
}

local Link = Games[game.PlaceId]
if not Link then
	Fluent:Notify({
		Title = "Equipe Mythic",
		Content = "Mythic não Possuí Suporte Neste Jogo/Place!",
		Duration = 3
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
