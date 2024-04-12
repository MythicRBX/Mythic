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

local Games = {
	[11448431235] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Sea1.lua",
	[12241341621] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Sea2.lua",
	[16723079713] = "https://raw.githubusercontent.com/MythicRBX/Mythic/main/Games/RockFruit/Raid.lua"
}

local Link = Games[game.PlaceId]

if not Link then
	return
else
	task.wait(1)
	loadstring(game:HttpGet(Link))()
end
