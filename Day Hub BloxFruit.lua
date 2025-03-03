getgenv().Config = {
	AutoChooseTeam = true,
	Team = "Pirates"    --  "Marines"
}

local function setTeam(teamName)
	local args = {
		"SetTeam",
		teamName
	}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

spawn(function()
	while wait() do
		local repStorage = game:GetService("ReplicatedStorage")
		if repStorage:FindFirstChild("Remotes") and repStorage.Remotes:FindFirstChild("CommF_") then
			if getgenv().Config.AutoChooseTeam then
				setTeam(getgenv().Config.Team)
			end
			break
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
----------------------------------------------------------------------------------------------------------------------------------------------
local Window = Fluent:CreateWindow({
    Title = "Day Hub | Premium",
    SubTitle = "ซัพพอร์ต ภาษาไทย",
    TabWidth = 100,
    Size = UDim2.fromOffset(480, 380),
    Acrylic = false,
    Theme = "Grape",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "หน้าหลัก", Icon = "rbxassetid://15712703260" }),
    Settings = Window:AddTab({ Title = "ตังค่าต่างๆ", Icon = "settings" }),
    Item = Window:AddTab({ Title = "ไอเท็ม & เควส", Icon = "swords" }),
    Sea = Window:AddTab({ Title = "Tab Sea Event", Icon = "anchor" }),
    Race = Window:AddTab({ Title = "เผ่า V4", Icon = "clock" }),
    Stats = Window:AddTab({ Title = "สเตตัส Tab", Icon = "chevrons-up" }),
    Player = Window:AddTab({ Title = "ผู้เล่น", Icon = "chevrons-up" }),
    TP = Window:AddTab({ Title = "เกาะ", Icon = "rbxassetid://15712738876" }),
    Raid = Window:AddTab({ Title = "ดัน-มอง", Icon = "eye" }),
    Shop = Window:AddTab({ Title = "ซื้อ", Icon = "rbxassetid://15712767144" }), 
    Misc = Window:AddTab({ Title = "เพิ่มเติม", Icon = "rbxassetid://15712771666" }),
}

local Options = Fluent.Options
do
end
First_Sea = false
Second_Sea = false
Third_Sea = false
local placeId = game.PlaceId
if placeId == 2753915549 then
    First_Sea = true
elseif placeId == 4442272183 then
    Second_Sea = true
elseif placeId == 7449423635 then
    Third_Sea = true
end
if not game:IsLoaded() then 
    repeat game.Loaded:Wait()
    until game:IsLoaded() 
