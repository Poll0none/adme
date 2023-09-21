

spawn(function()
    while wait() do
        wait(math.random(1200))
        pcall(function()
            local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
            local Player = Players.LocalPlayer
            for i,v in next, Gay.data do
                if v.playing < 2 then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                    break
                end
            end
        end)
        wait(4)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
                    local Player = Players.LocalPlayer
                    for i,v in next, Gay.data do
                        if v.playing < 2 then
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
                            break
                        end
                    end
                end
            end)
        end)
        wait(4)
    end
end)
