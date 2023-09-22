--Do _G.ServerHopWait = 1200 before the loadstring
if _G.ServerHopWait == nil then
    _G.ServerHopWait = 1200
end

if _G.ServerHopDelay == nil then
    _G.serverHopDelay = 30
end

local HopWait = _G.ServerHopWait
local HopDelay = _G.ServerHopDelay
_G.ServerHopCalc = HopWait + HopDelay

local ServerHopper = function(time)
    wait(_G.ServerHopCalc)
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
    local Gay = HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. game.PlaceId .. '/servers/Public?sortOrder=Asc&limit=100'))

    for i,v in next, Gay.data do
        if v.playing < 2 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, Player)
            break
        end
    end
end
spawn(function()
    while wait() do
        wait()
        pcall(function()
            
            ServerHopper(_G.ServerHopCalc)
            
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
                    local delayValues = {10, 20, 30, 40, 50, 60, 70}
                    
                    -- Select a random delay value from the array
                    local randomIndex = math.random(1, #delayValues)
                    local selectedDelay = delayValues[randomIndex]
                    
                    -- Wait for the selected delay
                    wait(_G.serverHopDelay)
                    
                    -- Now you've waited for a random delay based on the values in the array
                    ServerHopper()

                end
            end)
        end)
        wait(4)
    end
end)