end
---------------------------------------------------------------------------------------------------------------------------------------
--all function
--[[ImageButton.MouseButton1Down:Connect(function()
    ClickSound:Play()    
    playClickAnimation()    
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "RightControl", false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, "RightControl", false, game)
end)--]]
local function CheckLevel()
	local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
	if World1 then
		if Lv == 1 or Lv <= 9 then
			Monster = "Bandit"
			LvQuest = 1
			NameQuest = "BanditQuest1"
			NameMonster = "Bandit"
			CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
			CFrameMonster = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
		elseif Lv == 10 or Lv <= 14 then
			Monster = "Monkey"
			LvQuest = 1
			NameQuest = "JungleQuest"
			NameMonster = "Monkey"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMonster = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
		elseif Lv == 15 or Lv <= 29 then
			Monster = "Gorilla"
			LvQuest = 2
			NameQuest = "JungleQuest"
			NameMonster = "Gorilla"
			CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMonster = CFrame.new(-1149.8736669921875, 40.46354675292969, -525.4237060546875)
		elseif Lv == 30 or Lv <= 39 then
			Monster = "Pirate"
			LvQuest = 1
			NameQuest = "BuggyQuest1"
			NameMonster = "Pirate"
			CFrameQuest = CFrame.new(-1139.5631103515625, 4.75205135345459, 3830.38671875)
			CFrameMonster = CFrame.new(-1045.943115234375, 64.41950225830078, 3930.302001953125)
		elseif Lv == 40 or Lv <= 59 then
			Monster = "Brute"
			LvQuest = 2
			NameQuest = "BuggyQuest1"
			NameMonster = "Brute"
			CFrameQuest = CFrame.new(-1139.5631103515625, 4.75205135345459, 3830.38671875)
			CFrameMonster = CFrame.new(-1150.2763671875, 130.60118103027344, 4164.9345703125)
		elseif Lv == 60 or Lv <= 74 then
			Monster = "Desert Bandit"
			LvQuest = 1
			NameQuest = "DesertQuest"
			NameMonster = "Desert Bandit"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMonster = CFrame.new(935.8798046975, 6.44867467880249, 4481.5859375)
		elseif Lv == 75 or Lv <= 89 then
			Monster = "Desert Officer"
			LvQuest = 2
			NameQuest = "DesertQuest"
			NameMonster = "Desert Officer"
			CFrameQuest = CFrame.new(894.488647, 5.14000702, 4392.43359, 0.819155693, -0, -0.573571265, 0, 1, -0, 0.573571265, 0, 0.819155693)
			CFrameMonster = CFrame.new(1608.2822265625, 8.614224433898926, 4371.00732421875)
		elseif Lv == 90 or Lv <= 99 then
			Monster = "Snow Bandit"
			LvQuest = 1
			NameQuest = "SnowQuest"
			NameMonster = "Snow Bandit"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMonster = CFrame.new(1354.347900390625, 87.27277374267578, -1393.946533203125)
		elseif Lv == 100 or Lv <= 119 then
			Monster = "Snowman"
			LvQuest = 2
			NameQuest = "SnowQuest"
			NameMonster = "Snowman"
			CFrameQuest = CFrame.new(1389.74451, 88.1519318, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
			CFrameMonster = CFrame.new(1201.6412353515625, 144.57958984375, -1550.0670166015625)
		elseif Lv == 120 or Lv <= 149 then
			Monster = "Chief Petty Officer"
			LvQuest = 1
			NameQuest = "MarineQuest2"
			NameMonster = "Chief Petty Officer"
			CFrameQuest = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-4710.35986328125, 112.02615356445312, 4584.92578125)
		elseif Lv == 150 or Lv <= 174 then
			Monster = "Sky Bandit"
			LvQuest = 1
			NameQuest = "SkyQuest"
			NameMonster = "Sky Bandit"
			CFrameQuest = CFrame.new(-4838.701171875, 717.6693115234375, -2617.86474609375)
			CFrameMonster = CFrame.new(-4965.37890625, 357.3741455078125, -2848.702392578125)
		elseif Lv == 175 or Lv <= 189 then
			Monster = "Dark Master"
			LvQuest = 2
			NameQuest = "SkyQuest"
			NameMonster = "Dark Master"
			CFrameQuest = CFrame.new(-4838.701171875, 717.6693115234375, -2617.86474609375)
			CFrameMonster = CFrame.new(-5224.05859375, 484.4478454589844, -2275.99853515625)
		elseif Lv == 190 or Lv <= 209 then
			Monster = "Prisoner"
			LvQuest = 1
			NameQuest = "PrisonerQuest"
			NameMonster = "Prisoner"
			CFrameQuest = CFrame.new(5309.6474609375, 1.654262661933899, 477.8815612792969)
			CFrameMonster = CFrame.new(5276.5576171875, 87.83663940429688, 561.0100708007812)
		elseif Lv == 210 or Lv <= 249 then
			Monster = "Dangerous Prisoner"
			LvQuest = 2
			NameQuest = "PrisonerQuest"
			NameMonster = "Dangerous Prisoner"
			CFrameQuest = CFrame.new(5309.6474609375, 1.654262661933899, 477.8815612792969)
			CFrameMonster = CFrame.new(5276.5576171875, 87.83663940429688, 561.0100708007812)
		elseif Lv == 250 or Lv <= 299 then
			Monster = "Toga Warrior"
			LvQuest = 1
			NameQuest = "ColosseumQuest"
			NameMonster = "Toga Warrior"
			CFrameQuest = CFrame.new(-1580.04663, 6.35000277, -2986.47534, -0.515037298, 0, -0.857167721, 0, 1, 0, 0.857167721, 0, -0.515037298)
			CFrameMonster = CFrame.new(-1820.21484375, 51.68385696411133, -2740.6650390625)
		elseif Lv == 300 or Lv <= 324 then
			Monster = "Military Soldier"
			LvQuest = 1
			NameQuest = "MagmaQuest"
			NameMonster = "Military Soldier"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
			CFrameMonster = CFrame.new(-5411.16455078125, 11.081554412841797, 8454.29296875)
		elseif Lv == 325 or Lv <= 374 then
			Monster = "Military Spy"
			LvQuest = 2
			NameQuest = "MagmaQuest"
			NameMonster = "Military Spy"
			CFrameQuest = CFrame.new(-5313.37012, 10.9500084, 8515.29395, -0.499959469, 0, 0.866048813, 0, 1, 0, -0.866048813, 0, -0.499959469)
			CFrameMonster = CFrame.new(-5802.8681640625, 86.26241302490234, 8828.859375)
		elseif Lv == 375 or Lv <= 399 then
			Monster = "Fishman Warrior"
			LvQuest = 1
			NameQuest = "FishmanQuest"
			NameMonster = "Fishman Warrior"
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
			CFrameMonster = CFrame.new(60878.30078125, 18.482830047607422, 1543.7574462890625)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
			end
		elseif Lv == 400 or Lv <= 449 then
			Monster = "Fishman Commando"
			LvQuest = 2
			NameQuest = "FishmanQuest"
			NameMonster = "Fishman Commando"
			CFrameQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
			CFrameMonster = CFrame.new(61922.6328125, 18.482830047607422, 1493.934326171875)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61122.65234375, 18.497442245483, 1569.3997802734))
			end
		elseif Lv == 450 or Lv <= 474 then
			Monster = "God's Guard"
			LvQuest = 1
			NameQuest = "SkyExp1Quest"
			NameMonster = "God's Guard"
			CFrameQuest = CFrame.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859)
			CFrameMonster = CFrame.new(-4710.04296875, 845.2769775390625, -1927.3079833984375)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4721.88867, 843.874695, -1949.96643, 0.996191859, -0, -0.0871884301, 0, 1, -0, 0.0871884301, 0, 0.996191859))
			end
		elseif Lv == 475 or Lv <= 524 then
			Monster = "Shanda"
			LvQuest = 2
			NameQuest = "SkyExp1Quest"
			NameMonster = "Shanda"
			CFrameQuest = CFrame.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
			CFrameMonster = CFrame.new(-7678.48974609375, 5566.40380859375, -497.2156066894531)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998))
			end
		elseif Lv == 525 or Lv <= 549 then
			Monster = "Royal Squad"
			LvQuest = 1
			NameQuest = "SkyExp2Quest"
			NameMonster = "Royal Squad"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-7624.25244140625, 5658.13330078125, -1467.354248046875)
		elseif Lv == 550 or Lv <= 624 then
			Monster = "Royal Soldier"
			LvQuest = 2
			NameQuest = "SkyExp2Quest"
			NameMonster = "Royal Soldier"
			CFrameQuest = CFrame.new(-7906.81592, 5634.6626, -1411.99194, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-7836.75341796875, 5645.6640625, -1790.6236572265625)
		elseif Lv == 625 or Lv <= 649 then
			Monster = "Galley Pirate"
			LvQuest = 1
			NameQuest = "FountainQuest"
			NameMonster = "Galley Pirate"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMonster = CFrame.new(5551.02197265625, 78.90135192871094, 3930.412841796875)
		elseif Lv >= 650 then
			Monster = "Galley Captain"
			LvQuest = 2
			NameQuest = "FountainQuest"
			NameMonster = "Galley Captain"
			CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
			CFrameMonster = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
		end
	elseif World2 then
		if Lv == 700 or Lv <= 724 then
			Monster = "Raider"
			LvQuest = 1
			NameQuest = "Area1Quest"
			NameMonster = "Raider"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMonster = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
		elseif Lv == 725 or Lv <= 774 then
			Monster = "Mercenary"
			LvQuest = 2
			NameQuest = "Area1Quest"
			NameMonster = "Mercenary"
			CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
			CFrameMonster = CFrame.new(-1004.3244018554688, 80.15886688232422, 1424.619384765625)
		elseif Lv == 775 or Lv <= 799 then
			Monster = "Swan Pirate"
			LvQuest = 1
			NameQuest = "Area2Quest"
			NameMonster = "Swan Pirate"
			CFrameQuest = CFrame.new(638.43811, 71.769989, 918.282898, 0.139203906, 0, 0.99026376, 0, 1, 0, -0.99026376, 0, 0.139203906)
			CFrameMonster = CFrame.new(1068.664306640625, 137.61428833007812, 1322.1060791015625)
		elseif Lv == 800 or Lv <= 874 then
			Monster = "Factory Staff"
			NameQuest = "Area2Quest"
			LvQuest = 2
			NameMonster = "Factory Staff"
			CFrameQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
			CFrameMonster = CFrame.new(73.07867431640625, 81.86344146728516, -27.470672607421875)
		elseif Lv == 875 or Lv <= 899 then
			Monster = "Marine Lieutenant"
			LvQuest = 1
			NameQuest = "MarineQuest3"
			NameMonster = "Marine Lieutenant"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMonster = CFrame.new(-2821.372314453125, 75.89727783203125, -3070.089111328125)
		elseif Lv == 900 or Lv <= 949 then
			Monster = "Marine Captain"
			LvQuest = 2
			NameQuest = "MarineQuest3"
			NameMonster = "Marine Captain"
			CFrameQuest = CFrame.new(-2440.79639, 71.7140732, -3216.06812, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
			CFrameMonster = CFrame.new(-1861.2310791015625, 80.17658233642578, -3254.697509765625)
		elseif Lv == 950 or Lv <= 974 then
			Monster = "Zombie"
			LvQuest = 1
			NameQuest = "ZombieQuest"
			NameMonster = "Zombie"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMonster = CFrame.new(-5657.77685546875, 78.96973419189453, -928.68701171875)
		elseif Lv == 975 or Lv <= 999 then
			Monster = "Vampire"
			LvQuest = 2
			NameQuest = "ZombieQuest"
			NameMonster = "Vampire"
			CFrameQuest = CFrame.new(-5497.06152, 47.5923004, -795.237061, -0.29242146, 0, -0.95628953, 0, 1, 0, 0.95628953, 0, -0.29242146)
			CFrameMonster = CFrame.new(-6037.66796875, 32.18463897705078, -1340.6597900390625)
		elseif Lv == 1000 or Lv <= 1049 then
			Monster = "Snow Trooper"
			LvQuest = 1
			NameQuest = "SnowMountainQuest"
			NameMonster = "Snow Trooper"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMonster = CFrame.new(549.1473388671875, 427.3870544433594, -5563.69873046875)
		elseif Lv == 1050 or Lv <= 1099 then
			Monster = "Winter Warrior"
			LvQuest = 2
			NameQuest = "SnowMountainQuest"
			NameMonster = "Winter Warrior"
			CFrameQuest = CFrame.new(609.858826, 400.119904, -5372.25928, -0.374604106, 0, 0.92718488, 0, 1, 0, -0.92718488, 0, -0.374604106)
			CFrameMonster = CFrame.new(1142.7451171875, 475.6398010253906, -5199.41650390625)
		elseif Lv == 1100 or Lv <= 1124 then
			Monster = "Lab Subordinate"
			LvQuest = 1
			NameQuest = "IceSideQuest"
			NameMonster = "Lab Subordinate"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMonster = CFrame.new(-5707.4716796875, 15.951709747314453, -4513.39208984375)
		elseif Lv == 1125 or Lv <= 1174 then
			Monster = "Horned Warrior"
			LvQuest = 2
			NameQuest = "IceSideQuest"
			NameMonster = "Horned Warrior"
			CFrameQuest = CFrame.new(-6064.06885, 15.2422857, -4902.97852, 0.453972578, -0, -0.891015649, 0, 1, -0, 0.891015649, 0, 0.453972578)
			CFrameMonster = CFrame.new(-6341.36669921875, 15.951770782470703, -5723.162109375)
		elseif Lv == 1175 or Lv <= 1199 then
			Monster = "Magma Ninja"
			LvQuest = 1
			NameQuest = "FireSideQuest"
			NameMonster = "Magma Ninja"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMonster = CFrame.new(-5449.6728515625, 76.65874481201172, -5808.20068359375)
		elseif Lv == 1200 or Lv <= 1249 then
			Monster = "Lava Pirate"
			LvQuest = 2
			NameQuest = "FireSideQuest"
			NameMonster = "Lava Pirate"
			CFrameQuest = CFrame.new(-5428.03174, 15.0622921, -5299.43457, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMonster = CFrame.new(-5213.33154296875, 49.73788070678711, -4701.451171875)
		elseif Lv == 1250 or Lv <= 1274 then
			Monster = "Ship Deckhand"
			LvQuest = 1
			NameQuest = "ShipQuest1"
			NameMonster = "Ship Deckhand"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
			CFrameMonster = CFrame.new(1212.0111083984375, 150.79205322265625, 33059.24609375)
			if _G.AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1275 or Lv <= 1299 then
			Monster = "Ship Engineer"
			LvQuest = 2
			NameQuest = "ShipQuest1"
			NameMonster = "Ship Engineer"
			CFrameQuest = CFrame.new(1037.80127, 125.092171, 32911.6016)
			CFrameMonster = CFrame.new(919.4786376953125, 43.54401397705078, 32779.96875)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1300 or Lv <= 1324 then
			Monster = "Ship Steward"
			LvQuest = 1
			NameQuest = "ShipQuest2"
			NameMonster = "Ship Steward"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
			CFrameMonster = CFrame.new(919.4385375976562, 129.55599975585938, 33436.03515625)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1325 or Lv <= 1349 then
			Monster = "Ship Officer"
			LvQuest = 2
			NameQuest = "ShipQuest2"
			NameMonster = "Ship Officer"
			CFrameQuest = CFrame.new(968.80957, 125.092171, 33244.125)
			CFrameMonster = CFrame.new(1036.0179443359375, 181.4390411376953, 33315.7265625)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
			end
		elseif Lv == 1350 or Lv <= 1374 then
			Monster = "Arctic Warrior"
			LvQuest = 1
			NameQuest = "FrostQuest"
			NameMonster = "Arctic Warrior"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMonster = CFrame.new(5966.24609375, 62.97002029418945, -6179.3828125)
			if _G.AutoFarmLevel and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909))
			end
		elseif Lv == 1375 or Lv <= 1424 then
			Monster = "Snow Lurker"
			LvQuest = 2
			NameQuest = "FrostQuest"
			NameMonster = "Snow Lurker"
			CFrameQuest = CFrame.new(5667.6582, 26.7997818, -6486.08984, -0.933587909, 0, -0.358349502, 0, 1, 0, 0.358349502, 0, -0.933587909)
			CFrameMonster = CFrame.new(5407.07373046875, 69.19437408447266, -6880.88037109375)
		elseif Lv == 1425 or Lv <= 1449 then
			Monster = "Sea Soldier"
			LvQuest = 1
			NameQuest = "ForgottenQuest"
			NameMonster = "Sea Soldier"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMonster = CFrame.new(-3028.2236328125, 64.67451477050781, -9775.4267578125)
		elseif Lv >= 1450 then
			Monster = "Water Fighter"
			LvQuest = 2
			NameQuest = "ForgottenQuest"
			NameMonster = "Water Fighter"
			CFrameQuest = CFrame.new(-3054.44458, 235.544281, -10142.8193, 0.990270376, -0, -0.13915664, 0, 1, -0, 0.13915664, 0, 0.990270376)
			CFrameMonster = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
		end
	elseif World3 then
		if Lv == 1500 or Lv <= 1524 then
			Monster = "Pirate Millionaire"
			LvQuest = 1
			NameQuest = "PiratePortQuest"
			NameMonster = "Pirate Millionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMonster = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
		elseif Lv == 1525 or Lv <= 1574 then
			Monster = "Pistol Billionaire"
			LvQuest = 2
			NameQuest = "PiratePortQuest"
			NameMonster = "Pistol Billionaire"
			CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
			CFrameMonster = CFrame.new(-187.3301544189453, 86.23987579345703, 6013.513671875)
		elseif Lv == 1575 or Lv <= 1599 then
			Monster = "Dragon Crew Warrior"
			LvQuest = 1
			NameQuest = "AmazonQuest"
			NameMonster = "Dragon Crew Warrior"
			CFrameQuest = CFrame.new(5832.83594, 51.6806107, -1101.51563, 0.898790359, -0, -0.438378751, 0, 1, -0, 0.438378751, 0, 0.898790359)
			CFrameMonster = CFrame.new(6141.140625, 51.35136413574219, -1340.738525390625)
		elseif Lv == 1600 or Lv <= 1624 then
			Monster = "Dragon Crew Archer"
			NameQuest = "AmazonQuest"
			LvQuest = 2
			NameMonster = "Dragon Crew Archer"
			CFrameQuest = CFrame.new(5833.1147460938, 51.60498046875, -1103.0693359375)
			CFrameMonster = CFrame.new(6616.41748046875, 441.7670593261719, 446.0469970703125)
		elseif Lv == 1625 or Lv <= 1649 then
			Monster = "Female Islander"
			NameQuest = "AmazonQuest2"
			LvQuest = 1
			NameMonster = "Female Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMonster = CFrame.new(4685.25830078125, 735.8078002929688, 815.3425903320312)
		elseif Lv == 1650 or Lv <= 1699 then
			Monster = "Giant Islander"
			NameQuest = "AmazonQuest2"
			LvQuest = 2
			NameMonster = "Giant Islander"
			CFrameQuest = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
			CFrameMonster = CFrame.new(4729.09423828125, 590.436767578125, -36.97627639770508)
		elseif Lv == 1700 or Lv <= 1724 then
			Monster = "Marine Commodore"
			LvQuest = 1
			NameQuest = "MarineTreeIsland"
			NameMonster = "Marine Commodore"
			CFrameQuest = CFrame.new(2180.54126, 27.8156815, -6741.5498, -0.965929747, 0, 0.258804798, 0, 1, 0, -0.258804798, 0, -0.965929747)
			CFrameMonster = CFrame.new(2286.0078125, 73.13391876220703, -7159.80908203125)
		elseif Lv == 1725 or Lv <= 1774 then
			Monster = "Marine Rear Admiral"
			NameMonster = "Marine Rear Admiral"
			NameQuest = "MarineTreeIsland"
			LvQuest = 2
			CFrameQuest = CFrame.new(2179.98828125, 28.731239318848, -6740.0551757813)
			CFrameMonster = CFrame.new(3656.773681640625, 160.52406311035156, -7001.5986328125)
		elseif Lv == 1775 or Lv <= 1799 then
			Monster = "Fishman Raider"
			LvQuest = 1
			NameQuest = "DeepForestIsland3"
			NameMonster = "Fishman Raider"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMonster = CFrame.new(-10407.5263671875, 331.76263427734375, -8368.5166015625)
		elseif Lv == 1800 or Lv <= 1824 then
			Monster = "Fishman Captain"
			LvQuest = 2
			NameQuest = "DeepForestIsland3"
			NameMonster = "Fishman Captain"
			CFrameQuest = CFrame.new(-10581.6563, 330.872955, -8761.18652, -0.882952213, 0, 0.469463557, 0, 1, 0, -0.469463557, 0, -0.882952213)
			CFrameMonster = CFrame.new(-10994.701171875, 352.38140869140625, -9002.1103515625)
		elseif Lv == 1825 or Lv <= 1849 then
			Monster = "Forest Pirate"
			LvQuest = 1
			NameQuest = "DeepForestIsland"
			NameMonster = "Forest Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMonster = CFrame.new(-13274.478515625, 332.3781433105469, -7769.58056640625)
		elseif Lv == 1850 or Lv <= 1899 then
			Monster = "Mythological Pirate"
			LvQuest = 2
			NameQuest = "DeepForestIsland"
			NameMonster = "Mythological Pirate"
			CFrameQuest = CFrame.new(-13234.04, 331.488495, -7625.40137, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
			CFrameMonster = CFrame.new(-13680.607421875, 501.08154296875, -6991.189453125)
		elseif Lv == 1900 or Lv <= 1924 then
			Monster = "Jungle Pirate"
			LvQuest = 1
			NameQuest = "DeepForestIsland2"
			NameMonster = "Jungle Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMonster = CFrame.new(-12256.16015625, 331.73828125, -10485.8369140625)
		elseif Lv == 1925 or Lv <= 1974 then
			Monster = "Musketeer Pirate"
			LvQuest = 2
			NameQuest = "DeepForestIsland2"
			NameMonster = "Musketeer Pirate"
			CFrameQuest = CFrame.new(-12680.3818, 389.971039, -9902.01953, -0.0871315002, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, -0.0871315002)
			CFrameMonster = CFrame.new(-13457.904296875, 391.545654296875, -9859.177734375)
		elseif Lv == 1975 or Lv <= 1999 then
			Monster = "Reborn Skeleton"
			LvQuest = 1
			NameQuest = "HauntedQuest1"
			NameMonster = "Reborn Skeleton"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMonster = CFrame.new(-8763.7236328125, 165.72299194335938, 6159.86181640625)
		elseif Lv == 2000 or Lv <= 2024 then
			Monster = "Living Zombie"
			LvQuest = 2
			NameQuest = "HauntedQuest1"
			NameMonster = "Living Zombie"
			CFrameQuest = CFrame.new(-9479.2168, 141.215088, 5566.09277, 0, 0, 1, 0, 1, -0, -1, 0, 0)
			CFrameMonster = CFrame.new(-10144.1318359375, 138.62667846679688, 5838.0888671875)
		elseif Lv == 2025 or Lv <= 2049 then
			Monster = "DeMonsteric Soul"
			LvQuest = 1
			NameQuest = "HauntedQuest2"
			NameMonster = "DeMonsteric Soul"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-9505.8720703125, 172.10482788085938, 6158.9931640625)
		elseif Lv == 2050 or Lv <= 2074 then
			Monster = "Posessed Mummy"
			LvQuest = 2
			NameQuest = "HauntedQuest2"
			NameMonster = "Posessed Mummy"
			CFrameQuest = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-9582.0224609375, 6.251527309417725, 6205.478515625)
		elseif Lv == 2075 or Lv <= 2099 then
			Monster = "Peanut Scout"
			LvQuest = 1
			NameQuest = "NutsIslandQuest"
			NameMonster = "Peanut Scout"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-2143.241943359375, 47.72198486328125, -10029.9951171875)
		elseif Lv == 2100 or Lv <= 2124 then
			Monster = "Peanut President"
			LvQuest = 2
			NameQuest = "NutsIslandQuest"
			NameMonster = "Peanut President"
			CFrameQuest = CFrame.new(-2104.3908691406, 38.104167938232, -10194.21875, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-1859.35400390625, 38.10316848754883, -10422.4296875)
		elseif Lv == 2125 or Lv <= 2149 then
			Monster = "Ice Cream Chef"
			LvQuest = 1
			NameQuest = "IceCreamIslandQuest"
			NameMonster = "Ice Cream Chef"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-872.24658203125, 65.81957244873047, -10919.95703125)
		elseif Lv == 2150 or Lv <= 2199 then
			Monster = "Ice Cream Commander"
			LvQuest = 2
			NameQuest = "IceCreamIslandQuest"
			NameMonster = "Ice Cream Commander"
			CFrameQuest = CFrame.new(-820.64825439453, 65.819526672363, -10965.795898438, 0, 0, -1, 0, 1, 0, 1, 0, 0)
			CFrameMonster = CFrame.new(-558.06103515625, 112.04895782470703, -11290.7744140625)
		elseif Lv == 2200 or Lv <= 2224 then
			Monster = "Cookie Crafter"
			LvQuest = 1
			NameQuest = "CakeQuest1"
			NameMonster = "Cookie Crafter"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
			CFrameMonster = CFrame.new(-2374.13671875, 37.79826354980469, -12125.30859375)
		elseif Lv == 2225 or Lv <= 2249 then
			Monster = "Cake Guard"
			LvQuest = 2
			NameQuest = "CakeQuest1"
			NameMonster = "Cake Guard"
			CFrameQuest = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177818, 6.9301187e-08, 1, 7.51931211e-08, -0.288177818, -5.2032135e-08, 0.957576931)
			CFrameMonster = CFrame.new(-1598.3070068359375, 43.773197174072266, -12244.5810546875)
		elseif Lv == 2250 or Lv <= 2274 then
			Monster = "Baking Staff"
			LvQuest = 1
			NameQuest = "CakeQuest2"
			NameMonster = "Baking Staff"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
			CFrameMonster = CFrame.new(-1887.8099365234375, 77.6185073852539, -12998.3505859375)
		elseif Lv == 2275 or Lv <= 2299 then
			Monster = "Head Baker"
			LvQuest = 2
			NameQuest = "CakeQuest2"
			NameMonster = "Head Baker"
			CFrameQuest = CFrame.new(-1927.91602, 37.7981339, -12842.5391, -0.96804446, 4.22142143e-08, 0.250778586, 4.74911062e-08, 1, 1.49904711e-08, -0.250778586, 2.64211941e-08, -0.96804446)
			CFrameMonster = CFrame.new(-2216.188232421875, 82.884521484375, -12869.2939453125)
		elseif Lv == 2300 or Lv <= 2324 then
			Monster = "Cocoa Warrior"
			LvQuest = 1
			NameQuest = "ChocQuest1"
			NameMonster = "Cocoa Warrior"
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
			CFrameMonster = CFrame.new(-21.55328369140625, 80.57499694824219, -12352.3876953125)
		elseif Lv == 2325 or Lv <= 2349 then
			Monster = "Chocolate Bar Battler"
			LvQuest = 2
			NameQuest = "ChocQuest1"
			NameMonster = "Chocolate Bar Battler"
			CFrameQuest = CFrame.new(233.22836303710938, 29.876001358032227, -12201.2333984375)
			CFrameMonster = CFrame.new(582.590576171875, 77.18809509277344, -12463.162109375)
		elseif Lv == 2350 or Lv <= 2374 then
			Monster = "Sweet Thief"
			LvQuest = 1
			NameQuest = "ChocQuest2"
			NameMonster = "Sweet Thief"
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
			CFrameMonster = CFrame.new(165.1884765625, 76.05885314941406, -12600.8369140625)
		elseif Lv == 2375 or Lv <= 2399 then
			Monster = "Candy Rebel"
			LvQuest = 2
			NameQuest = "ChocQuest2"
			NameMonster = "Candy Rebel"
			CFrameQuest = CFrame.new(150.5066375732422, 30.693693161010742, -12774.5029296875)
			CFrameMonster = CFrame.new(134.86563110351562, 77.2476806640625, -12876.5478515625)
		elseif Lv == 2400 or Lv <= 2424 then
			Monster = "Candy Pirate"
			LvQuest = 1
			NameQuest = "CandyQuest1"
			NameMonster = "Candy Pirate"
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
			CFrameMonster = CFrame.new(-1310.5003662109375, 26.016523361206055, -14562.404296875)
		elseif Lv == 2425 or Lv <= 2449 then
			Monster = "Snow DeMonster"
			LvQuest = 2
			NameQuest = "CandyQuest1"
			NameMonster = "Snow DeMonster"
			CFrameQuest = CFrame.new(-1150.0400390625, 20.378934860229492, -14446.3349609375)
			CFrameMonster = CFrame.new(-880.2006225585938, 71.24776458740234, -14538.609375)
		elseif Lv == 2450 or Lv <= 2474 then
			Monster = "Isle Outlaw"
			LvQuest = 1
			NameQuest = "TikiQuest1"
			NameMonster = "Isle Outlaw"
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
			CFrameMonster = CFrame.new(-16442.814453125, 116.13899993896484, -264.4637756347656)
		elseif Lv == 2475 or Lv <= 2499 then
			Monster = "Island Boy"
			LvQuest = 2
			NameQuest = "TikiQuest1"
			NameMonster = "Island Boy"
			CFrameQuest = CFrame.new(-16547.748046875, 61.13533401489258, -173.41360473632812)
			CFrameMonster = CFrame.new(-16901.26171875, 84.06756591796875, -192.88906860351562)
		elseif Lv == 2500 or Lv <= 2524 then
			Monster = "Sun-kissed Warrior"
			LvQuest = 1
			NameQuest = "TikiQuest2"
			NameMonster = "kissed"
			CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
			CFrameMonster = CFrame.new(-16051.9697265625, 54.797149658203125, 1084.67578125)
		elseif Lv == 2525 or Lv <= 2550 then
			Monster = "Isle Champion"
			LvQuest = 2
			NameQuest = "TikiQuest2"
			NameMonster = "Isle Champion"
			CFrameQuest = CFrame.new(-16539.078125, 55.68632888793945, 1051.5738525390625)
			CFrameMonster = CFrame.new(-16619.37109375, 129.9848175048828, 1071.235595703125)
		elseif Lv == 2550 or Lv <= 2574 then
			Monster = "Serpent Hunter"
			LvQuest = 1
			NameQuest = "TikiQuest3"
			NameMonster = "Serpent Hunter"
			CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
			CFrameMonster = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
		elseif Lv == 2575 or Lv <= 2600 then
			Monster = "Skull Slayer"
			LvQuest = 2
			NameQuest = "TikiQuest3"
			NameMonster = "Skull Slayer"
			CFrameQuest = CFrame.new(-16665.1914, 104.596405, 1579.69434, 0.951068401, -0, -0.308980465, 0, 1, -0, 0.308980465, 0, 0.951068401)
			CFrameMonster = CFrame.new(-16654.7754, 105.286232, 1579.67444, 0.999096751, 4.45934489e-08, 0.0424928814, -4.38822667e-08, 1, -1.76692847e-08, -0.0424928814, 1.57886415e-08, 0.999096751)
		end
	end
