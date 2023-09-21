_G.serverhopping = 0

local ServerHopper = function()
    _G.serverhopping = _G.serverhopping + 1
    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
    local Player = Players.LocalPlayer

    for i,v in next, Gay.data do
        if v.playing < 2 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
            break
        end
    end
    wait(45)
    _G.serverhopping = _G.serverhopping - 1
end

local CrowdControl = function()
    if _G.serverhopping <= 1 then
        ServerHopper()
    else
        wait(60)
        CrowdControl()
    end
end

 
spawn(function()
    while wait() do
        wait(60)
        pcall(function()
            
            CrowdControl()
            
        end)
        wait(4)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                    
                    CrowdControl()

                end
            end)
        end)
        wait(4)
    end
end)
