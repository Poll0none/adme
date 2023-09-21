local ServerHopper = function()
    _G.serverhopping = true
    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))
    local Player = Players.LocalPlayer

    for i,v in next, Gay.data do
        if v.playing < 2 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
            break
        end
    end
end

local CrowdControl = function()
    repeat wait(5) until _G.serverhopping == false
    ServerHopper()
end


spawn(function()
    while wait() do
        wait(90)
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

local characterLoad = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
repeat wait() until characterLoad()
    _G.serverhopping = false
