local ServerHopper = function()
    repeat wait(5) until _G.serverhopping == false
    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
    local Player = Players.LocalPlayer

    for i,v in next, Gay.data do
        if v.playing < 2 then
            _G.serverhopping = true
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
            break
        end
    end
end

spawn(function()
    while wait() do
        wait(90)
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
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    
                    ServerHopper()

                end
            end)
        end)
        wait(4)
    end
end)

repeat wait() until game:IsLoaded()
    _G.serverhopping = false
