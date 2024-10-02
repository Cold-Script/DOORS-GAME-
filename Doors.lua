local function Billboard(child, name, color, title)
bill = Instance.new("BillboardGui",child)
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0,400,0,100)
        bill.Adornee = child
        bill.MaxDistance = 2000
        bill.Name = title

        local txt = Instance.new("TextLabel",bill)
        txt.AnchorPoint = Vector2.new(0.5,0.5)
        txt.BackgroundTransparency = 1
        txt.BackgroundColor3 = color
        txt.TextColor3 = color
        txt.Font = "GothamBold"
        txt.TextSize = "15"
        txt.Size = UDim2.new(1,0,0,-50)
        txt.Position = UDim2.new(0.5,0,0.7,0)
        Instance.new("UIStroke",txt)
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
txt.Text = string.format("%s\n(%sm)", name or child.Name, math.floor((workspace.CurrentCamera.CFrame.Position - child:GetPivot().Position).Magnitude));
end);
end);
end
local function ClearESP(name)
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == name then
v:Destroy()
end
end
end
function checkDistance(part, extra)
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
local flags ={hintrush=false,hintrushhee=false,light=false,instapp=false,noseek=false,nogates=false,nopuzzle=false,noa90=false,noskeledoors=false,noseekarmsfire=false,noscreech=false,nodupe=false,getcode=false,getcodet=false,roomsnolock=false,draweraura=false,autorooms=false,itemsaura=false,autopulllever=false,bookcollecter=false,breakercollecter=false};
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
v.RequiresLineOfSight = not v or true
v.MaxActivationDistance = _G.RangePrompt or 10
end
end
end)
end)
Tab:Slider("Reach Range",1,30,5,function(v)
_G.RangePrompt = v
end)
Tab:Toggle("Fullbright",false,function(v)
if v then
game.Lighting.Brightness = 1.5
game.Lighting.GlobalShadows = false
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
    {Image = "rbxassetid://3944668821", ImageColor = Color3.fromRGB(255, 255, 255)}
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
elseif child.Name == "GloomPile" then
notify("GloomPile Spawn in next door careful and stop open the light!")    
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
if _G.BypassSnare then 
for _,v in pairs(game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):GetChildren()) do 
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
Tab2:Toggle("Anti-Fire",false,function(v)
_G.SeekFire = v
end)

Tab2:Toggle("Anti-A90",false,function(v)
flags.noa90 = v
if v then 
local v2 = game.ReplicatedStorage:WaitForChild("EntityInfo"):WaitForChild("A90")
local v3 = 0 local v4 while true do if v3 == 0 then v4 = game.Players.LocalPlayer.PlayerGui:WaitForChild("MainUI"):WaitForChild("Jumpscare"):FindFirstChild("Jumpscare_A90");if v4 then v4.Parent=nil;v2.Parent=nil;repeat task.wait();game.SoundService.Main.Volume=1;until not flags.noa90 v4.Parent= game.Players.LocalPlayers.PlayerGui.MainUI.Jumpscare;v2.Parent=game.ReplicatedStorage:WaitForChild("EntityInfo");end break;end end end end)
Tab2:Toggle("Anti-Dupe",false,function(v)
flags.nodupe=v;if v then local v2;v2=game:GetService("ReplicatedStorage").GameData.LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()task.wait();for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do if (v.Name=="DoorFake") then v.Hidden.CanTouch=false;end end repeat task.wait();until  not v16.nodupe v2:Disconnect();end);end end);
Tab2:Toggle("Anti-Halt",false,function(v)
local v2=0;while true do if v2 == 0 then _G.BypassHalte = v;
if (_G.BypassHalte==true) then local v3=0;local v4;while true do if v3 == 0 then v4 = game:GetService("ReplicatedStorage").ClientModules.EntityModules.Shade;v4.Parent=game.Workspace;break;end end elseif (_G.BypassHalte==false) then local v5 = 0;local v6;while true do if v5 == 0 then v6 = game.Workspace.Shade;v6.Parent=game:GetService("ReplicatedStorage").ClientModules.EntityModules;break;end end end break;end end end);
Tab2:Toggle("Anti-Screech",false,function(v)
if v then
local Screech = game:GetService("ReplicatedStorage").Entities.Screech:Destroy()
else
Screech:Disconnect()
end
end)
game:GetService("Workspace").DescendantAdded:Connect(function(v)
if  not _G.antibanananana then return end 
if v:IsA("Part") then 
if _G.antibanananana then 
if (v.Name == "BananaPeel") then 
v.CanTouch = false 
end 
end 
end 
end)
Tab2:Toggle("Anti-Banana",false,function(v)local v2=0;while true do if v2 == 0 then _G.antibanananana=v;if (_G.antibanananana==true) then for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do if v:IsA("Part") then if (v.Name=="BananaPeel") then v.CanTouch=false;end end end end break;end end end);

