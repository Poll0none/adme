local ServerHopper = function()
    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
    local Player = Players.LocalPlayer

    for i,v in next, Gay.data do
        if v.playing < 2 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
            break
        end
    end
end

spawn(function()
    while wait() do
        wait(1200)
        pcall(function()
            
            ServerHopper()
            
        end)
        wait(4)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                            
                --LINE ABOVE WORKS but sometimes doesn´t detect??
                --if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                            
                if child.Name == 'ErrorPrompt' then

                    -- Create an array of delay values in seconds
                    local delayValues = {1, 10, 20, 30, 40, 50}
                    
                    -- Select a random delay value from the array
                    local randomIndex = math.random(1, #delayValues)
                    local selectedDelay = delayValues[randomIndex]
                    
                    -- Wait for the selected delay
                    wait(selectedDelay)
                    
                    -- Now you've waited for a random delay based on the values in the array
                    ServerHopper()

                end
            end)
        end)
        wait(4)
    end
end)
