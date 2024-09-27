function Distance(part, extra)
	if not extra then extra = 15 end
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not part then
		return false
	end
	local distanceToPart = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).magnitude
	if distanceToPart <= extra then
		return true
	end
	return false
end

local repo = "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

local Window = Library:CreateWindow({
	Title = "YPoint | Backdoors",
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	TabPadding = 2,
	MenuFadeTime = 0
})
local Tab = Window:AddTab("Main")
local Tab3 = Window:AddTab("ESP")
local Tab4 = Window:AddTab("Configs")

function notify(name)
Library:Notify(name)
if _G.PlaySound then
local sound = Instance.new("Sound", workspace) do
sound.SoundId = "rbxassetid://4590662766"
sound.Volume = _G.Volume or 2
sound.PlayOnRemove = true
sound:Destroy()
end
end
end


local Group = Tab:AddLeftGroupbox("Players")
Group:AddSlider("",{
    Text="WalkSpeed",
    Default=16,
    Min=16,Max=21,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.Speed = v 
end})
Group:AddSlider("",{
    Text="Field Of View",
    Default=70,
    Min=70,Max=120,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.FOV = v 
end})
Group:AddSlider("",{
    Text="Max Slope Angle",
    Default=0,
    Min=0,Max=100,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.MaxAngle = v 
end})
Group:AddSlider("Body", {
        Text = "Body Transparency",
        Default = 0,
        Min = 0,
        Max = 1,
        Rounding = 1,
	Compact = true,		
	Callback = function(value)	
_G.Body = value				
end})
game:GetService("RunService").RenderStepped:Connect(function()			
pcall(function()			
game.Players.LocalPlayer.Character.Head.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftHand.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftLowerArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftLowerLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftUpperArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftUpperLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LowerTorso.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightHand.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightLowerArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightLowerLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightUpperArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightUpperLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.UpperTorso.Transparency = _G.Body;	
end)
end)		
Group:AddDivider()

Group:AddToggle("NoAccount",{
    Text="No Account"
})
Toggles.NoAccount:OnChanged(function(value)
game.Players.LocalPlayer.Character.Head.Massless = not value;
game.Players.LocalPlayer.Character.LeftFoot.Massless = not value;
game.Players.LocalPlayer.Character.LeftHand.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.LowerTorso.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightHand.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.UpperTorso.Massless = not value;
end)
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
for _,v in next,game.Players.LocalPlayer.Character:GetDescendants() do 
if v:IsA("BasePart", v) and _G.Noclip then 
v.CanCollide = false
end
end
end)
end)
Group:AddToggle("Toggle",{
	Text = "Noclip",
	Default = false,
	Callback = function(value)
_G.Noclip = value
if _G.Noclip == false then				
v:IsA("BasePart")
v.CanCollide = true
end 
end})
Group:AddDivider()

Group:AddToggle("SlowJump",{
    Text="Slow Jump"
})
Toggles.SlowJump:OnChanged(function(value)
if value then
workspace.Gravity = 25
else
workspace.Gravity = 130
end
end)
Group:AddToggle("EnableJump",{
    Text="Enabled Jump"
})
Toggles.EnableJump:OnChanged(function(value)
game.Players.LocalPlayer.Character:SetAttribute("CanJump", value)
end)
Group:AddDivider()
Group:AddButton({Text="Reset",DoubleClick=true,Func = function()game.Players.LocalPlayer.Character.Humanoid.Health = 0 end}):AddButton({Text="Lobby",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.Lobby:FireServer() end})
Group:AddButton({Text="Play Again",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.PlayAgain:FireServer() end}):AddButton({Text="Revive",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.Revive:FireServer() end})