end
--// Check Boss Quest
function CheckBossQuest()
	if First_Sea then
		if SelectBoss == "The Gorilla King" then
			BossMon = "The Gorilla King"
			NameBoss = 'The Gorrila King'
			NameQuestBoss = "JungleQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$2,000\n7,000 Exp."
			CFrameQBoss = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
			CFrameBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906, -0.707134247, 0, 0.707079291, 0, 1, 0, -0.707079291, 0, -0.707134247)
		elseif SelectBoss == "Bobby" then
			BossMon = "Bobby"
			NameBoss = 'Bobby'
			NameQuestBoss = "BuggyQuest1"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$8,000\n35,000 Exp."
			CFrameQBoss = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
			CFrameBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
		elseif SelectBoss == "The Saw" then
			BossMon = "The Saw"
			NameBoss = 'The Saw'
			CFrameBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
		elseif SelectBoss == "Yeti" then
			BossMon = "Yeti"
			NameBoss = 'Yeti'
			NameQuestBoss = "SnowQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$10,000\n180,000 Exp."
			CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
			CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
		elseif SelectBoss == "Mob Leader" then
			BossMon = "Mob Leader"
			NameBoss = 'Mob Leader'
			CFrameBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
		elseif SelectBoss == "Vice Admiral" then
			BossMon = "Vice Admiral"
			NameBoss = 'Vice Admiral'
			NameQuestBoss = "MarineQuest2"
			QuestLvBoss = 2
			RewardBoss = "Reward:\n$10,000\n180,000 Exp."
			CFrameQBoss = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
			CFrameBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
		elseif SelectBoss == "Saber Expert" then
			NameBoss = 'Saber Expert'
			BossMon = "Saber Expert"
			CFrameBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
		elseif SelectBoss == "Warden" then
			BossMon = "Warden"
			NameBoss = 'Warden'
			NameQuestBoss = "ImpelQuest"
			QuestLvBoss = 1
			RewardBoss = "Reward:\n$6,000\n850,000 Exp."
			CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, -4.49946401e-06, 0.975376427, -1.95412576e-05, 1, 9.03162072e-06, -0.975376427, -2.10519756e-05, 0.220546961)
			CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif SelectBoss == "Chief Warden" then
			BossMon = "Chief Warden"
			NameBoss = 'Chief Warden'
			NameQuestBoss = "ImpelQuest"
			QuestLvBoss = 2
			RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
			CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, -0.00062915677, 0.939684749, 0.00191645394, 0.999998152, -2.80422337e-05, -0.939682961, 0.00181045406, 0.342041939)
			CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif SelectBoss == "Swan" then
			BossMon = "Swan"
			NameBoss = 'Swan'
			NameQuestBoss = "ImpelQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
			CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, -0.309060812, 0, 0.951042235, 0, 1, 0, -0.951042235, 0, -0.309060812)
			CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, -0.731384635, 0, 0.681965172, 0, 1, 0, -0.681965172, 0, -0.731384635)
		elseif SelectBoss == "Magma Admiral" then
			BossMon = "Magma Admiral"
			NameBoss = 'Magma Admiral'
			NameQuestBoss = "MagmaQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
			CFrameQBoss = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
			CFrameBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
		elseif SelectBoss == "Fishman Lord" then
			BossMon = "Fishman Lord"
			NameBoss = 'Fishman Lord'
			NameQuestBoss = "FishmanQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
			CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
			CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
		elseif SelectBoss == "Wysper" then
			BossMon = "Wysper"
			NameBoss = 'Wysper'
			NameQuestBoss = "SkyExp1Quest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
			CFrameQBoss = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
			CFrameBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
		elseif SelectBoss == "Thunder God" then
			BossMon = "Thunder God"
			NameBoss = 'Thunder God'
			NameQuestBoss = "SkyExp2Quest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
			CFrameQBoss = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
			CFrameBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
		elseif SelectBoss == "Cyborg" then
			BossMon = "Cyborg"
			NameBoss = 'Cyborg'
			NameQuestBoss = "FountainQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
			CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
			CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
		elseif SelectBoss == "Ice Admiral" then
			BossMon = "Ice Admiral"
			NameBoss = 'Ice Admiral'
			CFrameBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678, -0.573599219, 0, -0.81913656, 0, 1, 0, 0.81913656, 0, -0.573599219)
		elseif SelectBoss == "Greybeard" then
			BossMon = "Greybeard"
			NameBoss = 'Greybeard'
			CFrameBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
		end
	end
	if Second_Sea then
		if SelectBoss == "Diamond" then
			BossMon = "Diamond"
			NameBoss = 'Diamond'
			NameQuestBoss = "Area1Quest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
			CFrameQBoss = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
			CFrameBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
		elseif SelectBoss == "Jeremy" then
			BossMon = "Jeremy"
			NameBoss = 'Jeremy'
			NameQuestBoss = "Area2Quest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
			CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
			CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
		elseif SelectBoss == "Fajita" then
			BossMon = "Fajita"
			NameBoss = 'Fajita'
			NameQuestBoss = "MarineQuest3"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
			CFrameQBoss = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
			CFrameBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
		elseif SelectBoss == "Don Swan" then
			BossMon = "Don Swan"
			NameBoss = 'Don Swan'
			CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
		elseif SelectBoss == "Smoke Admiral" then
			BossMon = "Smoke Admiral"
			NameBoss = 'Smoke Admiral'
			NameQuestBoss = "IceSideQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
			CFrameQBoss = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
			CFrameBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
		elseif SelectBoss == "Awakened Ice Admiral" then
			BossMon = "Awakened Ice Admiral"
			NameBoss = 'Awakened Ice Admiral'
			NameQuestBoss = "FrostQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
			CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
			CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
		elseif SelectBoss == "Tide Keeper" then
			BossMon = "Tide Keeper"
			NameBoss = 'Tide Keeper'
			NameQuestBoss = "ForgottenQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
			CFrameQBoss = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
			CFrameBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
		elseif SelectBoss == "Darkbeard" then
			BossMon = "Darkbeard"
			NameBoss = 'Darkbeard'
			CFrameMon = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
		elseif SelectBoss == "Cursed Captain" then
			BossMon = "Cursed Captain"
			NameBoss = 'Cursed Captain'
			CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
		elseif SelectBoss == "Order" then
			BossMon = "Order"
			NameBoss = 'Order'
			CFrameBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
		end
	end
	if Third_Sea then
		if SelectBoss == "Stone" then
			BossMon = "Stone"
			NameBoss = 'Stone'
			NameQuestBoss = "PiratePortQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
			CFrameQBoss = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
			CFrameBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
		elseif SelectBoss == "Island Empress" then
			BossMon = "Island Empress"
			NameBoss = 'Island Empress'
			NameQuestBoss = "AmazonQuest2"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
			CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
			CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
		elseif SelectBoss == "Kilo Admiral" then
			BossMon = "Kilo Admiral"
			NameBoss = 'Kilo Admiral'
			NameQuestBoss = "MarineTreeIsland"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
			CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
			CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
		elseif SelectBoss == "Captain Elephant" then
			BossMon = "Captain Elephant"
			NameBoss = 'Captain Elephant'
			NameQuestBoss = "DeepForestIsland"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
			CFrameQBoss = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
			CFrameBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
		elseif SelectBoss == "Beautiful Pirate" then
			BossMon = "Beautiful Pirate"
			NameBoss = 'Beautiful Pirate'
			NameQuestBoss = "DeepForestIsland2"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
			CFrameQBoss = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
			CFrameBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
		elseif SelectBoss == "Cake Queen" then
			BossMon = "Cake Queen"
			NameBoss = 'Cake Queen'
			NameQuestBoss = "IceCreamIslandQuest"
			QuestLvBoss = 3
			RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
			CFrameQBoss = CFrame.new(-819.376709, 64.9259796, -10967.2832, -0.766061664, 0, 0.642767608, 0, 1, 0, -0.642767608, 0, -0.766061664)
			CFrameBoss = CFrame.new(-678.648804, 381.353943, -11114.2012, -0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, -0.417492568, 0.0167988986, -0.90852499)
		elseif SelectBoss == "Longma" then
			BossMon = "Longma"
			NameBoss = 'Longma'
			CFrameBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
		elseif SelectBoss == "Soul Reaper" then
			BossMon = "Soul Reaper"
			NameBoss = 'Soul Reaper'
			CFrameBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
		elseif SelectBoss == "rip_indra True Form" then
			BossMon = "rip_indra True Form"
			NameBoss = 'rip_indra True Form'
			CFrameBoss = CFrame.new(-5415.3920898438, 505.74133300781, -2814.0166015625)
		end
	end
