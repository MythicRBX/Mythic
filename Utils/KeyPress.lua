--[[

                                                                                           
 #   #    #            ###   #        #        #      #                               #    
 #   #                #   #  #                 #      #                         #      #   
 #   #   ##           #      #   #   ##     ## #   ## #   ###   # ##           ###      #  
 #####    #            ###   #  #     #    #  ##  #  ##  #   #  ##  #           #       #  
 #   #    #               #  ###      #    #   #  #   #  #####  #                       #  
 #   #    #           #   #  #  #     #    #  ##  #  ##  #      #               #      #   
 #   #   ###           ###   #   #   ###    ## #   ## #   ###   #              ###    #    
                                                                                #          
                                                                                           

Por Equipe Mythic! :) ❤️
]]--

local VirtualInputManager = game:GetService('VirtualInputManager')

Input = {
	Apertar = function(Tecla)
		VirtualInputManager:SendKeyEvent(true, Tecla, false, nil)
		task.wait(0.005)
		VirtualInputManager:SendKeyEvent(false, Tecla, false, nil)
	end,
	Segurar = function(Tecla, Tempo)
		VirtualInputManager:SendKeyEvent(true, Tecla, false, nil)
		task.wait(Tempo)
		VirtualInputManager:SendKeyEvent(false, Tecla, false, nil)
	end
}

return Input
