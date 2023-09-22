--TRIED TO MAKE IT READ A VARIABLE ACROSS MULTI INSTANCES, proved to be impossible, have to look into HTTP GET and POST

local ServerHopper = function(time)
    local TimeToHop = _G.ServerHopDelay + time
    wait(TimeToHop)
    print("Server hopping in: " .. TimeToHop)
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local TeleportService = game:GetService("TeleportService")
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
    ServerHopper(120)
end)

spawn(function()
    while wait() do
        pcall(function()
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then

                    -- Create an array of delay values in seconds
                    local delayValues = {1, 10, 20, 30, 40, 50}
                    
                    -- Select a random delay value from the array
                    local randomIndex = math.random(1, #delayValues)
                    local selectedDelay = delayValues[randomIndex]
                    
                    -- Wait for the selected delay
                    wait()
                    
                    -- Now you've waited for a random delay based on the values in the array
                    ServerHopper()

                end
            end)
        end)
        wait(4)
    end
end)