end
--// Check Material
function MaterialMon()
	if SelectMaterial == "Radioactive Material" then
		MMon = "Factory Staff"
		MPos = CFrame.new(295, 73, -56)
		SP = "Default"
	elseif SelectMaterial == "Mystic Droplet" then
		MMon = "Water Fighter"
		MPos = CFrame.new(-3385, 239, -10542)
		SP = "Default"
	elseif SelectMaterial == "Magma Ore" then
		if First_Sea then
			MMon = "Military Spy"
			MPos = CFrame.new(-5815, 84, 8820)
			SP = "Default"
		elseif Second_Sea then
			MMon = "Magma Ninja"
			MPos = CFrame.new(-5428, 78, -5959)
			SP = "Default"
		end
	elseif SelectMaterial == "Angel Wings" then
		MMon = "God's Guard"
		MPos = CFrame.new(-4698, 845, -1912)
		SP = "Default"
		if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(-7859.09814, 5544.19043, -381.476196)).Magnitude >= 5000 then
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7859.09814, 5544.19043, -381.476196))
		end
	elseif SelectMaterial == "Leather" then
		if First_Sea then
			MMon = "Brute"
			MPos = CFrame.new(-1145, 15, 4350)
			SP = "Default"
		elseif Second_Sea then
			MMon = "Marine Captain"
			MPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
			SP = "Default"
		elseif Third_Sea then
			MMon = "Jungle Pirate"
			MPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
			SP = "Default"
		end
	elseif SelectMaterial == "Scrap Metal" then
		if First_Sea then
			MMon = "Brute"
			MPos = CFrame.new(-1145, 15, 4350)
			SP = "Default"
		elseif Second_Sea then
			MMon = "Swan Pirate"
			MPos = CFrame.new(878, 122, 1235)
			SP = "Default"
		elseif Third_Sea then
			MMon = "Jungle Pirate"
			MPos = CFrame.new(-12107, 332, -10549)
			SP = "Default"
		end
	elseif SelectMaterial == "Fish Tail" then
		if Third_Sea then
			MMon = "Fishman Raider"
			MPos = CFrame.new(-10993, 332, -8940)
			SP = "Default"
		elseif First_Sea then
			MMon = "Fishman Warrior"
			MPos = CFrame.new(61123, 19, 1569)
			SP = "Default"
			if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
			end
		end
	elseif SelectMaterial == "Demonic Wisp" then
		MMon = "Demonic Soul"
		MPos = CFrame.new(-9507, 172, 6158)
		SP = "Default"
	elseif SelectMaterial == "Vampire Fang" then
		MMon = "Vampire"
		MPos = CFrame.new(-6033, 7, -1317)
		SP = "Default"
	elseif SelectMaterial == "Conjured Cocoa" then
		MMon = "Chocolate Bar Battler"
		MPos = CFrame.new(620.6344604492188, 78.93644714355469, -12581.369140625)
		SP = "Default"
	elseif SelectMaterial == "Dragon Scale" then
		MMon = "Dragon Crew Archer"
		MPos = CFrame.new(6594, 383, 139)
		SP = "Default"
	elseif SelectMaterial == "Gunpowder" then
		MMon = "Pistol Billionaire"
		MPos = CFrame.new(-469, 74, 5904)
		SP = "Default"
	elseif SelectMaterial == "Mini Tusk" then
		MMon = "Mythological Pirate"
		MPos = CFrame.new(-13545, 470, -6917)
		SP = "Default"
	end
end
function TP(P1)
    if not _G.Stop_Tween then
        local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        Speed = 350
        if Distance < 250 then
            Speed = 5000
        elseif Distance < 500 then
            Speed = 650
        elseif Distance < 1000 then
            Speed = 350
        elseif Distance >= 1000 then
            Speed = 350
        end
        Tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),{CFrame = P1})
        if _G.Stop_Tween or Auto_Raid then
            Tween:Cancel()
        elseif game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
            Tween:Play()
        end
    end
end

function TP3(P1)
local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 500 then
Speed = 500
elseif Distance < 500 then
Speed = 500
elseif Distance < 1000 then
Speed = 500
elseif Distance >= 1000 then
Speed = 500
end
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
{CFrame = P1}
):Play()
if _G.Stop_Tween then
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = P1}
):Cancel()
end
end
function TP2(P1)
local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 1000 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 500 then
Speed = 350
elseif Distance < 1000 then
Speed = 350
elseif Distance >= 1000 then
Speed = 350
end
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
{CFrame = P1}
):Play()
if _G.Stop_Tween then
game:GetService("TweenService"):Create(
game.Players.LocalPlayer.Character.HumanoidRootPart,
TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = P1}
):Cancel()
end
_G.Clip = true
wait(Distance/Speed)
_G.Clip = false
end
function StopTween(target)
if not target then
_G.StopTween = true
wait()
TP2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
wait()
if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
end
_G.StopTween = false
_G.Clip = false
end
end
task.spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		pcall(function()
			if _G.Clip or _G.AutoNextIsland then
            if syn then
                setfDescription("HumanoidParallelRemoveNoPhysics", "False")
                setfDescription("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                end
            else
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == true then
                            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit = false
                        end
                        local BodyVelocity = Instance.new("BodyVelocity")
                        BodyVelocity.Name = "BodyVelocity1"
                        BodyVelocity.Parent =  game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                        BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
                        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false    
                    end
                end
            end
        else
            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1") then
                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity1"):Destroy();
            end
        end
    end)
end)
end)
task.spawn(function()
	while wait() do
		pcall(function()
			if SelectWeapon == "Melee" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			elseif SelectWeapon == "Sword" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Sword" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
            elseif SelectWeapon == "Gun" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Gun" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
			end
			elseif SelectWeapon == "Devil Fruit" then
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Blox Fruit" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			else
				for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if v.ToolTip == "Melee" then
						if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
							WeaponName = v.Name
						end
					end
				end
			end
	end)
end
end)
function EquipToolSword()
	pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Sword" and v:IsA('Tool') then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid)
			end
		end
	end)
end
function EquipAllTool()
	pcall(function()
		for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
				local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)
				game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid)
				wait(1)
			end
		end
	end)
end
spawn(function()
	while task.wait() do
		pcall(function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.X.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
			if (game.Players.LocalPlayer.Character.X.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 1 then
				game.Players.LocalPlayer.Character.X.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game.Players.LocalPlayer.Character.X.Position)
			end
		end)
	end
end)
spawn(function()
	pcall(function()
		while task.wait() do
			for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then
						SelectWeaponGun = v.Name
					end
				end
			end
		end
	end)
end)
game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
_G.BringMonster = true
_G.BringMode = 235
spawn(function()
	while task.wait() do
		if _G.BringMonster then
			pcall(function()
				CheckLevel()
				for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.AutoFarmLevel and BringFarmLevel and v.Name == Monster and (Mon == "Factory Staff" or Mon == "Monkey" or Mon == "Dragon Crew Warrior" or Mon == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
						v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid:ChangeState(14)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
					elseif _G.AutoFarmLevel and BringFarmLevel and v.Name == Monster and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid:ChangeState(14)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
					end
				end
			end)
		end
	end
end)
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.BringMonster then
				CheckLevel()
				for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
					if _G.AutoFarmLevel and BringFarmLevel and v.Name == Monster and (Monster == "Factory Staff" or Monster == "Monkey" or Monster == "Dragon Crew Warrior" or Monster == "Dragon Crew Archer") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 275 then
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid:ChangeState(14)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
					elseif _G.AutoFarmLevel and BringFarmLevel and v.Name == Monster and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						v.HumanoidRootPart.Size = Vector3.new(150, 150, 150)
						v.HumanoidRootPart.CFrame = PosMon
						v.Humanoid:ChangeState(14)
						v.HumanoidRootPart.CanCollide = false
						v.Head.CanCollide = false
						if v.Humanoid:FindFirstChild("Animator") then
							v.Humanoid.Animator:Destroy()
						end
						sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
					end
					if _G.AutoObservationv2 or Mangnetcitzenmon then
						if v.Name == "Forest Pirate" and (v.HumanoidRootPart.Position - MusketeerHatMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.Humanoid:ChangeState(14)
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							v.HumanoidRootPart.CFrame = PosHee
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
						end
					end
					if _G.AutoEvoRaceV2 and StartEvoMagnet then
						if v.Name == "Zombie" and (v.HumanoidRootPart.Position - PosMonEvo.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.Humanoid:ChangeState(14)
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							v.HumanoidRootPart.CFrame = PosMonEvo
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
						end
					end
					if _G.AutoFarmFruitMastery and StartMasteryFruitMagnet then
						if v.Name == "Monkey" then
							if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= 160 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								v.Humanoid:ChangeState(14)
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								v.HumanoidRootPart.CFrame = PosMonMasteryFruit
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif v.Name == "Factory Staff" then
							if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
								v.Humanoid:ChangeState(14)
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								v.HumanoidRootPart.CFrame = PosMonMasteryFruit
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
							end
						elseif v.Name == Monster then
							if (v.HumanoidRootPart.Position - PosMonMasteryFruit.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
								v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
								v.Humanoid:ChangeState(14)
								v.HumanoidRootPart.CanCollide = false
								v.Head.CanCollide = false
								v.HumanoidRootPart.CFrame = PosMonMasteryFruit
								if v.Humanoid:FindFirstChild("Animator") then
									v.Humanoid.Animator:Destroy()
								end
								sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
							end
						end
					end
					if _G.AutoFarmBone and BringBones then
						if (v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy") and (v.HumanoidRootPart.Position - PosMonBone.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.Humanoid:ChangeState(14)
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							v.HumanoidRootPart.CFrame = PosMonBone
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
						end
					end
					if _G.AutoFarmCandy and StartCandyMagnet then
						if (v.Name == "Ice Cream Chef" or v.Name == "Ice Cream Commander") and (v.HumanoidRootPart.Position - CandyMon.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.Humanoid:ChangeState(14)
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							v.HumanoidRootPart.CFrame = CandyMon
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
						end
					end
					if _G.AutoFarmDought and BringDought then
						if (v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= _G.BringMode and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
							v.Humanoid:ChangeState(14)
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while true do
		wait()
		if setscriptable then
			setscriptable(game.Players.LocalPlayer, "SimulationRadius", true)
		end
		if sethiddenproperty then
			sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
		end
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if MakoriGayMag and _G.BringMonster then
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PoSgay
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if Min_XT_Is_Kak and _G.BringMonster then
				for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
					if not string.find(v.Name, "Boss") and (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
						if InMyNetWork(v.HumanoidRootPart) then
							v.HumanoidRootPart.CFrame = PosNarathiwat
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
							v.HumanoidRootPart.Transparency = 1
							v.HumanoidRootPart.CanCollide = false
							v.Head.CanCollide = false
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
						end
					end
				end
			end
		end)
	end
end)
function InMyNetWork(object)
	if isnetworkowner then
		return isnetworkowner(object)
	else
		if (object.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
			return true
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--Main
local Main = Tabs.Main:AddSection("เมนูหลัก")
local Toggle = Tabs.Main:AddToggle("Farm Level", {
	Title = "Farm Level",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.AutoFarmLevel = Value
		StopTween(_G.AutoFarmLevel)
	end
})
spawn(function()
	while task.wait() do
		if _G.AutoFarmLevel then
			pcall(function()
				local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
				if not string.find(QuestTitle, NameMonster) then
					BringFarmLevel = false
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
				end
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					BringFarmLevel = false
					CheckLevel()
					if BypassTP then
						if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude > 1500 then
							BTP(CFrameQuest)
						elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude < 1500 then
							Tween(CFrameQuest)
						end
					else
						Tween(CFrameQuest)
					end
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LvQuest)
					end
				elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					CheckLevel()
					if game:GetService("Workspace").Enemies:FindFirstChild(Monster) then
						for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
								if v.Name == Monster then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMonster) then
										repeat
											task.wait()
											Equip_Weapon_Farm_All(_G.SelectWeapon)
											AutoHaki()
											PosMon = v.HumanoidRootPart.CFrame
											Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 3))
											v.HumanoidRootPart.CanCollide = false
											v.Humanoid.WalkSpeed = 0
											v.Head.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
											BringFarmLevel = true
										until not _G.AutoFarmLevel or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
									else
										BringFarmLevel = false
										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
									end
								end
							end
						end
					else
						Tween(CFrameMonster * randomPos)
						UnEquip_Weapon_Farm_All(_G.SelectWeapon)
						BringFarmLevel = false
						if game:GetService("ReplicatedStorage"):FindFirstChild(Monster) then
							Tween(game:GetService("ReplicatedStorage"):FindFirstChild(Monster).HumanoidRootPart.CFrame * randomPos)
						end
					end
				end
			end)
		end
	end
end)
local Toggle = Tabs.Main:AddToggle("Farm Nearest", {
	Title = "Farm Nearest",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.AutoNear = Value
		StopTween(_G.AutoNear)
	end
})
spawn(function()
	while wait() do
		if _G.AutoNear then
			pcall(function()
				for i, v in pairs (game.Workspace.Enemies:GetChildren()) do
					if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
						if v.Name then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000 then
								repeat
									wait()
									Equip_Weapon_Farm_All(_G.SelectWeapon)
									AutoHaki()
									PosMon = v.HumanoidRootPart.CFrame
									TP2(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 3))
									v.HumanoidRootPart.CanCollide = false
									v.Humanoid.WalkSpeed = 0
									v.Head.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
									BringFarmLevel = true
								until not _G.AutoNear or not v.Parent or v.Humanoid.Health <= 0 or not game.Workspace.Enemies:FindFirstChild(v.Name)
								BringFarmLevel = false
							end
						end
					end
				end
			end)
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------
--Settings
Weapon = {
	"Melee",
	"Sword",
	"Gun",
    "Devil Fruit"
}
local SelectedWeapon = Tabs.Settings:AddDropdown("SelectedWeapon", {
    Title = "Select Weapon",
    Description = "",
    Values = Weapon,
    Multi = false,
    Default = 1,
})

SelectedWeapon:SetValue("Melee")
SelectedWeapon:OnChanged(function(Value)
    Weapon = Value
end)
local Toggle = Tabs.Settings:AddToggle("Fast Attack", {
	Title = "Fast Attack",
	Description = "",
	Default = true,
	Callback = function()
	end
})
      
local module = {
	NextAttack = 0,
	Distance = 55,
	attackMobs = true,
	attackPlayers = true
}

local Player = game:GetService("Players")

function module:GetBladeHits()
	local BladeHits = {}
	for _, Enemy in game:GetService("Workspace").Enemies:GetChildren() do
		if Enemy:FindFirstChild("HumanoidRootPart") then
			table.insert(BladeHits, Enemy.HumanoidRootPart)
		end
	end
	return BladeHits
end

function module:attack()
	local BladeHits = self:GetBladeHits()
	game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RE/RegisterAttack"):FireServer(0)
	for _, Hit in BladeHits do
		game:GetService("ReplicatedStorage").Modules.Net:WaitForChild("RE/RegisterHit"):FireServer(Hit)
	end
end

spawn(function()
	while wait(0.05) do
		module:attack()
	end
end)

local HookRemotes = (function()
	for _, remote in ipairs(game:GetDescendants()) do
		if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
			local oldFireServer = remote.FireServer
			setreadonly(getrawmetatable(remote), false)
			local meta = getrawmetatable(remote)
			local oldIndex = meta.__index
			meta.__index = function(self, key)
				if key == "FireServer" then
					return function(_, ...)
						local args = {
							...
						}
						if math.random(1, 10) > 8 then
							task.wait(math.random(1, 5) / 1000)
						end
						return oldFireServer(self, unpack(args))
					end
				end
				return oldIndex(self, key)
			end
			setreadonly(meta, true)
		end
	end
end)
local Toggle = Tabs.Settings:AddToggle("Safe Farm", {
	Title = "Safe Farm",
	Description = "(Don't turn off!)",
	Default = true,
	Callback = function(Value)
		_G.SafeFarm = Value
	end
})
      
assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
	local args = {
		...
	}
	if tostring(args[1]) == "TeleportDetect" then
		return
	elseif tostring(args[1]) == "CHECKER_1" then
		return
	elseif tostring(args[1]) == "CHECKER" then
		return
	elseif tostring(args[1]) == "GUI_CHECK" then
		return
	elseif tostring(args[1]) == "OneMoreTime" then
		return
	elseif tostring(args[1]) == "checkingSPEED" then
		return
	elseif tostring(args[1]) == "BANREMOTE" then
		return
	elseif tostring(args[1]) == "PERMAIDBAN" then
		return
	elseif tostring(args[1]) == "KICKREMOTE" then
		return
	elseif tostring(args[1]) == "BR_KICKPC" then
		return
	elseif tostring(args[1]) == "BR_KICKMOBILE" then
		return
	end
	return old(self, ...)
end)
function CheckAntiCheatBypass()
	for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
		if v:IsA("LocalScript") then
			if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
				v:Destroy()
			end
		end
	end
	for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
		if v:IsA("LocalScript") then
			if v.Name == "RobloxMotor6DBugFix" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
				v:Destroy()
			end
		end
	end
end

local function bypassAntiExploit()
	for _, instance in ipairs(filtergc()) do
		if instance:IsA("AntiExploitSystem") then
			instance:Destroy()
		end
	end
end
spawn(function()
	while wait() do
		if _G.SafeFarm then
			pcall(function()
				CheckAntiCheatBypass()
				bypassAntiExploit()
			end)
		end
	end
end)
function intiAppleHub()
	_G.antiscan = true
	getgenv().A = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).wrapAttackAnimationAsync
	getgenv().B = require(game.Players.LocalPlayer.PlayerScripts.CombatFramework.Particle).play
	_G.setfflag = true
end
spawn(function()
	while wait() do
		if _G.setfflag then
			setfflag("AbuseReportScreenshot", "False")
			setfflag("AbuseReportScreenshotPercentage", "0")
		end
	end
end)
local Toggle = Tabs.Settings:AddToggle("Auto Haki", {
	Title = "Auto Haki",
	Description = "",
	Default = true,
	Callback = function(Value)
		_G.AUTOHAKI = Value
	end
})
spawn(function()
	while task.wait() do
		if _G.AUTOHAKI then
			if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
				local args = {
					[1] = "Buso"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end
		end
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------
--Item&Quest
if Second_Sea then
local Mastery = Tabs.Raid:AddSection("Auto Law Raid")
local ToggleLaw = Tabs.Raid:AddToggle("ToggleLaw", {Title = "Auto Buy Chip And Kill Law",Description = "", Default = false })

ToggleLaw:OnChanged(function(Value)
    Auto_Law = Value
end)
Options.ToggleLaw:SetValue(false)
task.spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law then
                if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") and not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") and not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    wait(0.3)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Microchip","2")
                end
            end
        end
    end)
end)
task.spawn(function()
    pcall(function()
        while wait(0.4) do
            if Auto_Law then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and not game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") then
                        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                    end
                end
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Order" then
                                repeat wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v.HumanoidRootPart.CFrame * CFrame.new(posX,posY,posZ))
                                    v.HumanoidRootPart.CanCollide = false
                                    v.HumanoidRootPart.Size = Vector3.new(120, 120, 120)
                                    --Click
                                until not v.Parent or v.Humanoid.Health <= 0 or Auto_Law == false
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875))
                    end
                end
            end
        end
    end)
