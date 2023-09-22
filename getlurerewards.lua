local luretrap = {
    "Lures2023NormalLure",
    "Idontknow"
}


local Lures = function(Name)
    Player.Character.HumanoidRootPart.CFrame = Workspace.HouseInteriors.blueprint:FindFirstChildWhichIsA('Model'):GetModelCFrame():ToWorldSpace(CFrame.new(0, 0, -6)) 
    for i, v in pairs(Workspace.HouseInteriors.furniture:GetChildren()) do
        if v:FindFirstChildWhichIsA("Model") and (table.find(luretrap, v:FindFirstChildWhichIsA("Model").Name)) then
            local String = string.split(v.Name,"true/")[2]
            print(String)
            return String
        end
    end
end

ReplicatedStorage:FindFirstChild("HousingAPI/ActivateFurniture",true):InvokeServer(game:GetService("Players").LocalPlayer, Lures(), 'UseBlock', true, Player.Character)