game:GetService("RunService").RenderStepped:Connect(function()pcall(function()
if _G.antije then for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v.Knife.CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v.Head.CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v.HumanoidRootPart.CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v["Left Arm"].CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v["Left Leg"].CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v["Right Arm"].CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v["Right Leg"].CanTouch=false;end end for _,v in pairs(game.workspace:GetChildren()) do if (v.Name=="JeffTheKiller") then v.Torso.CanTouch=false;end end end end);end);
Tab2:Toggle("Anti-Jeff",false,function(v)_G.antije=v;end)
Tab2:Toggle("Anti-Figure Hearing",false,function(v)
if v then
game:GetService("ReplicatedStorage").EntityInfo.Crouch:FireServer(true)
else
game:GetService("ReplicatedStorage").EntityInfo.Crouch:FireServer(false)
end
end)   
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()if _G.SeekChase then if game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):FindFirstChild("TiggerEventCollision") then for _,v in pairs(game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Assets"):GetChildren()) do if (v.Name=="TriggerEventCollision") then v:Destroy();end end end end end);end);
Tab2:Toggle("Anti-Seek Trigger",false,function(v)_G.SeekChase = v;end)

local Tab3 = Window:Tab("ESP")
Tab3:Toggle("ESP Doors",false,function(v)
if v then 
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Billboard(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end		
end					
ESP1 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Billboard(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end
end                        
end)
else
ESP1:Disconnect()
ClearESP("DoorESP")
end		
end)
Tab3:Toggle("ESP Key",false,function(v)
if v then 
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "KeyObtain" then
Billboard(v, "Key", workspace.KeyObtain.Hitbox.Color, "KeyESP")
end		
end					
ESP2 = workspace.ChildAdded:Connect(function(child)  
for _,v in pairs(workspace:GetDescendants()) do                                        
if v.Name == "KeyObtain" then
Billboard(v, "Key", workspace.KeyObtain.Hitbox.Color, "KeyESP")
end		
end	                        
end)
else
ESP2:Disconnect()
ClearESP("KeyESP")
end		
end)
Tab3:Toggle("ESP Lever",false,function(v)
if v then 
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "LeverForGate" then
Billboard(v, "Lever", Color3.fromRGB(80, 80, 80), "LeverESP")
elseif v.Name == "TimerLever" then
Billboard(v, "Timer Lever (" .. v.TakeTimer.TextLabel.Text .. ")", Color3.fromRGB(80, 80, 80), "LeverESP")
end		
end					
ESP3 = workspace.ChildAdded:Connect(function(child)  
for _,v in pairs(workspace:GetDescendants()) do                                        
if v.Name == "LeverForGate" then
Billboard(v, "Lever", Color3.fromRGB(80, 80, 80), "LeverESP")
elseif v.Name == "TimerLever" then
Billboard(v, "Timer Lever (" .. v.TakeTimer.TextLabel.Text .. ")", Color3.fromRGB(80, 80, 80), "LeverESP")                                                                
end		
end	                        
end)
else
ESP3:Disconnect()
ClearESP("LeverESP")
end		
end)
Tab3:Toggle("ESP Vacuum",false,function(v)
if v then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "SideroomSpace" then
Billboard(v, "Vacuum", Color3.fromRGB(80,80,80), "VacuumESP")
end		
end					
ESP4 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "SideroomSpace" then
Billboard(v, "Vacuum", Color3.fromRGB(80,80,80), "VacuumESP")
end	
end                        
end)
else
ESP4:Disconnect()
ClearESP("VacuumESP")
end		
end)		
Tab3:Toggle("ESP Entity",false,function(v)
if v then 
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "AmbushMoving" then
Billboard(v, "Ambush", v.Color, "AmbushESP")
elseif v.Name == "RushMoving" then
Billboard(v, "Rush", Color3.fromRGB(80,80,80), "RushESP")
elseif v.Name == "Eyes" then
Billboard(v, "Eyes", v.Color, "EyesESP")
elseif v.Name == "JeffTheKiller" then
Billboard(v, "Jeff", v.Color, "JeffESP")
elseif v.Name == "FigureRagdoll" then
Billboard(v, "Figure", Color3.new(1), "FigureESP")
end
end				
ESP5 = workspace.ChildAdded:Connect(function(child)  
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "AmbushMoving" then
Billboard(v, "Ambush", Color3.fromRGB(0,255,0), "AmbushESP")
elseif v.Name == "RushMoving" then
Billboard(v, "Rush", Color3.fromRGB(80,80,80), "RushESP")
elseif v.Name == "Eyes" then
Billboard(v, "Eyes", Color3.fromRGB(0,0,255), "EyesESP")
elseif v.Name == "JeffTheKiller" then
Billboard(v, "Jeff", Color3.fromRGB(255,255,255), "JeffESP")
elseif v.Name == "FigureRagdoll" then
Billboard(v, "Figure", Color3.new(1), "FigureESP") 
end
end
end)
else
ESP5:Disconnect()
ClearESP("AmbushESP")
ClearESP("RushESP")
ClearESP("EyesESP")
ClearESP("JeffESP")
ClearESP("FigureESP")
end		
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