end)
end
if Third_Sea then
local DojoQuest = Tabs.Item:AddSection("Dojo Quest")
local ToggleAutoDojoQuest = Tabs.Item:AddToggle("ToggleAutoDojoQuest", {Title = "Auto Dojo Quest",Description = "", Default = false })
local DojoQuest = Tabs.Item:AddSection("Dragon Hunter")
local ToggleAutoFarmFireEmber = Tabs.Item:AddToggle("ToggleAutoFarmFireEmber", {Title = "Auto Farm Fire Ember",Description = "", Default = false })
local ToggleAutoFireEmber = Tabs.Item:AddToggle("ToggleAutoFireEmber", {Title = "Auto Collect Fire Ember",Description = "", Default = false })
ToggleAutoFireEmber:OnChanged(function(Value)
   _G.AutoFireEmber = Value
end)
Options.ToggleAutoFireEmber:SetValue(false)
spawn(function()
while wait() do
  if _G.AutoFireEmber then
      pcall(function()
          if game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer() then
              print("Fire Ember")
          end
      end)
end
end
end)
Tabs.Item:AddButton({
    Title = "Craft Dragon Heart",
    Description = "",
    Callback = function()            
        local args = {
            "CraftItem",
            "Check",
            "Dragonheart"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end
})
Tabs.Item:AddButton({
    Title = "Dragon Storm",
    Description = "",
    Callback = function()            
        local args = {
            "CraftItem",
            "Check",
            "Dragonstorm"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end
})
Tabs.Item:AddButton({
    Title = "Volcanic Magnet",
    Description = "",
    Callback = function()            
        local args = {
            "CraftItem",
            "Check",
            "Volcanic Magnet"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
end
})
end
----------------------------------------------------------------------------------------------------------------------------------------------
--sea event
if Third_Sea then
local RoughSea = Tabs.Sea:AddSection("Prehistoric Island")
local StatusPrehistoric  = Tabs.Sea:AddParagraph({
    Title = "Prehistoric Island Status",
    Content = ""
})
function UpdatePrehistoric()
    if game.Workspace._WorldOrigin.Locations:FindFirstChild('PrehistoricIsland') then
        StatusPrehistoric:SetDesc("Prehistoric Island : ✅")
    else
        StatusPrehistoric:SetDesc("Prehistoric Island : ❌")
     end
end
spawn(function()
    pcall(function()
        while wait() do
            UpdatePrehistoric()
        end
    end)
end)
local Toggle = Tabs.Sea:AddToggle("Tween to Prehistoric Island (Combo)", {
	Title = "Tween to Prehistoric Island",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.TweenToPrehistoric = Value
		StopTween(_G.TweenToPrehistoric)
	end
})
spawn(function()
	local PrehistoricIsland
	while not PrehistoricIsland do
		PrehistoricIsland = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
		wait(1)
	end
	while wait() do
		if _G.TweenToPrehistoric then
			local island = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
			if island then
				local core = island:FindFirstChild("Core")
				local relic = core and core:FindFirstChild("PrehistoricRelic")
				local skull = relic and relic:FindFirstChild("Skull")
				if skull then
					Tween2(CFrame.new(skull.Position))
					_G.TweenToPrehistoric = false
				end
			end
		end
	end
end)
local Toggle = Tabs.Sea:AddToggle("Kill Aura Golem (Combo)", {
	Title = "Kill Aura Golem (Combo)",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.KillAura_Golem = Value
		StopTween(_G.KillAura_Golem)
	end
})
spawn(function()
	while wait() do
		if _G.KillAura_Golem then
			pcall(function()
				for i, v in pairs(game.Workspace.Enemies:GetDescendants()) do
					if (v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.Humanoid.Health > 0)) then
						repeat
							task.wait(0.1)
							sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
							v.Humanoid.Health = 0;
							v.HumanoidRootPart.CanCollide = false
						until not _G.KillAura_Golem or _G.AutoCollectBone and not v.Parent or (v.Humanoid.Health <= 0)
					end
				end
			end)
		end
	end
end)
local Toggle = Tabs.Sea:AddToggle("Auto Collect Bones (Combo)", {
	Title = "Auto Collect Bones",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.AutoCollectBone = Value
		StopTween(_G.AutoCollectBone)
	end
})
spawn(function()
	while wait() do
		if _G.AutoCollectBone then
			pcall(function()
				if game:GetService("Workspace"):FindFirstChild("DinoBone") then
					Tween2(game:GetService("Workspace"):WaitForChild("DinoBone"):FindFirstChild("Part").CFrame)
					print("Collecting Dino Bones")
				end
			end)
		end
	end
end)
Tabs.Sea:AddButton({
	Title = "Craft Volcanic Magnet",
	Description = "",
	Callback = function()
		local args = {
			[1] = "CraftItem",
			[2] = "Craft",
			[3] = "Volcanic Magnet"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end
})
Tabs.Sea:AddButton({
    Title = "Craft TRex Skull",
    Description = "คราฟหัวกระโหลกทีเร็ก",
    Callback = function()
        local args = {
            "CraftItem",
            "Check",
            "TRexSkull"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
Tabs.Sea:AddButton({
    Title = "Craft Dino Hood",
    Description = "คราฟหมวกไดโนเสาร์",
    Callback = function()
        local args = {
            "CraftItem",
            "Check",
            "DinoHood"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
})
local Seaevent = Tabs.Sea:AddSection("Sea Event Farm")
local SelectBoat = {
	"Dinghy",
	"PirateSloop",
	"PirateBrigade",
	"PirateGrandBrigade",
	"MarineSloop",
	"MarineBrigade",
	"MarineGrandBrigade"
}
local KitsuneIsland = Tabs.Sea:AddSection("Kitsune Island")
local ToggleEspKitsune = Tabs.Sea:AddToggle("ToggleEspKitsune", {Title = "Esp Kitsune Event Island",Description = "", Default = false })
ToggleEspKitsune:OnChanged(function(Value)
  KitsuneIslandEsp = Value
  while KitsuneIslandEsp do wait()
      UpdateIslandKisuneESP() 
  end
end)
Options.ToggleEspKitsune:SetValue(false)

function UpdateIslandKisuneESP() 
  for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
      pcall(function()
          if KitsuneIslandEsp then 
              if v.Name == "Kitsune Island" then
                  if not v:FindFirstChild('NameEsp') then
                      local bill = Instance.new('BillboardGui',v)
                      bill.Name = 'NameEsp'
                      bill.ExtentsOffset = Vector3.new(0, 1, 0)
                      bill.Size = UDim2.new(1,200,1,30)
                      bill.Adornee = v
                      bill.AlwaysOnTop = true
                      local name = Instance.new('TextLabel',bill)
                      name.Font = "Code"
                      name.FontSize = "Size14"
                      name.TextWrapped = true
                      name.Size = UDim2.new(1,0,1,0)
                      name.TextYAlignment = 'Top'
                      name.BackgroundTransparency = 1
                      name.TextStrokeTransparency = 0.5
                      name.TextColor3 = Color3.fromRGB(80, 245, 245)
                  else
                      v['NameEsp'].TextLabel.Text = (v.Name ..'   \n'.. round((game:GetService('Players').LocalPlayer.Character.Head.Position - v.Position).Magnitude/3) ..' M')
                  end
              end
          else
              if v:FindFirstChild('NameEsp') then
                  v:FindFirstChild('NameEsp'):Destroy()
              end
          end
      end)
  end
end

local ToggleTPKitsune = Tabs.Sea:AddToggle("ToggleTPKitsune", {Title = "Tween To Kitsune Island",Description = "", Default = false })
ToggleTPKitsune:OnChanged(function(Value)
  _G.TweenToKitsune = Value
end)
Options.ToggleTPKitsune:SetValue(false)
spawn(function()
  local kitsuneIsland
  while not kitsuneIsland do
      kitsuneIsland = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
      wait(1)
  end
  while wait() do
      if _G.TweenToKitsune then
          local shrineActive = kitsuneIsland:FindFirstChild("ShrineActive")
          if shrineActive then
              for _, v in pairs(shrineActive:GetDescendants()) do
                  if v:IsA("BasePart") and v.Name:find("NeonShrinePart") then
                      TP2(v.CFrame)
                  end
              end
          end
      end
  end
end)


local ToggleCollectAzure = Tabs.Sea:AddToggle("ToggleCollectAzure", {Title = "Collect Azure Ambers",Description = "", Default = false })
ToggleCollectAzure:OnChanged(function(Value)
   _G.CollectAzure = Value
end)
Options.ToggleCollectAzure:SetValue(false)
spawn(function()
while wait() do
  if _G.CollectAzure then
      pcall(function()
          if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
              TP2(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
              print("Azure")
          end
      end)
  end
end
end)
Tabs.Sea:AddButton({
  Title = "Trade Azure",
  Description = "",
  Callback = function()            
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
end
})
local Liviathan = Tabs.Sea:AddSection("Liviathan")
function AutoDriveBoat(destination)
    local boat = checkboat()
    if boat then
        local seat = boat:FindFirstChild("VehicleSeat")
        if seat then
            local distance = (seat.Position - destination.Position).Magnitude
            if distance > 5 then
                TweenObject(destination, seat, 300)
            end
        end
    end
end
local MirageIsland = Tabs.Sea:AddSection("Mirage Island")		
Tabs.Sea:AddButton({
    Title = "Auto Tween to Mirage Island",
    Description = "",
    Callback = function()
        TweenMirage()
    end
})
function TweenMirage()
    repeat
        wait()
    until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
    if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
        AllNPCS = getnilinstances()
        for r, v in pairs(game:GetService("Workspace").NPCs:GetChildren()) do
            table.insert(AllNPCS, v)
        end
        for r, v in pairs(AllNPCS) do
            if v.Name == "Advanced Fruit Dealer" then
                TP2(v.HumanoidRootPart.CFrame)
            end
        end
    end
end
Tabs.Sea:AddButton({
    Title = "Tween to Highest Point",
    Description = "",
    Callback = function()
        TwenetoHighestPoint()
    end
})

function TwenetoHighestPoint()
    HighestPoint = getHighestPoint()
    if HighestPoint then
        if game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
	TP2(game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island").CFrame)
end
    end
end
function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for r, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
end

local ToggleTweenGear = Tabs.Sea:AddToggle("ToggleTweenGear", {Title = "Tween To Gear",Description = "", Default = false })
ToggleTweenGear:OnChanged(function(Value)
_G.TweenToGear = Value
end) 
Options.ToggleTweenGear:SetValue(false)

spawn(function()
pcall(function()
    while wait() do
        if _G.TweenToGear then
            if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do 
                    if v:IsA("MeshPart")then 
                        if v.Material ==  Enum.Material.Neon then  
                            TP2(v.CFrame)
                        end
                    end
                end
            end
        end
    end
end)
end)
local Togglelockmoon = Tabs.Sea:AddToggle("Togglelockmoon", {Title = "Lock Moon and Use Race Skill",Description = "", Default = false })
Togglelockmoon:OnChanged(function(Value)
    _G.AutoLockMoon = Value
end) 
Options.Togglelockmoon:SetValue(false)

spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                local moonDir = game.Lighting:GetMoonDirection()
                local lookAtPos = game.Workspace.CurrentCamera.CFrame.p + moonDir * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, lookAtPos)
            end
        end)
    end
end)


spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"T",false,game)
                wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"T",false,game)
            end
        end)
    end
end)
local Settings = Tabs.Sea:AddSection("Settings")
local SetSpeedBoatSlider = Tabs.Sea:AddSlider("SliderSpeedBoat", {
	Title = "Set Speed (boat)",
	Description = "",
	Default = 300,
	Min = 0,
	Max = 1000,
	Rounding = 1,
	Callback = function(value)
		SetSpeedBoat = value
	end
})

SetSpeedBoatSlider:OnChanged(function(value)
	SetSpeedBoat = value
end)

SetSpeedBoatSlider:SetValue(300)

local SpeedBoatToggle = Tabs.Sea:AddToggle("SpeedBoat_Toggle", {Title = "Auto Speed Boat",Description = "", Default = true })
Options.SpeedBoat_Toggle:SetValue(false)

SpeedBoatToggle:OnChanged(function(value)
	_G.SpeedBoat = value
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if _G.SpeedBoat then
        for i, v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
            if game:GetService("Players").LocalPlayer.Character.Humanoid.Sit then
                v:FindFirstChild("VehicleSeat").MaxSpeed = SetSpeedBoat
            end
        end
    end
end)
local ToggleNocliprock = Tabs.Sea:AddToggle("ToggleNocliprock", {
    Title = "ขับเรือทะลุหิน",
    Description = "Auto No Clip Ship",
    Default = false })
ToggleNocliprock:OnChanged(function(Value)
    _G.Nocliprock = Value
end)
Options.ToggleNocliprock:SetValue(false)
spawn(function()
    while wait() do
        if _G.Nocliprock then
            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true then
                        v.CanCollide = false
                    end
                end
            elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                for _, v in pairs(game.Workspace.Boats:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == false then
                        v.CanCollide = true
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == false then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
end)
local ToggleAutoW = Tabs.Sea:AddToggle("ToggleAutoW", {Title = "Auto Press W",Description = "", Default = false })
ToggleAutoW:OnChanged(function(Value)
    _G.AutoW = Value
    end)
 Options.ToggleAutoW:SetValue(false)
 spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoW then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"W",false,game)
            end
        end)
    end
    end)
