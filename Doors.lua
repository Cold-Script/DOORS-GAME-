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
local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")()
local Window = Library:Window("YPoint",Color3.new(7,9.9), Enum.KeyCode.RightControl)
local Tab = Window:Tab("Main")
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if _G.ClosetExitFixed and game.Players.LocalPlayer.Character:GetAttribute("Hiding") == true then 
game:GetService("ReplicatedStorage").EntityInfo.CamLock:FireServer()end end)
Tab:Toggle("Closet Exit Fixed",false,function(v)
_G.ClosetExitFixed = v
end)
Tab:Toggle("Can Jump",false,function(v)
spawn(function()
pcall(function()
game.Players.LocalPlayer.Character:SetAttribute("CanJump", v)
end)            
end)       
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
Tab:Toggle("Noclip",false,function(v)
_G.Noclip = v
if _G.Noclip == false then				
v:IsA("BasePart")
v.CanCollide = true
end 
end)
Tab:Toggle("No Slowdown",false,function(v)
pcall(function()
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
end)
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.OpenDoorFar then game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").ClientOpen:FireServer()
end 
end)
end)
Tab:Toggle("Reach Doors",false,function(v)
_G.OpenDoorFar = v
end)
Tab:Toggle("Reach Prompt Clip",false,function(v)
pcall(function()
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.RequiresLineOfSight = not v
v.MaxActivationDistance = _G.RangePrompt
end
end
end)
end)
_G.ReachPrompt = 5
Tab:Slider("Reach Range",1,30,5,function(v)
_G.RangePrompt = v
end)
Tab:Toggle("Fullbright",false,function(v)
if v then
game.Lighting.Brightness = 1.5
game.Lighting.GlobalShadows = true
game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
else
game.Lighting.Brightness = 1
game.Lighting.GlobalShadows = true
game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
end
end)
Tab:Toggle("No Fog",false,function(v)
pcall(function()
if not game.Lighting:GetAttribute("FogStart") then game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) end
if not game.Lighting:GetAttribute("FogEnd") then game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) end
game.Lighting.FogStart = value and 0 or game.Lighting:GetAttribute("FogStart")
game.Lighting.FogEnd = value and math.huge or game.Lighting:GetAttribute("FogEnd")
local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
if fog then
if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end
fog.Density = value and 0 or fog:GetAttribute("Density")
end
end)
end)
function notify(name)
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
Notification:Notify(
    {Title = "YPoint", Description = name},
    {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"},
    {Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
  )
if _G.PlaySound then
local sound = Instance.new("Sound", workspace) do
sound.SoundId = "rbxassetid://4590662766"
sound.Volume = _G.Volume or 2
sound.PlayOnRemove = true
sound:Destroy()
end
end
end
Tab:Toggle("Notifier Entity",false,function(v)
if v then
EntityNotifier = workspace.ChildAdded:Connect(function(child)
if child.Name == "BackdoorLookman" then
notify("Lookman has spawn please dont look it")
elseif child.Name == "BackdoorRush" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("Blitz has spawn find the closet hide now!")
elseif child.Name == "Eyes" then
notify("Eyes has spawn please dont look it")
elseif child.Name == "RushMoving" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("Rush has spawn find the closet hide now!")
elseif child.Name == "AmbushMoving" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("Ambush has spawn find the closet hide now!")
elseif child.Name == "JeffTheKiller" then
notify("Jeff The Killer has spawn careful it!")
elseif child.Name == "FigureRagdoll" and Distance(child:FindFirstChildWhichIsA("BasePart"), 75) then
notify("Figure near, careful!")           
end
end)
else
EntityNotifier:Disconnect()
end
end)
_G.PlaySound = false
Tab:Toggle("Sound",false,function(v)
_G.PlaySound = v
end)
_G.Volume = 2
Tab:Slider("Volume",0,5,2,function(v)
_G.Volume = v
end)
local Tab2 = Window:Tab("Cheat")
Tab2:Toggle("Anti-Eyes",false,function(v)
if v and (workspace:FindFirstChild("Eyes")) then
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(-649)
else
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(0, -90, 0, false)
end
end)
Tab2:Toggle("Anti-Lookman",false,function(v)
if v and (workspace:FindFirstChild("Lookman")) then
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(-649)
else
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(0, -90, 0, false)
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.BypassSnare then for _,v in pairs(game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):GetChildren()) do 
if (v.Name=="Snare") then v.Hitbox['TouchInterest']:Destroy();end end end end);end);
Tab2:Toggle("Anti-Snare",false,function(v)
_G.BypassSnare = v
end)
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()if _G.SeekArm then if game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):FindFirstChild("Seek_Arm") then for _,v in pairs(game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):GetChildren()) do if (v.Name=="Seek_Arm") then v.AnimatorPart.CanTouch=false;end end end end end);end);game:GetService("RunService").RenderStepped:Connect(function()
 pcall(function()if _G.SeekFire then if game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):FindFirstChild("ChandelierObstruction") then for _,v in pairs(game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):GetChildren()) do if (v.Name=="ChandelierObstruction") then v.HurtPart.CanTouch=false;end end end end end);end);
Tab2:Toggle("Anti-Seek Arm",false,function(v)
_G.SeekArm = v
end)
Tab2:Toggle("Anti-Fire",false,function(v)_G.SeekFire = v
end)

tab:Button("Button", function()
lib:Notification("Notification", "Hello!", "Hi!")
end)

tab:Toggle("Toggle",false, function(t)
print(t)
end)

tab:Slider("Slider",0,100,30, function(t)
print(t)
end)

tab:Dropdown("Dropdown",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(t)
print(t)
end)

tab:Colorpicker("Colorpicker",Color3.fromRGB(255,0,0), function(t)
print(t)
end)

tab:Textbox("Textbox",true, function(t)
print(t)
end)

tab:Bind("Bind",Enum.KeyCode.RightShift, function()
print("Pressed!")
end)

tab:Label("Label")

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color",Color3.fromRGB(44, 120, 224), function(t)
lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)