local Group2 = Tab:AddRightGroupbox("Misc")
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if _G.FastCloset and game.Players.LocalPlayer.Character:GetAttribute("Hiding")==true then 
game:GetService("ReplicatedStorage").EntityInfo.CamLock:FireServer()end end)
Group2:AddToggle("Toggle",{
    Text = "Fast Closet Exit",
    Default = false,
    Callback = function(value)
_G.FastCloset = value
end})
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.OpenDoorFar then game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").ClientOpen:FireServer()
end 
end)
end)
Group2:AddDivider()
Group2:AddToggle("Toggle",{
    Text = "Reach Door",
    Default = false,
    Callback = function(value)
_G.OpenDoorFar = value
end})
Group2:AddToggle("PromptClip",{
    Text = "Reach Prompt Clip",
    Default = false
})
Toggles.PromptClip:OnChanged(function(value)
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.RequiresLineOfSight = not value
v.MaxActivationDistance = _G.RangePrompt
end
end
end)
Group2:AddSlider("",{
    Text="Prompt Range",
    Default=1,
    Min=1,Max=30,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.RangePrompt = v 
end})

game:GetService("RunService").RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed or 16
game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = _G.MaxAngle or 30
workspace.CurrentCamera.FieldOfView = _G.FOV or 70
end)

Group2:AddDivider()
Group2:AddToggle("AntiLag",{
    Text = "Anti Lag",
    Default = false
})
Toggles.AntiLag:OnChanged(function(value)
for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            if not object:GetAttribute("Material") then object:SetAttribute("Material", object.Material) end
            if not object:GetAttribute("Reflectance") then object:SetAttribute("Reflectance", object.Reflectance) end

            object.Material = value and Enum.Material.Plastic or object:GetAttribute("Material")
            object.Reflectance = value and 0 or object:GetAttribute("Reflectance")
        elseif object:IsA("Decal") then
            if not object:GetAttribute("Transparency") then object:SetAttribute("Transparency", object.Transparency) end
        end
    end

    workspace.Terrain.WaterReflectance = value and 0 or 1
    workspace.Terrain.WaterTransparency = value and 0 or 1
    workspace.Terrain.WaterWaveSize = value and 0 or 0.05
    workspace.Terrain.WaterWaveSpeed = value and 0 or 8
end)
Group2:AddToggle("Toggle",{
    Text = "Fullbright",
    Default = false,
    Callback = function(value)
if value then
game.Lighting.Brightness = 3
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
else
game.Lighting.Brightness = 1
game.Lighting.GlobalShadows = true
game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
end
end})
Group2:AddToggle("NoFog",{
    Text = "No Fog",
    Default = false
})
Toggles.NoFog:OnChanged(function(value)
if not game.Lighting:GetAttribute("FogStart") then game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) end
    if not game.Lighting:GetAttribute("FogEnd") then game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) end

    game.Lighting.FogStart = value and 0 or Lighting:GetAttribute("FogStart")
    game.Lighting.FogEnd = value and math.huge or game.Lighting:GetAttribute("FogEnd")

    local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
    if fog then
        if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end

        fog.Density = value and 0 or fog:GetAttribute("Density")
	end
end)
Group2:AddDivider()
Group2:AddToggle("NotifyEntity",{
    Text = "Notifier Entity",
    Default = false,
    Callback = function(v)
if v then
EntityNotifier = workspace.ChildAdded:Connect(function(child)
if child.Name == "BackdoorLookman" then
notify("[ Notifier Entity ] : Lookman has spawn please dont look it")
elseif child.Name == "BackdoorRush" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("[ Notifier Entity ] :  Blitz has spawn find the closet hide now!")
end
end)
else
EntityNotifier:Disconnect()
end
end})
_G.PlaySound = true
Group2:AddToggle("Toggle",{
    Text = "Play Sound",
    Default = true,
    Callback = function(value)
_G.PlaySound = value
end})
Group2:AddSlider("",{
    Text="Volume",
    Default=0,
    Min=0,Max=100,
    Rounding=1,
    Compact=true,
    Callback = function(v)
_G.Volume = v
end})