end
local ShipWring = Tabs.Sea:AddSection("Ship Wring")
local ToggleWoodPlank = Tabs.Sea:AddToggle("ToggleWoodPlank", {Title = "Auto Farm Wood",Description = "", Default = false })
ToggleWoodPlank:OnChanged(function(Value)
    _G.WoodPlank = Value
    end)
Options.ToggleWoodPlank:SetValue(false)
spawn(function()
    while wait() do
        if _G.WoodPlank then
        TP2(CFrame.new(-16484.3125, 527.77948, 476.465302, 0.314159244, -2.17963532e-08, 0.949370325, -1.05681153e-08, 1, 2.64558757e-08, -0.949370325, -1.83444122e-08, 0.314159244) * CFrame.new(0,0,10))
        wait(1)
        TP2(CFrame.new(-16597.0312, 527.77948, 482.512787, 0.203417599, 1.26229915e-08, 0.979092062, 1.91620697e-09, 1, -1.32906619e-08, -0.979092062, 4.57969751e-09, 0.203417599) * CFrame.new(0,0,10))
        wait(1)
        TP2(CFrame.new(-16690.9844, 527.77948, 339.35199, -0.0264198873, 3.29540164e-08, 0.999650955, 9.8076347e-09, 1, -3.27063141e-08, -0.999650955, 8.94011354e-09, -0.0264198873) * CFrame.new(0,0,10))
        wait(1)
        TP2(CFrame.new(-16425.9297, 527.77948, 319.027832, 0.369603723, -9.8490041e-08, 0.929189503, 7.75970719e-08, 1, 7.51298614e-08, -0.929189503, 4.43341115e-08, 0.369603723) * CFrame.new(0,0,10))
        wait(1)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.WoodPlank then
                repeat wait()
                    for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Melee" then
                            if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                EquipWeapon(v.Name)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            if v.ToolTip == "Sword" then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                    EquipWeapon(v.Name)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        for i ,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                            if v.ToolTip == "Blox Fruit" then
                                if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                                    EquipWeapon(v.Name)
                                end
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true,"F",false,game)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false,"F",false,game)
                        wait(0.2)
                    until not _G.WoodPlank
                end
            end
        end)
---------------------------------------------------------------------------------------------------------------------------------------------
--player
local Playerslist = {}
for i,v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist,v.Name)
end

local SelectedPly = Tabs.Player:AddDropdown("SelectedPly", {
    Title = "Select Player",
    Description = "",
    Values = Playerslist,
    Multi = false,
    Default = 1,
})

SelectedPly:SetValue("nil")
SelectedPly:OnChanged(function(Value)
    _G.SelectPly = Value
end)


Tabs.Player:AddButton({
    Title = "Refresh Player",
    Description = "",
    Callback = function()
        table.clear(Playerslist)
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
            table.insert(Playerslist,v.Name)
        end
    end
})

local ToggleTeleport = Tabs.Player:AddToggle("ToggleTeleport", {Title = "Teleport To Player", Description = "",Default = false })
ToggleTeleport:OnChanged(function(Value)
    _G.TeleportPly = Value
    if Value == false then
        wait()
        TP2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
Options.ToggleTeleport:SetValue(false)

spawn(function()
	while wait() do
		if _G.TeleportPly then
			pcall(function()
				if game.Players:FindFirstChild(_G.SelectPly) then
					TP2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
				end
			end)
		end
	end
end)




local ToggleQuanSat = Tabs.Player:AddToggle("ToggleQuanSat", {Title = "Spectate Player",Description = "", Default = false })
ToggleQuanSat:OnChanged(function(Value)
    _G.Spectate_Player = Value
end)
Options.ToggleQuanSat:SetValue(false)
spawn(function()
    while wait() do
        if _G.Spectate_Player then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    game.Workspace.Camera.CameraSubject = game.Players:FindFirstChild(_G.SelectPly).Character.Humanoid
                end
            end)
        else
            game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end
    end
end)
local localPlayer = Tabs.Player:AddSection("Local Player")
local Togglewalkwater = Tabs.Player:AddToggle("Togglewalkwater", {Title = "Walk On Water",Description = "เดินบนน้ำได้", Default = true })
Togglewalkwater:OnChanged(function(Value)
    _G.WalkonWater = Value
end)
Options.Togglewalkwater:SetValue(false)
spawn(function()
    while task.wait() do
      pcall(function()
        if _G.WalkonWater then
          game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,112,1000)
        else
          game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000,80,1000)
        end
      end)
    end
  end)
  local Toggle = Tabs.Player:AddToggle("Auto Use race V4", {
	Title = "Auto Use Race V4",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.AutoV4 = Value
	end
})
spawn(function()
	while task.wait() do
		if _G.AutoV4 then
			pcall(function()
				if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") 
                    and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
                    and game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and not game.Players.LocalPlayer.Character.RaceTransformed.Value   then
					local args = {
						[1] = true
					}
					game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))
				end
			end)
		end
	end
end)

Tabs.Player:AddButton({
	Title = "Redeem All Code",
	Description = "Redeem All code x2 exp",
	Callback = function()
		UseCode()
	end
})

function UseCode(Text)
	game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end
UseCode("Sub2Fer999")
UseCode("Enyu_is_Pro")
UseCode("Magicbus")
UseCode("JCWK")
UseCode("Starcodeheo")
UseCode("Bluxxy")
UseCode("THEGREATACE")
UseCode("SUB2GAMERROBOT_EXP1")
UseCode("StrawHatMaine")
UseCode("Sub2OfficialNoobie")
UseCode("SUB2NOOBMASTER123")
UseCode("Sub2Daigrock")
UseCode("Axiore")
UseCode("TantaiGaming")
UseCode("STRAWHATMAINE")
local Toggle = Tabs.Player:AddToggle("Auto Click️", {
	Title = "Auto Click",
	Description = "",
	Default = true,
	Callback = function(Value)
		_G.click = Value
	end
})
spawn(function()
	game:GetService("RunService").RenderStepped:Connect(function()
		if _G.click then
			pcall(function()
				game:GetService'VirtualUser':CaptureController()
				game:GetService'VirtualUser':Button1Down(Vector2.new(0, 1, 0, 1))
			end)
		end
	end)
end)
local Toggle = Tabs.Player:AddToggle("Auto Rejoin", {
	Title = "Auto Rejoin",
	Description = "",
	Default = true,
	Callback = function(Value)
		_G.AutoRejoin = Value
	end
})
spawn(function()
	while wait() do
		if _G.AutoRejoin then
			getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
				if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
					game:GetService("TeleportService"):Teleport(game.PlaceId)
				end
			end)
		end
	end
end)
local ToggleCtrlClickTP = Tabs.Player:AddToggle("ToggleCtrlClickTP", {Title = "Ctrl Click TP", Description = "",Default = false })
ToggleCtrlClickTP:OnChanged(function(Value)
    _G.CtrlClickTP = Value
end)
Options.ToggleCtrlClickTP:SetValue(false)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(function()
	if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
		return
	end
	if not Mouse.Target then
		return
	end
	if _G.CtrlClickTP then
		Plr.Character:MoveTo(Mouse.Hit.p)
	end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------
--Teleport
local Main = Tabs.TP:AddSection("Join World")
Tabs.TP:AddButton({
    Title = "วาป โลก1",
    Description = "Teleport To Frist Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
Tabs.TP:AddButton({
    Title = "วาป โลก2",
    Description = "Teleport To Second Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
Tabs.TP:AddButton({
    Title = "วาป โลก3",
    Description = "Teleport To Third Sea",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
local Main = Tabs.TP:AddSection("Teleport Island")
if First_Sea then
    local SelectIsland = Tabs.TP:AddDropdown("SelectIsland", {
        Title = "Select Island",
        Values = {
            "WindMill",
            "Marine",
            "Middle Town",
            "Jungle",
            "Pirate Village",
            "Desert",
            "Snow Island",
            "MarineFord",
            "Colosseum",
            "Sky Island 1",
            "Sky Island 2",
            "Sky Island 3",
            "Prison",
            "Magma Village",
            "Under Water Island",
            "Fountain City",
            "Shank Room",
            "Mob Island",
        },
        Multi = false,
        Default = _G.SelectIsland,
    })
    SelectIsland:OnChanged(function(Value)
        _G.SelectIsland = Value 
    end)
end

if Second_Sea then
    local SelectIsland = Tabs.TP:AddDropdown("SelectIsland", {
        Title = "Select Island",
        Values = {
            "The Cafe",
            "First Spot",
            "Dark Area",
            "Flamingo Mansion",
            "Flamingo Room",
            "Green Zone",
            "Factory",
            "Colosseum",
            "Zombie Island",
            "Two Snow Mountain",
            "Punk Hazard",
            "Cursed Ship",
            "Ice Castle",
            "Forgotten Island",
            "Ussop Island",
            "Mini Sky Island"
        },
        Multi = false,
        Default = _G.SelectIsland,
    })
    SelectIsland:OnChanged(function(Value)
        _G.SelectIsland = Value 
    end)
end

if Third_Sea then
    local SelectIsland = Tabs.TP:AddDropdown("SelectIsland", {
        Title = "Select Island",
        Values = {
            "Mansion",
            "Port Town",
            "Great Tree",
            "Top Great Tree",
            "Castle On The Sea", 
            "Hydra Island",
            "Floating Turtle",
            "Haunted Castle",
            "Ice Cream Island",
            "Peanut Island",
            "Cake Island",
            "Cocoa Island",
            "Candy Island",
            "Tiki Outpost"
        },
        Multi = false,
        Default = _G.SelectIsland,
    })
    SelectIsland:OnChanged(function(Value)
        _G.SelectIsland = Value 
    end)
end
local Toggle = Tabs.TP:AddToggle("Auto Teleport To Select Island", {
    Title = "เทเลพอร์ตไปยังเกราะ [Selection]", 
    Description = "Teleport To Select Island", 
    Default = false,
    Callback = function(Value)
  _G.TeleportIsland = Value
    if _G.TeleportIsland == true then
        repeat wait()
            if _G.SelectIsland == "WindMill" then
                TP2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
            elseif _G.SelectIsland == "Marine" then
                TP2(CFrame.new(-2566.4296875, 6.8556680679321, 2045.2561035156))
            elseif _G.SelectIsland == "Middle Town" then
                TP2(CFrame.new(-690.33081054688, 15.09425163269, 1582.2380371094))
            elseif _G.SelectIsland == "Jungle" then
                TP2(CFrame.new(-1612.7957763672, 36.852081298828, 149.12843322754))
            elseif _G.SelectIsland == "Pirate Village" then
                TP2(CFrame.new(-1181.3093261719, 4.7514905929565, 3803.5456542969))
            elseif _G.SelectIsland == "Desert" then
                TP2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
            elseif _G.SelectIsland == "Snow Island" then
                TP2(CFrame.new(1347.8067626953, 104.66806030273, -1319.7370605469))
            elseif _G.SelectIsland == "MarineFord" then
                TP2(CFrame.new(-4914.8212890625, 50.963626861572, 4281.0278320313))
            elseif _G.SelectIsland == "Colosseum" then
                TP2( CFrame.new(-1427.6203613281, 7.2881078720093, -2792.7722167969))
            elseif _G.SelectIsland == "Sky Island 1" then
                TP2(CFrame.new(-4869.1025390625, 733.46051025391, -2667.0180664063))
            elseif _G.SelectIsland == "Sky Island 2" then  
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
            elseif _G.SelectIsland == "Sky Island 3" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
            elseif _G.SelectIsland == "Prison" then
                TP2( CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
            elseif _G.SelectIsland == "Magma Village" then
                TP2(CFrame.new(-5247.7163085938, 12.883934020996, 8504.96875))
            elseif _G.SelectIsland == "Under Water Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            elseif _G.SelectIsland == "Fountain City" then
                TP2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
            elseif _G.SelectIsland == "Shank Room" then
                TP2(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
            elseif _G.SelectIsland == "Mob Island" then
                TP2(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
            elseif _G.SelectIsland == "The Cafe" then
                TP2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
            elseif _G.SelectIsland == "Frist Spot" then
                TP2(CFrame.new(-11.311455726624, 29.276733398438, 2771.5224609375))
            elseif _G.SelectIsland == "Dark Area" then
                TP2(CFrame.new(3780.0302734375, 22.652164459229, -3498.5859375))
            elseif _G.SelectIsland == "Flamingo Mansion" then
                TP2(CFrame.new(-483.73370361328, 332.0383605957, 595.32708740234))
            elseif _G.SelectIsland == "Flamingo Room" then
                TP2(CFrame.new(2284.4140625, 15.152037620544, 875.72534179688))
            elseif _G.SelectIsland == "Green Zone" then
                TP2( CFrame.new(-2448.5300292969, 73.016105651855, -3210.6306152344))
            elseif _G.SelectIsland == "Factory" then
                TP2(CFrame.new(424.12698364258, 211.16171264648, -427.54049682617))
            elseif _G.SelectIsland == "Colossuim" then
                TP2( CFrame.new(-1503.6224365234, 219.7956237793, 1369.3101806641))
            elseif _G.SelectIsland == "Zombie Island" then
                TP2(CFrame.new(-5622.033203125, 492.19604492188, -781.78552246094))
            elseif _G.SelectIsland == "Two Snow Mountain" then
                TP2(CFrame.new(753.14288330078, 408.23559570313, -5274.6147460938))
            elseif _G.SelectIsland == "Punk Hazard" then
                TP2(CFrame.new(-6127.654296875, 15.951762199402, -5040.2861328125))
            elseif _G.SelectIsland == "Cursed Ship" then
                TP2(CFrame.new(923.40197753906, 125.05712890625, 32885.875))
            elseif _G.SelectIsland == "Ice Castle" then
                TP2(CFrame.new(6148.4116210938, 294.38687133789, -6741.1166992188))
            elseif _G.SelectIsland == "Forgotten Island" then
                TP2(CFrame.new(-3032.7641601563, 317.89672851563, -10075.373046875))
            elseif _G.SelectIsland == "Ussop Island" then
                TP2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
            elseif _G.SelectIsland == "Great Tree" then
                TP2(CFrame.new(2398.93774, 73.9011002, -6803.95312, -0.42661652, 5.95282934e-08, 0.904432595, 5.73617278e-08, 1, -3.8761133e-08, -0.904432595, 3.53436782e-08, -0.42661652))
            elseif _G.SelectIsland == "Top Great Tree" then
                TP2(CFrame.new(3022.94458, 2280.69995, -7326.51172, -0.234736398, -3.26546647e-08, -0.972059071, -2.9643358e-08, 1, -2.6434904e-08, 0.972059071, 2.26098607e-08, -0.234736398))
            elseif _G.SelectIsland == "Castle On The Sea" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5073.83105, 314.562012, -3152.51782, 0.374410987, 4.3815902e-09, -0.927262843, 1.28442235e-08, 1, 9.91154625e-09, 0.927262843, -1.56209641e-08, 0.374410987))
            elseif _G.SelectIsland == "Port Town" then
                TP2(CFrame.new(-333.143066, 20.6576023, 5520.13135, 0.975830257, -1.00850652e-08, -0.218529835, 5.63163249e-09, 1, -2.10019273e-08, 0.218529835, 1.9263636e-08, 0.975830257))
            elseif _G.SelectIsland == "Hydra Island" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(5661.53027, 1013.09094, -334.961914, -0.824463427, 2.52275552e-08, -0.565915227, 1.73341108e-09, 1, 4.2052978e-08, 0.565915227, 3.36901778e-08, -0.824463427))
            elseif _G.SelectIsland == "Floating Turtle" then
                TP2(CFrame.new(-13274.528320313, 531.82073974609, -7579.22265625))
            elseif _G.SelectIsland == "Mansion" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
            elseif _G.SelectIsland == "Haunted Castle" then
                TP2(CFrame.new(-9515.3720703125, 164.00624084473, 5786.0610351562))
            elseif _G.SelectIsland == "Ice Cream Island" then
                TP2(CFrame.new(-902.56817626953, 79.93204498291, -10988.84765625))
            elseif _G.SelectIsland == "Peanut Island" then
                TP2(CFrame.new(-2062.7475585938, 50.473892211914, -10232.568359375))
            elseif _G.SelectIsland == "Cake Island" then
                TP2(CFrame.new(-1884.7747802734375, 19.327526092529297, -11666.8974609375))
            elseif _G.SelectIsland == "Cocoa Island" then
                TP2(CFrame.new(87.94276428222656, 73.55451202392578, -12319.46484375))
            elseif _G.SelectIsland == "Candy Island" then
                TP2(CFrame.new(-1014.4241943359375, 149.11068725585938, -14555.962890625))
            elseif _G.SelectIsland == "Tiki Outpost" then
                TP2(CFrame.new(-16213.3105, 9.10701942, 436.218353, 0.00981445424, 8.00484941e-08, -0.999951839, -1.81643873e-08, 1, 7.987407e-08, 0.999951839, 1.73795929e-08, 0.00981445424))
            end
        until not _G.TeleportIsland
    end
    StopTween(_G.TeleportIsland)
    end
})
----------------------------------------------------------------------------------------------------------------------------------------------------
--Raid
local Chips = {"Flame","Ice","Quake","Light","Dark","Spider","Rumble","Magma","Buddha","Sand","Phoenix","Dough"}

local DropdownRaid = Tabs.Raid:AddDropdown("DropdownRaid", {
    Title = "Select Chip",
    Description = "เลือกชิปลงดัน",
    Values = Chips,
    Multi = false,
    Default = 1,
})
DropdownRaid:SetValue("...")
DropdownRaid:OnChanged(function(Value)
    SelectChip = Value
end)

local ToggleBuy = Tabs.Raid:AddToggle("ToggleBuy", {Title = "Buy Chip", Description = "ซื้อชิป",Default = false })
ToggleBuy:OnChanged(function(Value)
    _G.Auto_Buy_Chips_Dungeon = Value
end)
Options.ToggleBuy:SetValue(false)
spawn(function()
    while wait() do
		if _G.Auto_Buy_Chips_Dungeon then
			pcall(function()
				local args = {
					[1] = "RaidsNpc",
					[2] = "Select",
					[3] = SelectChip
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end)
        end
    end
end)


local ToggleStart = Tabs.Raid:AddToggle("ToggleStart", {Title = "Start Raid",Description = "ออโต้เริ่มดัน", Default = false })
    ToggleStart:OnChanged(function(Value)
        _G.Auto_StartRaid = Value
end)
Options.ToggleStart:SetValue(false)

spawn(function()
    while wait(.1) do
        pcall(function()
            if _G.Auto_StartRaid then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible == false then
                    if not game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip") then
                        if Second_Sea then
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                        elseif Third_Sea then
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                        end
                    end
                end
            end
        end)
    end
end)


local ToggleKillAura = Tabs.Raid:AddToggle("ToggleKillAura", {Title = "Kill Aura",Description = "ฆ่ามอนเตอร์ทุกตัว", Default = false })
ToggleKillAura:OnChanged(function(Value)
    _G.Kill_Aura = Value
end)
Options.ToggleKillAura:SetValue(false)
task.spawn(function()
    while wait() do
        if _G.Kill_Aura then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                        until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                    end
                end
            end)
        end
    end
end)
local ToggleNextIsland = Tabs.Raid:AddToggle("ToggleNextIsland", {Title = "Auto Next Island",Description = "ออโต้เปลี่ยนเกาะ", Default = false })
ToggleNextIsland:OnChanged(function(Value)
    _G.AutoNextIsland = Value
end)
Options.ToggleNextIsland:SetValue(false)
task.spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoNextIsland then
				if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 5" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2300 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 4" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 3" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2100 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island 2" and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,10,0))
						end
					end
				elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island ") then
					for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
						if v.Name == "Island " and (v.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
							TP2(v.CFrame*CFrame.new(0,70,0))
						end
					end
				else
					task.wait()
				end
			else
				task.wait()
			end
		end)
	end
end)



local ToggleAwake = Tabs.Raid:AddToggle("ToggleAwake", {Title = "Auto Awake",Description = "ออโต้ซื้อสกิล V2", Default = false })
ToggleAwake:OnChanged(function(Value)
    AutoAwakenAbilities = Value
end)
Options.ToggleAwake:SetValue(false)
spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener","Awaken")
            end)
        end
    end
end)
local ToggleGetFruit = Tabs.Raid:AddToggle("ToggleGetFruit", {Title = "Get Fruit Low 1M",Description = "เอาผลราคาต่ำกว่า 1 ล้านมาลงดัน", Default = false })
ToggleGetFruit:OnChanged(function(Value)
    _G.Autofruit = Value
end)

spawn(function()
    while wait(.1) do
        pcall(function()
     if _G.Autofruit then
         
local args = {
    [1] = "LoadFruit",
    [2] = "Rocket-Rocket"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))




local args = {
    [1] = "LoadFruit",
    [2] = "Spin-Spin"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Chop-Chop"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))





local args = {
    [1] = "LoadFruit",
    [2] = "Spring-Spring"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Bomb-Bomb"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Smoke-Smoke"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Spike-Spike"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Flame-Flame"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Falcon-Falcon"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Ice-Ice"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Sand-Sand"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Dark-Dark"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Ghost-Ghost"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Diamond-Diamond"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Light-Light"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Rubber-Rubber"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))


local args = {
    [1] = "LoadFruit",
    [2] = "Barrier-Barrier"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
    [1] = "LoadFruit",
    [2] = "Magma-Magma"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
local args = {
    [1] = "LoadFruit",
    [2] = "Ghost-Ghost"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end)
end
end)
Tabs.Raid:AddButton({
        Title = "Buy Chip Select",
        Description = "ซื้อชิปที่เราเลือก",
        Callback = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidsNpc","Select",SelectChip)
        end
})
Tabs.Raid:AddButton({
        Title = "Start Raid",
        Description = "กดเริ่มต้นดัน",
        Callback = function()
            if Second_Sea then
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
            elseif Third_Sea then
                fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
            end
        end
})
----------------------------------------------------------------------------------------------------------------
--Shop
local Main = Tabs.Shop:AddSection("Auto Buyer Abilities")
Tabs.Shop:AddButton({
    Title = "Buy Geppo [$10,000 Beli]",
    Description = "ซื้อเดินชมจันทร์",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Buso Haki [$25,000 Beli]",
    Description = "ซื้อฮาคิเกราะ",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Soru [$25,000 Beli]",
    Description = "ซื้อโซล",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Observation Haki [$750,000 Beli]",
    Description = "ซื้อฮาคิสังเกตุ",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end
})
local Main = Tabs.Shop:AddSection("Auto Buyer Melee")
Tabs.Shop:AddButton({
    Title = "Buy Black Leg [$150,000 Beli]",
    Description = "ซื้อขาดำ V1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Electro [$550,000 Beli]",
    Description = "ซื้อหมัดสายฟ้า V1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Fishman Karate [$750,000 Beli]",
    Description = "ซื้อหมัดมนุษย์เงือก V1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Dragon Claw [$1,500 Fragments]",
    Description = "ซื้อหมัดมังกร V1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Superhuman [$3,000,000 Beli]",
    Description = "ซื้อหมัดชุปเปอร์ฮิวเมน V1",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Death Step [$5,000 Fragments + $5,000,000 Beli]",
    Description = "ซื้อขาดำ V2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Sharkman Karate [$5,000 Fragments + $2,500,000 Beli]",
    Description = "ซื้อหมัดมนุษย์เงือก V2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Electric Claw [$5,000 Fragments + $3,000,000 Beli]",
    Description = "ซื้อหมัดสายฟ้า V2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Dragon Talon [$5,000 Fragments + $3,000,000 Beli]",
    Description = "ซื้อหมัดมังกร V2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy God Human [$5,000 Fragments + $5,000,000 Beli]",
    Description = "ซื้อหมัดก็อตฮิวเมน V2",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Sanguine Art [$5,000 Fragments + $5,000,000 Beli]",
    Description = "ซื้อหมัดแวมไพร์",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})

local Main = Tabs.Shop:AddSection("Auto Buyer Sword")
Tabs.Shop:AddButton({
    Title = "Buy Cutlass [$1,000 Beli]",
    Description = "ซื้อมีดสั้น",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")
    end
})
Tabs.Shop:AddButton({
    Title = "Buy Katana [$1,000 Beli]",
    Description = "ซื้อดาบคาตานะ",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อกระบองเหล็ก",
    Description = "Buy Iron Mace [$25,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อดาบคาตานะคู่",
    Description = "Buy Dual Katana [$12,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อดาบทริปเปิลคาตานะ",
    Description = "Buy Triple Katana [$60,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อท่อ",
    Description = "Buy Pipe [$100,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อใบมีดสองหัว",
    Description = "Buy Dual-Headed Blade [$400,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อดาบหนวดขาว",
    Description = "Buy Bisento [$1,200,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อไม้เท้าวิญญาณ",
    Description = "Buy Soul Cane [$750,000 Beli]",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")
    end
})
Tabs.Shop:AddButton({
    Title = "ซื้อโพ V2",
    Description = "Buy Pole V2 [5,000 Fragments]",
    Callback = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})
--------------------------------------------------------------------------------------------------------
--Misc Tabs
local JobID = Tabs.Misc:AddSection("Job ID Function")
Tabs.Misc:AddButton({
	Title = "Copy Job ID",
	Description = "คัดลอก Job ID",
	Callback = function()
        setclipboard(tostring(game.JobId))
	end
})
local Input = Tabs.Misc:AddInput("Jobid", {
    Title = "Input Job ID",
    Description = "ใส่ Job ID",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        _G.Job = Value
    end
})

Input:OnChanged(function(Value)
    _G.Job = Value
end)
Tabs.Misc:AddButton({
	Title = "Join Job ID",
	Description = "เข้า Job ID",
	Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId,_G.Job, game.Players.LocalPlayer)
	end
})
local Toggle = Tabs.Misc:AddToggle("Spam Join", {
	Title = "Spam Join",
	Description = "Spam Join Job ID",
	Default = false,
	Callback = function(Value)
		_G.Join = Value
	end
})
spawn(function()
	while wait() do
		if _G.Join then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
		end
	end
end)
if First_Sea or Second_Sea then
    local Mastery = Tabs.Misc:AddSection("Thid Sea Please !!!")
end

if Third_Sea then
local ToggleFindMoon = Tabs.Misc:AddToggle("ToggleFindMoon", {Title = "Find Full Moon",Description = "เปลี่ยนเซิฟหาเซิฟ พระจันทร์เต็มดวง", Default = false })
ToggleFindMoon:OnChanged(function(Value)
    _G.AutoFindMoon = Value
end)
Options.ToggleFindMoon:SetValue(false)


spawn(function()
    while wait() do
        if _G.AutoFindMoon then
        if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" or game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
            wait(2.0)
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
            Hop()
            Fluent:Notify({
                Title = "Day Hub",
                Content = "Turn Off Find Full Moon...",
                SubContent = "", -- Optional
                Duration = 5
            })
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
            Hop()
            Fluent:Notify({
                Title = "Day Hub",
                Content = "Hop...",
                SubContent = "", -- Optional
                Duration = 5
            })
        elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
            Hop()
            Fluent:Notify({
                Title = "Day Hub",
                Content = "Hop...",
                SubContent = "", -- Optional
                Duration = 5
            })
        else
            Hop()
            end
        end
    end
end)


local ToggleMirageIsland = Tabs.Misc:AddToggle("ToggleMirageIsland", {Title = "Find Mirage Island",Description = "เปลี่ยนเซิฟหาเซิฟ เกาะลับ", Default = false })
ToggleMirageIsland:OnChanged(function(Value)
    _G.FindMirageIsland = Value
end)
Options.ToggleMirageIsland:SetValue(false)

spawn(function()
    while wait() do
    if _G.FindMirageIsland then
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") or game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            if HighestPointRealCFrame and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - HighestPointRealCFrame.Position).Magnitude > 10 then
            TP2(getHighestPoint().CFrame * CFrame.new(0, 211.88, 0))
                end
        elseif not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") or not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
            Hop()
            end
        end
    end
end)
function Hop()
	local PlaceID = game.PlaceId
	local AllIDs = {}
	local foundAnything = ""
	local actualHour = os.date("!*t").hour
	local Deleted = false
	function TPReturner()
		local Site;
		if foundAnything == "" then
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
		else
			Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
		end
		local ID = ""
		if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
			foundAnything = Site.nextPageCursor
		end
		local num = 0;
		for i,v in pairs(Site.data) do
			local Possible = true
			ID = tostring(v.id)
			if tonumber(v.maxPlayers) > tonumber(v.playing) then
				for _,Existing in pairs(AllIDs) do
					if num ~= 0 then
						if ID == tostring(Existing) then
							Possible = false
						end
					else
						if tonumber(actualHour) ~= tonumber(Existing) then
							local delFile = pcall(function()
								AllIDs = {}
								table.insert(AllIDs, actualHour)
							end)
						end
					end
					num = num + 1
				end
				if Possible == true then
					table.insert(AllIDs, ID)
					wait()
					pcall(function()
						wait()
						game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
					end)
					wait(4)
				end
			end
		end
	end
	function Teleport() 
		while wait() do
			pcall(function()
				TPReturner()
				if foundAnything ~= "" then
					TPReturner()
				end
			end)
		end
	end
	Teleport()
end
end
--------------------------------------------------------------------------------------------------------------------------------------------
--RaceV4
local Draco = Tabs.Race:AddSection("Draco Race")
local Toggle = Tabs.Race:AddToggle("To to Draco Trial Door", {
	Title = "Tp to Draco Trial Door",
	Description = "",
	Default = false,
	Callback = function(Value)
		_G.AutoTrialTeleport = Value
		StopTween(_G.AutoTrialTeleport)
	end
})
spawn(function()
	while wait() do
		if _G.AutoTrialTeleport then
			local Prehistoric = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
			if ( Prehistoric and Prehistoric:IsA("Part")) then
				Tween2(CFrame.new(Prehistoric.Position))
			end
		end
	end
end)
local RaceV4 = Tabs.Race:AddSection("Race V4")

Tabs.Race:AddButton({
    Title = "Timple Of Time",
    Description = "ที่ทำเผ่า V4",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})


Tabs.Race:AddButton({
    Title = "Lever Pull",
    Description = "จุดดึงขันโยก",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        wait(0.5)
        TP2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})


Tabs.Race:AddButton({
    Title = "Acient One",
    Description = "NPC อัพเกรดเกียร์",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        wait(0.5)
        TP2(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
    end
})


local Mastery = Tabs.Race:AddSection("Auto Race")
Tabs.Race:AddButton({
    Title = "Race Door",
    Description = "ประตูประจำเผ่า",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
            wait(0.5)
                    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    TP2(CFrame.new(29221.822265625, 14890.9755859375, -205.99114990234375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
                    TP2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
                    TP2(CFrame.new(28231.17578125, 14890.9755859375, -211.64173889160156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
                    TP2(CFrame.new(28502.681640625, 14895.9755859375, -423.7279357910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
                    TP2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                    elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                    TP2(CFrame.new(29012.341796875, 14890.9755859375, -380.1492614746094))
                    end
    end
})


local ToggleHumanandghoul = Tabs.Race:AddToggle("ToggleHumanandghoul", {Title = "Auto [ Human / Ghoul ] Trial",Description = "ออโต้ผ่านเควส มนุษย์/กูล ", Default = false })
ToggleHumanandghoul:OnChanged(function(Value)
    KillAura = Value
end)
Options.ToggleHumanandghoul:SetValue(false)


local ToggleAutotrial = Tabs.Race:AddToggle("ToggleAutotrial", {Title = "Auto Trial",Description = "ออโต้ผ่านเควส ทุกเผ่า", Default = false })
ToggleAutotrial:OnChanged(function(Value)
    _G.AutoQuestRace = Value
end)
Options.ToggleAutotrial:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
				if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Skypiea" then
					for i,v in pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants()) do
						if v.Name ==  "snowisland_Cylinder.081" then
							BTPZ(v.CFrame* CFrame.new(0,0,0))
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Fishman" then
					for i,v in pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants()) do
						if v.Name ==  "HumanoidRootPart" then
							TP2(v.CFrame* Pos)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Melee" then
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Blox Fruit" then
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
					
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Sword" then
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(0.5)
							for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
								if v:IsA("Tool") then
									if v.ToolTip == "Gun" then
										game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
									end
								end
							end
							game:GetService("VirtualInputManager"):SendKeyEvent(true,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,122,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,120,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							wait(.2)
							game:GetService("VirtualInputManager"):SendKeyEvent(true,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
							game:GetService("VirtualInputManager"):SendKeyEvent(false,99,false,game.Players.LocalPlayer.Character.HumanoidRootPart)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Cyborg" then
					TP2(CFrame.new(28654, 14898.7832, -30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Ghoul" then
					for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
						if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
							pcall(function()
								repeat wait(.1)
									v.Humanoid.Health = 0
									v.HumanoidRootPart.CanCollide = false
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
								until not _G.AutoQuestRace or not v.Parent or v.Humanoid.Health <= 0
							end)
						end
					end
				elseif game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
					for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
						if v.Name == "StartPoint" then
							TP2(v.CFrame* CFrame.new(0,10,0))
					  	end
				   	end
				end
			end
        end
    end)
end)
local Mastery = Tabs.Race:AddSection("Auto Train")

local ToggleAutoAcientQuest = Tabs.Race:AddToggle("ToggleAutoAcientQuest", {Title = "Auto Train",Description = "ออโต้ทำเควสอัพเกรดเกียร์", Default = false })
ToggleAutoAcientQuest:OnChanged(function(Value)
    AutoFarmAcient = Value
end)
Options.ToggleAutoAcientQuest:SetValue(false)
local AcientCframe = CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875)

spawn(function()
    pcall(function()
        while wait() do
            if AutoFarmAcient then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == true then
                    AutoFarmAcient = false
                    TP2(CFrame.new(216.211181640625, 126.9352035522461, -12599.0732421875))
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do 
        if AutoFarmAcient then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Cocoa Warrior") or game:GetService("Workspace").Enemies:FindFirstChild("Chocolate Bar Battler") or game:GetService("Workspace").Enemies:FindFirstChild("Sweet Thief") or game:GetService("Workspace").Enemies:FindFirstChild("Candy Rebel") then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cocoa Warrior" or v.Name == "Chocolate Bar Battler" or v.Name == "Sweet Thief" or v.Name == "Candy Rebel" then
                           if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    bringmob = true
                                    repeat wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v.HumanoidRootPart.CanCollide = false
                                    v.Humanoid.WalkSpeed = 0
                                    v.Head.CanCollide = false 
                                    FarmPos = v.HumanoidRootPart.CFrame
                                    MonFarm = v.Name
                                    TP2(v.HumanoidRootPart.CFrame * CFrame.new(posX,posY,posZ))
                                until not AutoFarmAcient or not v.Parent or v.Humanoid.Health <= 0
                          bringmob = false
                            end
                        end
                    end
                else
                TP2(AcientCframe)
                end
            end)
        end
    end
end)
spawn(function()
    pcall(function()
        while wait() do
            if AutoFarmAcient then
                if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                    AutoFarmAcient = true
                end
            end
        end
    end)
end)
spawn(function()
while wait() do
    pcall(function()
        if AutoFarmAcient then
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Y",false,game)
            wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Y",false,game)
        end
    end)
end
end)
----------------------------------------------------------------------------------------------------------------------------
--Stats
local Main = Tabs.Stats:AddSection("สถานะ & สเตตัส")
local PointStatus = Tabs.Stats:AddParagraph({
    Title = "ตอนนี้คุณมี : ไม่มีสถานะ"
})
spawn(function()
    while task.wait() do
        pcall(function()
            PointStatus:SetTitle("คุณมี "..tostring(game:GetService("Players")["LocalPlayer"].Data.Points.Value).. " สถานะ")
        end)
    end
end)
local Status = Tabs.Stats:AddParagraph({
    Title = "Status : not"
})
spawn(function()
  while task.wait() do
    pcall(function()
      Status:SetTitle("หมัด: "..game.Players.LocalPlayer.Data.Stats.Melee.Level.Value.. " เลือด: "..game.Players.LocalPlayer.Data.Stats.Defense.Level.Value.. " ดาบ: "..game.Players.LocalPlayer.Data.Stats.Sword.Level.Value.. " ปืน: "..game.Players.LocalPlayer.Data.Stats.Gun.Level.Value.. " ผลปีศาจ: "..game.Players.LocalPlayer.Data.Stats["Demon Fruit"].Level.Value)
    end)
  end
end)
local Toggle = Tabs.Stats:AddToggle("Auto Up Stats", {
    Title = "Melee",
    Default = false,
    Callback = function(Value)
        _G.Melee = Value
    end
})
local Toggle = Tabs.Stats:AddToggle("Auto Up Stats", {
    Title = "Defense",
    Default = false,
    Callback = function(Value)
        _G.Defense = Value
    end
})    
local Toggle = Tabs.Stats:AddToggle("Auto Up Stats", {
    Title = "Sword", 
    Default = false,
    Callback = function(Value)
        _G.Sword = Value
    end
})    
local Toggle = Tabs.Stats:AddToggle("Auto Up Stats", {
    Title = "Gun", 
    Default = false,
    Callback = function(Value)
        _G.Gun = Value
    end
})    
local Toggle = Tabs.Stats:AddToggle("Auto Up Stats", {
    Title = "Demon Fruit", 
    Default = false,
    Callback = function(Value)
        _G.DemonFruit = Value
    end
})    

spawn(function()
    while task.wait() do
        pcall(function()
            local a = _G.Melee
            local b = _G.Defense
            local c = _G.Sword
            local d = _G.Gun
            local e = _G.DemonFruit           
            local f = {a, b, c, d, e}
            local g = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}            
            for h = 1, #f do
                if f[h] then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", g[h], 1)
                end
            end
        end)
    end
end)
------------------------------------------------------------------------------------------------------------------------
--MIsc tab
local Miscellaneous = Tabs.Misc:AddSection("Team")
Tabs.Misc:AddButton({
	Title = "Join Pirates Team",
	Description = "",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates") 
	end
})
Tabs.Misc:AddButton({
	Title = "Join Marines Team",
	Description = "",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Marines") 
	end
})
local Miscellaneous = Tabs.Misc:AddSection("Open Ui")
Tabs.Misc:AddButton({
	Title = "Devil Shop Menu",
	Description = "",
	Callback = function()
		local args = {
            "GetFruits",
            false
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
	end
})
Tabs.Misc:AddButton({
	Title = "Color Haki Menu",
	Description = "",
	Callback = function()
		game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
	end
})
Tabs.Misc:AddButton({
	Title = "Title Name Menu",
	Description = "",
	Callback = function()
		local args = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
	end
})
Tabs.Misc:AddButton({
	Title = "Awakening Menu",
	Description = "",
	Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
	end
})
InterfaceManager:SetFolder("DayScriptHub")
SaveManager:SetFolder("DayHub/specific-game")
Window:SelectTab(1)
Fluent:Notify({
    Title = "Day Hub | Blox Fruit",
    Content = "The script has been loaded.",
    Duration = 8
})
SaveManager:LoadAutoloadConfig()