FROM_LOADER = true

if not FROM_LOADER then
	while not game:GetService("Players").LocalPlayer do task.wait() end
	game:GetService("Players").LocalPlayer:Kick("Wrong Loader! The new loader has been copied to your clipboard, Please paste the new script in your executor.")

	setclipboard([[
	script_key="YOUR KEY HERE!!!!!!"
	loadstring(game:HttpGet("https://raw.githubusercontent.com/lolthatseazy/ERX/main/Loader.lua"))()
	]])
	return
end

if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() task.wait(math.random(3, 5) + math.random()) end

if not LPH_OBFUSCATED then
	LPH_NO_VIRTUALIZE = function(...) return ... end
	LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end
end

local C = function(F)
	if not F then
		return
	elseif clonefunction and hookfunction then
		local Result = clonefunction(F)
		if Result ~= F then
			local NewFunc = coroutine.wrap(coroutine.isyieldable)
			local Result2 = hookfunction(NewFunc, LPH_NO_UPVALUES(function()
				return "CHICKEN JOCKEY!!"
			end))

			pcall(hookfunction(Result2, Result))

			return Result2
		end
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Executor Not Supported!";
		Text = "The executor you are using is not supported, Please check supported executors in the discord.",
	})

	return (wait(9e9) and (function()
		while true do
			Instance.new("Part", workspace)
		end
	end)())
end

C = C(C)

local Stats = stats
Drawing, pairs, request, delfile, getcustomasset, getidentity, getgc, Rawget, isnetworkowner, isfolder, makefolder, getnilinstances, setidentity, getrunningscripts, getscriptbytecode, clonefunction, isfile, readfile, writefile, setfpscap, islclosure, getrenv, setupvalue, foreach, getupvalues, getconnections, getnamecallmethod, get_signal_cons, getsenv, Getfenv, setclipboard, toclipboard, set, getrawmetatable, Setrawmetatable, hookfunction, checkcaller, newcclosure, firetouchinterest, setmetatable, getmetatable, LRM_ScriptVersion, LRM_UserNote, LRM_IsUserPremium =
	Drawing, C(pairs), C(request), C(delfile), C(getcustomasset), C(getidentity), C(getgc), C(rawget), C(isnetworkowner), C(isfolder), C(makefolder), C(getnilinstances), C(setidentity), C(getrunningscripts), C(getscriptbytecode), C(clonefunction), C(isfile), C(readfile), C(writefile), C(setfpscap), C(islclosure), C(getrenv), C(setupvalue), table.foreach, C(getupvalues), C(getconnections), C(getnamecallmethod), C(get_signal_cons), C(getsenv), C(getfenv), C(setclipboard), C(toclipboard), C(set), C(getrawmetatable), C(setrawmetatable), C(hookfunction), C(checkcaller), C(newcclosure), C(firetouchinterest), C(setmetatable), C(getmetatable), LRM_ScriptVersion, LRM_UserNote, LRM_IsUserPremium

if not LRM_ScriptVersion then _G.SoftAntiBan = true _G.RanERX = false _G.IgnoreWarns = true LRM_IsUserPremium, LRM_UserNote, LRM_LinkedDiscordID = true, "", 0 end

if getgenv().SimpleSpyExecuted and LRM_ScriptVersion and not _G.SoftAntiBan then
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "ERX - Error";
		Text = "A very RARE Error just Occured, Please report this to the discord.",
	})
	return
end

if not cloneref then
	cloneref = function(A) return A end
end

local SafeFireServer = C(Instance.new("RemoteEvent").fireServer)

local MarketplaceService = cloneref(game:GetService("MarketplaceService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local ScriptContext = cloneref(game:GetService("ScriptContext"))
local HttpService = cloneref(game:GetService("HttpService"))
local RunService = cloneref(game:GetService("RunService"))
local LogService = cloneref(game:GetService("LogService"))
local StarterGui = cloneref(game:GetService("StarterGui"))
local WorkSpace = cloneref(game:GetService("Workspace"))

local StatsService = cloneref(game:GetService("Stats"))
local ChatService = cloneref(game:GetService("Chat"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local Lighting = cloneref(game:GetService("Lighting"))
local Players = cloneref(game:GetService("Players"))
local Teams = cloneref(game:GetService("Teams"))

local GameId = game.GameId
local PlaceId = game.placeId
local JobId = game.JobId
local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:FindFirstChildWhichIsA("Humanoid") or Character:WaitForChild("Humanoid", 9e9)
local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart") or Character:WaitForChild("HumanoidRootPart", 9e9)

local OnChatted
local OnCharAdded = function(CharacterAdded)
	Character = CharacterAdded
	Humanoid = CharacterAdded:FindFirstChildWhichIsA("Humanoid") or CharacterAdded:WaitForChild("Humanoid", 9e9)
	HumanoidRootPart = CharacterAdded:FindFirstChild("HumanoidRootPart") or CharacterAdded:WaitForChild("HumanoidRootPart", 9e9)
	
	if LocalPlayer.ReplicationFocus then
		LocalPlayer.ReplicationFocus = nil
	end

	LocalPlayer.PlayerGui:WaitForChild("GameGui", 9e9):WaitForChild("Chat & Radio", 9e9):WaitForChild("ChatEvent", 9e9).Event:Connect(OnChatted or function() end)
end


LocalPlayer.CharacterAdded:Connect(OnCharAdded)

local ExploitENV = Getfenv(1)
local CopyFunction = setclipboard or toclipboard or set
local GetConnections = getconnections or get_signal_cons

local LoadstringCount = 0
function MainLoadstring(ContentURL)
	local TriesTime = 0
	local SContent
	while not SContent and TriesTime < 3 do
		local Response = request({
			Url = ContentURL,
			Method = "GET"
		})

		if not Response then
			LocalPlayer:Kick("[ERX - Error]: Internal Failure.")
			return coroutine.yield() and wait(9e9)
		end

		if Response.StatusCode == 200 then
			SContent = Response.Body
		else
			TriesTime = TriesTime + 1
			task.wait(0.5)
		end
	end

	local Function = SContent and loadstring(SContent)
	if type(Function) == "function" then
		LoadstringCount = LoadstringCount + 1 -- Usaria += pero puede llegar a fallar
		setfenv(Function, ExploitENV)
		local Results = table.pack(Function())
		if Results.n > 0 then
			Results.n = nil
			return table.unpack(Results)
		end
	end

	LocalPlayer:Kick("[ERX - Error]: Failed to find loadstring N°" .. tostring(LoadstringCount) .. ".")
	return coroutine.yield() and wait(9e9)
end

if not LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
	CopyFunction([[
	script_key="KeyHere"; -- https://ads.luarmor.net/get_key?for=ERXKey-tBiwRFFKgwfz
	
	loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9b3252e2e2420a9aa5b891c76dff6e65.lua"))()
	]])

	return LocalPlayer:Kick("[ERX - Error]: Please first complete the key system.")
elseif _G.RanERX then
	return warn("Script cannot be executed twice")
elseif PlaceId == 2534724415 then
	local MainURL = "https://raw.githubusercontent.com/lolthatseazy/FluentLib/refs/heads/main/"

	local _, ActualRVersion = pcall(function()
		local productInfo = MarketplaceService:GetProductInfo(PlaceId)
		if productInfo then
			return productInfo.Updated:gsub("%..*", "")
		end
	end)

	local ActualVersion = "v2.0.0a"
	local StartTime, MVersion, MStatus, RVersion, DoDebug, AnticheatVersion = tick(), nil

	local suc = pcall(function()
		MVersion = game:HttpGet(MainURL .. "MVersion"):gsub("\n", "")
		RVersion = tostring(game:HttpGet(MainURL .. "RVersion")):gsub("\n", "")
		MStatus = game:HttpGet(MainURL .. "MStatus")
		DoDebug = game:HttpGet(MainURL .. "debugging") == "true"
		AnticheatVersion = game:HttpGet(MainURL .. "AnticheatVersion"):gsub("\n", "")
	end)

	local CanContinue, FoundAnticheat = false, false

	if AnticheatVersion ~= nil then
		for _, v in ipairs(getnilinstances()) do
			if v.Name == "LocalScript" and not v.Parent then
				local suc, Bytecode = pcall(function() return getscriptbytecode(v) end)

				if suc and Bytecode and (Bytecode:find("getmemoryUsageMbForTag") or Bytecode:find("$ENC_")) then
					if #Bytecode == tonumber(AnticheatVersion) then
						CanContinue = true
					end
					FoundAnticheat = true
					break
				end
			end
		end

		if not FoundAnticheat then
			StarterGui:SetCore("SendNotification", {
				Title = "ERLC AntiCheat Detector";
				Text = "Failed to find anticheat.",
				Duration = math.huge,
			})
			return
		end
	end

	if not CanContinue then
		StarterGui:SetCore("SendNotification", {
			Title = "ERLC AntiCheat Detector";
			Text = "The version of ERLC you are in has a NEW Anticheat which may lead to BANS, Please report this to the discord server.",
			Duration = math.huge,
		})
		return
	end

	if LRM_ScriptVersion and not suc then
		return LocalPlayer:Kick("[ERX - Error]: Could not obtain the script information.")
	elseif LRM_ScriptVersion and MVersion ~= ActualVersion then
		return LocalPlayer:Kick("[ERX - Error]: You are using an old version of the script, use the loadstring.")
	elseif LRM_ScriptVersion and MStatus ~= "Updated" then
		return LocalPlayer:Kick("[ERX - Error]: " .. tostring(MStatus or "Unknown"))
	elseif RVersion ~= ActualRVersion and not _G.IgnoreWarns then
		local Bindable = Instance.new("BindableFunction")

		StarterGui:SetCore("SendNotification", {
			Title = "Version not Supported!!";
			Text = "The Version of ERLC is not supported but you can continue if you wish.",
			Duration = math.huge,
			Callback = Bindable,
			Button1 = "Continue",
			Button2 = "Kick me"
		})

		local ActualAction
		Bindable.OnInvoke = function(Option)
			if Option == "Continue" then
				ActualAction = 1
			else
				ActualAction = 2
			end
		end

		repeat task.wait()
		until ActualAction

		if ActualAction == 2 then
			return LocalPlayer:Kick("[ERX - Info]: You have selected the option to be kicked.")
		end
	end

	StarterGui:SetCore("SendNotification", {
		Title = "ERX";
		Text = "ERX is loading, Please wait.";
		Duration = 3;
	})

	if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
		StarterGui:SetCore("SendNotification", {
			Title = "ERX (PREMIUM)";
			Text = "Discord ID: " .. (LRM_LinkedDiscordID or "?");
			Duration = 5;
		})
	end

	local FFCWIA = Stats().findFirstChildWhichIsA
	if not FFCWIA or FFCWIA(game, "StudioService") then
		return
	else
		local Called = false
		pcall(clonefunction(coroutine.wrap(function()
			Called = true
		end)))

		if not Called then
			return
		else
			local DetectedTostring = 0

			local ProxyDetector = newproxy(true)
			local ProxyMETA = getmetatable(ProxyDetector)

			ProxyMETA.__tostring = function()
				DetectedTostring = os.time()
			end

			local Succes = pcall(setmetatable, ProxyDetector, {
				__newindex = ProxyMETA.__tostring
			})

			local SetThread = coroutine.create(setmetatable)
			local Succes2 = coroutine.resume(SetThread, ProxyDetector, {
				__newindex = ProxyMETA.__tostring
			})

			task.wait()

			if Succes or Succes2 or DetectedTostring ~= 0 then
				return
			end
		end
	end

	local Camera = WorkSpace.CurrentCamera or WorkSpace:WaitForChild("Camera")
	local BountyVehicles = WorkSpace:WaitForChild("BountyVehicles", 9e9):WaitForChild("Vehicles", 9e9)
	local JewelryCases = WorkSpace:WaitForChild("JewelryCases", 9e9)
	local StreetLamps = WorkSpace:WaitForChild("Street Lamps", 9e9)
	local BasketBalls = WorkSpace:WaitForChild("Basketballs", 9e9)
	local Helicopters = WorkSpace:WaitForChild("Helicopter", 9e9)
	local Deployables = WorkSpace:WaitForChild("Deployables", 9e9)
	local Vehicles = WorkSpace:WaitForChild("Vehicles", 9e9)
	local ModShop = WorkSpace:WaitForChild("EnterableBuildings", 9e9):WaitForChild("ModShop", 9e9)
	local Houses = WorkSpace:WaitForChild("Houses", 9e9)
	local ATMs = WorkSpace:WaitForChild("ATMs", 9e9)

	local InTeleport

	local RemoteFunction = Instance.new("RemoteFunction")

	local TablesToCheck = {}

	local Detected = false

	if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
		do -- SINO DA MAX LOCALS 200 XD
			
			local CheckString = LPH_NO_VIRTUALIZE(function(str)
				local StrD1 = "AssemblyLinearVelocity"
				local StrD2 = ", caught_via="
				
				if str == StrD1 or str == StrD2 then
					return true
				end
				
				return false
			end)
			
			local LookTable = function(Table)
				--if Detected then return end
				for Indx, _ in next, Table do
					local Value = rawget(Table, Indx)
					if type(Value) == "string" and (Value:find("%d%*%*%*") or CheckString(Value)) then
						if Value == "28***" then -- SAM AND HAM
							continue
						end
						Detected = true
						if not _G.SoftAntiBan then
							LocalPlayer:Kick("[ERX]: Anti-Ban, rejoining...")
							task.delay(5, function()
								if InTeleport then return end
								InTeleport = true
								TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
							end)
						else
							warn("[Anti-Ban]", Value)
						end
					end
				end
			end
			
			local StartCheck = tick()

			if #TablesToCheck < 920 then
				while #TablesToCheck < 920 do
					table.clear(TablesToCheck)

					for i, Table in ipairs(getgc(true)) do
						if Table and type(Table) == "table" and type(Rawget(Table, 0)) == "table" then
							table.insert(TablesToCheck, Table)
						end
					end

					if tick() - StartCheck > 2 then
						StarterGui:SetCore("SendNotification", {
							Title = "ERX - Security",
							Text = "Attempting to load Anti-Ban...",
							Duration = 2,
						})
					end

					task.wait(0.2)
				end
			end

			local OldInvokeServer
			OldInvokeServer = hookfunction(RemoteFunction.InvokeServer, newcclosure(function(...)
				for _,Table in pairs(TablesToCheck) do
					LookTable(Table) -- por si acaso no usaremos task.spawn
				end

				if Detected then
					task.wait(9e9)
					coroutine.yield()
					error()
					return
				end

				return OldInvokeServer(...)
			end))
		end
	else
		StarterGui:SetCore("SendNotification", {
			Title = "ERX - Security",
			Text = "You are using the FREE version of the script, this means you do not have [Anti-Ban]. Be careful using external scripts",
			Duration = 15,
		})
	end
	
	ModShop.ModelStreamingMode = Enum.ModelStreamingMode.Persistent

	_G.RanERX = true

	local Modules = ReplicatedStorage:WaitForChild("Modules", 9e9)

	local FE = ReplicatedStorage:WaitForChild("FE", 9e9)
	local Actions = FE:WaitForChild("Actions", 9e9)

	local AnticheatRemote = FE:WaitForChild("Integrity", 9e9):WaitForChild("RemoteFunction", 9e9)
	local Framework = require(LocalPlayer:WaitForChild("PlayerScripts", 9e9):WaitForChild("Core", 9e9):WaitForChild("Framework", 9e9))

	local ClientModules = {
		ProjectileHandler = require(LocalPlayer.PlayerScripts.Core:WaitForChild("ProjectileHandler", 9e9)),
		CivilianGuns = require(Modules:WaitForChild("CivilianGuns", 9e9)),
		PoliceGuns = require(Modules:WaitForChild("LawGuns", 9e9)),
	}

	local ACPath = "ReplicatedFirst.LocalScript"
	local OriginalMETA = getrawmetatable(game)
	
	local DisableACConnection = function(RBXConnection, Disable)
		local Found = false
		for _, Connection in ipairs(GetConnections(RBXConnection)) do
			if Connection.Function and debug.info(Connection.Function, "s"):find(ACPath) then
				Found = true

				if Disable then
					Connection:Disable()
				else
					hookfunction(Connection.Function, LPH_NO_UPVALUES(function() end))
				end
			end
		end

		return Found
	end

	DisableACConnection(ScriptContext.Error)
	DisableACConnection(LogService.MessageOut)

	local OldGetLogHistory
	OldGetLogHistory = hookfunction(LogService.GetLogHistory, LPH_NO_UPVALUES(function(...)
		if not checkcaller() then
			return {}
		end
		return OldGetLogHistory(...)
	end))

	local RealNetwork
	for index, obj in pairs(getgc(true)) do
		if
			type(obj) == "table"
			and rawget(obj, "Fire")
			and typeof(rawget(obj, "Fire")) == "function"
			and rawget(obj, "getRemote")
		then
			RealNetwork = obj
			break
		end
	end

	if not RealNetwork then
		return LocalPlayer:Kick("[ERX - Error]: Failed to get Network (Please report this to the discord).")
	end

	local SecureENV = getsenv(LocalPlayer.PlayerScripts:WaitForChild("Client Game Analytics", 9e9))

	local OldRemotes = {}
	local SafeGetRemote = newcclosure(function(RemoteName)
		local OldResult = OldRemotes[RemoteName]
		if OldResult then return OldResult end

		for i = 0, 25 do
			pcall(setfenv, i, SecureENV)
		end

		local RealRemote = coroutine.wrap(RealNetwork.getRemote)(RemoteName)

		for i = 0, 25 do
			pcall(setfenv, i, ExploitENV)
		end

		OldRemotes[RemoteName] = RealRemote
		return RealRemote
	end)

	local PrivateMembersURL, PrivateMembers = (MainURL .. "Members.lua"), {}

	local FreecamLib = MainLoadstring(MainURL .. "Freecamlib.lua")
	local BypassLib = MainLoadstring(MainURL .. "Bypass.lua")
	local HashLib = MainLoadstring("https://gist.githubusercontent.com/Retinalogic/36b1d62af63a122da264ac78f3128a63/raw/f7cdfe662fe1674c2f89307bce89e30ef636c99f/sha.lua")

	local WindUI = MainLoadstring(MainURL .. "UILib/WindUI.lua")

	local TeleportLocations = {
		["Bank"] = Vector3.new(-976.613, 35.300, 432.653),
		["Gun Store"] = Vector3.new(-1169, 27, -199),
		["Jewelry"] = Vector3.new(-463.152, 35.514, -407.259),
		["Chop Shop"] = Vector3.new(1651, 5, -484),
		["Tool Store"] = Vector3.new(-455, 24, -743),
		["Police Station"] = Vector3.new(801.368, 14.461, -76.762),
		["Watch tower"] = Vector3.new(2700.318, 272.309, -45.640),
		["Spawn"] = Vector3.new(-534, 25, 709),
		["Gas Station"] = Vector3.new(-1014, 24.5, 708),
		["Criminal Base"] = Vector3.new(2931, 84, -763),
		["Mountain"] = Vector3.new(1449.913, 98.898, 1110.012),
		["ATM 1"] = Vector3.new(-374.843, 28.748, 150.783),
		["ATM 2"] = Vector3.new(-571.630, 27.248, -402.883),
		["Sheriff's office"] = Vector3.new(1595.786, -5.877, -1916.918),
		["Bridge"] = Vector3.new(717.882, 27.198, -3238.051),
		["Houses"] = Vector3.new(-703.759, -9.052, -1744.330),
		["Park"] = Vector3.new(194.769, 2.998, 289.757),
		["SafeSpot"] = Vector3.new(2070, 10, 454),
	}

	local SpecialLocations = {
		["Tool Store"] = Vector3.new(-455, 25, -688),

		["OutsideBank"] = Vector3.new(-1120, 24, 447),
		["BankTop"] = Vector3.new(-1093, 54, 446),
		["BankKeypad"] = Vector3.new(-1097, 28, 424),
		["BankVault"] = Vector3.new(-1039, 7, 432),

		["Chopshop Inside"] = Vector3.new(1632, 3, -497),

		["SafeSpot"] = Vector3.new(2070, 10, 454),
	}

	local ESPSettings = {
		defaultcolor = Color3.fromRGB(255,255,255),
		teamcheck = false,
		teamcolor = true
	}

	local Settings = ReplicatedStorage:WaitForChild("PrivateServers", 9e9)

	local LogoHeight = (493/1143) -- Logo px
	local LogoScale = 1.75

	local Window = WindUI:CreateWindow({
		Title = "ERLCXploit " .. (LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" and "[PREMIUM] " or "[FREE] ") .. MVersion,
		Icon = "rbxassetid://113199298512471",
		IconSize = UDim2.new(LogoScale, 0, LogoHeight * LogoScale, 0),
		IconThemed = true,
		Author = "By Dorblx and 1dnt",
		Folder = "ERX",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Transparent = true,
		Theme = "Dark",
		User = {
			Enabled = true,
			Callback = function()

			end,
			Anonymous = false,
			DisplayName = (function()
				local DisplayName = LocalPlayer.DisplayName

				if DisplayName == LocalPlayer.Name then
					return "Anonymous"
				else
					local FirstLetter = DisplayName:sub(0, 1)
					local AnotherPart = DisplayName:sub(- (#DisplayName - 1))

					return string.upper(FirstLetter) .. AnotherPart
				end
			end)(),
			Name = (function()
				local Name = LocalPlayer.Name
				local MaxLength = math.ceil(#Name * 0.5)
				local NoTagsName = Name:sub(0, MaxLength)

				return NoTagsName .. ("*"):rep(#Name - #NoTagsName)
			end)()
		},
		SideBarWidth = 200,
		--MinimizeKey = Enum.KeyCode.LeftControl
	})

	local Start = tick()

	local GameTools = {'RFID Disruptor', 'Glass Cutter', 'Crowbar', 'Baseball Bat', 'Knife', 'Lockpick', 'Scanner', 'Hammer', 'Spray Can', 'Flashlight'}
	local GameGuns = {"Ammo Box"}

	for GunName in pairs(ClientModules.CivilianGuns) do
		table.insert(GameGuns, GunName)
	end

	local AllGuns = table.clone(GameGuns)
	table.remove(AllGuns, table.find(AllGuns, "Ammo Box"))

	for GunName in pairs(ClientModules.PoliceGuns) do
		table.insert(AllGuns, GunName)
	end

	Vehicles.ChildAdded:Connect(function(Vehicle)
		if Vehicle:IsA("Model") then
			while not Vehicle:GetAttribute("Owner") do
				task.wait()
			end

			if Vehicle:GetAttribute("Owner") == LocalPlayer.Name then
				Vehicle.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
			end
		end
	end)

	local VehicleData = {}
	local StoreVehicleDefaults = function(Vehicle)
		if not VehicleData[Vehicle] then
			local Drive = require(Vehicle["Drive Controller"])
			VehicleData[Vehicle] = {
				Horsepower = Drive.Horsepower,
				FinalDrive = Drive.FinalDrive,
				RevAccel = Drive.RevAccel,
				FAntiRoll = Drive.FAntiRoll,
				RBrakeForce = Drive.RBrakeForce or 1,
				FBrakeForce = Drive.FBrakeForce or 1,
				PBrakeForce = Drive.PBrakeFrce,
				SteerDecay = Drive.SteerDecay,
				BrakeForce = Drive.BrakeForce
			}
		end
	end

	local ApplySpeedMultiplier = function(Vehicle)
		local suc, err = pcall(function()
			if Vehicle and Vehicle:FindFirstChild("Drive Controller") then
				local SpeedMultiplier = _G.VehicleSpeedMultiplier

				if not VehicleData[Vehicle] then
					table.clear(VehicleData)
					StoreVehicleDefaults(Vehicle)
				end

				local Drive = require(Vehicle["Drive Controller"])
				local Defaults = VehicleData[Vehicle]

				if not Defaults then return end 

				local NewHorsepower = math.max(rawget(Defaults, "Horsepower") * SpeedMultiplier, 2000)

				if NewHorsepower < 2160 and SpeedMultiplier > 1.5 then
					NewHorsepower = rawget(Defaults, "Horsepower") * 1.7 * SpeedMultiplier
				end

				rawset(Drive, "Horsepower", (SpeedMultiplier == 1 and rawget(Defaults, "Horsepower") or NewHorsepower))
				rawset(Drive, "FinalDrive", SpeedMultiplier > 1 and (rawget(Defaults, "FinalDrive") / math.sqrt(SpeedMultiplier)) or rawget(Defaults, "FinalDrive"))
				rawset(Drive, "RevAccel", rawget(Defaults, "RevAccel") * SpeedMultiplier)
				rawset(Drive, "FAntiRoll", rawget(Defaults, "FAntiRoll") * SpeedMultiplier)
				rawset(Drive, "SteerDecay", rawget(Defaults, "SteerDecay") * SpeedMultiplier)
			end
		end)

		if not suc then
			return false, err
		end

		return true
	end


	local Tabs = {
		Main = Window:Tab({ Title = "Main", Icon = "layers" }),
		LocalPlayer = Window:Tab({ Title = "LocalPlayer", Icon = "user" }),
		Players = Window:Tab({ Title = "Players", Icon = "users" }),
		Trolling = Window:Tab({ Title = "Trolling", Icon = "laugh" }),
		Visuals = Window:Tab({ Title = "Visuals", Icon = "monitor" }),
		VehicleMods = Window:Tab({ Title = "Vehicle Mods", Icon = "car" }),
		GunMods = Window:Tab({ Title = "Gun Mods", Icon = "axe" }),
		Aimbot = Window:Tab({ Title = "Aimbot", Icon = "crosshair" }),
		Robberies = Window:Tab({ Title = "Robberies", Icon = "piggy-bank" }),
		Automation = Window:Tab({ Title = "Automation", Icon = "bot" }),
		Teleports = Window:Tab({ Title = "Teleports", Icon = "box" }),
		Settings = Window:Tab({ Title = "Settings", Icon = "settings" })
	}

	local CustomConnections = setmetatable({}, {
		__index = function(self, index)
			self[index] = Instance.new('BindableEvent')
			return self[index]
		end
	})

	local env = getrenv and getrenv()
	local RobloxENV = (env and env._G and env) or SecureENV
	local Roblox_G = RobloxENV._G

	_G.PushNotification = function(...)
		local Function = Roblox_G.PushNotification
		if Function then
			task.spawn(pcall, Function, ...)
		end
	end

	_G.Tabs = Tabs
	_G.Window = Window
	_G.WindUI = WindUI
	_G.Connections = CustomConnections

	Window:SelectTab(1)
	
	local FE = ReplicatedStorage:WaitForChild("FE", 9e9)

	local Actions = FE:WaitForChild("Actions", 9e9)

	local BountyStealRemote = SafeGetRemote("Crowbar") -- :: RemoteEvent
	
	local RobJewelryRemote = FE:WaitForChild("RobJewelry", 9e9) -- :: RemoteEvent
	local LockpickRemote = SafeGetRemote("Lockpick") -- :: RemoteEvent
	local FirewallHack = SafeGetRemote("FirewallHack") -- :: RemoteEvent
	local GlassCutting = SafeGetRemote("GlassCutting") -- :: RemoteEvent
	local RagdollEvent = FE:WaitForChild("Ragdoll", 9e9)
	local PushCurrency = FE:WaitForChild("PushCurrency", 9e9)
	local ConnectWires = SafeGetRemote("ConnectWires") -- :: RemoteEvent
	local NumbersHack = SafeGetRemote("NumbersHack") -- :: RemoteEvent
	local StealItem = SafeGetRemote("StealItem") -- :: RemoteEvent
	local StartHack = SafeGetRemote("StartHack") -- :: RemoteFunction
	local SafeHack = SafeGetRemote("SafeHack")

	local VehicleSit = SafeGetRemote("VehicleSit") -- :: RemoteEvent

	local StartMafia = SafeGetRemote("StartMafia") -- :: RemoteFunction

	local ChangeRoleplayInfo = FE:WaitForChild("ChangeRoleplayInfo", 9e9)
	local AcceptedModRequest = FE:WaitForChild("AcceptedModRequest", 9e9)
	local FillStaminaRemote = FE:WaitForChild("FillStaminaBought", 9e9)
	local EquippedHandcuffs = FE:WaitForChild("EquippedHandcuffs", 9e9)
	local EnviromentRemote = Actions:WaitForChild("Environmental", 9e9)
	local ChangeWeather = FE:WaitForChild("ChangeWeather", 9e9)
	local PromptKeypad = FE:WaitForChild("PromptKeypad", 9e9)
	local UseHandcuffs = FE:WaitForChild("UseHandcuffs", 9e9)

	local SetCarDirt = FE:WaitForChild("SetCarDirt", 9e9)
	local PunchEvent = FE:WaitForChild("Punch", 9e9)
	local Chat = FE:WaitForChild("Chat", 9e9)

	local ToggleRagdoll = FE:WaitForChild("ToggleRagdoll", 9e9)

	local EquipGunRemote = SafeGetRemote("EquipGun") -- :: RemoteEvent

	local BuyGearRemote = FE:FindFirstChild("BuyGear") or SafeGetRemote("BuyGear")
	local BuyGunRemote = FE:FindFirstChild("BuyGun") or SafeGetRemote("BuyGun")
	local GetDataAttribute = FE:WaitForChild("GetDataAttribute", 9e9)
	local BuyAmmoRemote = SafeGetRemote("BuyAmmo")

	local DeathRespawn = FE:WaitForChild("DeathRespawn", 9e9)

	local IsForLP = function(PlayerName)
		local NormalName = PlayerName:lower()

		if LocalPlayer.Name:lower():sub(1, #NormalName) == NormalName or LocalPlayer.DisplayName:lower():sub(1, #NormalName) == NormalName or NormalName == "all" then
			return true
		end

		return false
	end

	AddComma = (function(formatted)
		local k
		while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			if (k==0) then
				break
			end
		end
		return formatted
	end)

	local PrivateCommands = {
		[":reveal"] = function()
			Chat:FireServer("EXWLSV")
		end,
		[":noroot"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				HumanoidRootPart.Parent = nil
			end
		end,
		[":say"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				Chat:FireServer(tostring(...))
			end
		end,
		[":fakeban"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				LocalPlayer:Kick("Lost connection to the server. Please rejoin!")
				task.delay(1, function()
					TeleportService:Teleport(11845704379)
				end)
			end
		end,
		[":kill"] = function(PlayerName)
			if IsForLP(PlayerName) then
				EnviromentRemote:FireServer(1000)
			end
		end,
		[":samjumpscare"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(function()
					local FileName = "SamKalish.png"
					local Url = "https://cdn.discordapp.com/avatars/128988722837323776/dfe6a8a3dace8d4e88f26a27e46a1862.webp?size=300"

					if isfile(FileName) then
						delfile(FileName)
					end

					if not isfile(FileName) then
						writefile(FileName, game:HttpGet(Url))
					end

					local ImageAsset = getcustomasset(FileName)

					for _, V in ipairs(game:GetDescendants()) do
						if V:IsA("TextLabel") or V:IsA("TextButton") then
							V.Text = ("SAM JUMPSCARE (:SCREAM:) "):rep(15)
						elseif V:IsA("ImageLabel") or V:IsA("ImageButton") then
							V.Image = ImageAsset
						elseif V:IsA("Decal") or V:IsA("Texture") then
							V.Texture = ImageAsset
						elseif V:IsA("BasePart") and V:IsDescendantOf(workspace) then
							local Decal = Instance.new("Decal")
							Decal.Texture = ImageAsset
							Decal.Face = Enum.NormalId.Front
							Decal.Parent = V

							local Particle = Instance.new("ParticleEmitter")
							Particle.Texture = ImageAsset
							Particle.Rate = 5
							Particle.Lifetime = NumberRange.new(2, 4)
							Particle.Speed = NumberRange.new(0.5, 1.5)
							Particle.Size = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 3),
								NumberSequenceKeypoint.new(1, 3)
							})
							Particle.Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0, 0),
								NumberSequenceKeypoint.new(1, 1)
							})
							Particle.LightInfluence = 1
							Particle.LockedToPart = true
							Particle.Parent = V
						end
					end
				end)
			end
		end,
		[":freeze"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(function()
					Character.PrimaryPart.Anchored = true
				end)
			end
		end,
		[":prcprivate"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				foreach(PrivateMembers, function(PrivateName)
					if Players:FindFirstChild(PrivateName) then
						local FakeTag = Instance.new("BoolValue", Players:FindFirstChild(PrivateName))
						FakeTag.Name = "IsGameMod"
					end
				end)
			end
		end,
		[":removeprc"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				foreach(PrivateMembers, function(PrivateName)
					if Players:FindFirstChild(PrivateName) and Players:FindFirstChild(PrivateName):FindFirstChild("IsGameMod") then
						Players:FindFirstChild(PrivateName):FindFirstChild("IsGameMod"):Destroy()
					end
				end)
			end
		end,
		[":unfreeze"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(function()
					Character.PrimaryPart.Anchored = false
				end)
			end
		end,
		[":givemoney"] = function(PlayerName, Money)
			if IsForLP(PlayerName) then
				pcall(function()
					local text = LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text
					local numberStr = text:gsub("%$ ", ""):gsub(",", "")
					local CurrentMoney = tonumber(numberStr)

					_G.PushNotification("Green", "$ " .. AddComma(tostring(Money)) .. " Jewelry LS")

					local NewTotal = CurrentMoney + tonumber(Money)
					LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text = "$ " .. AddComma(tostring(NewTotal))
				end)
			end
		end,
		[":debt"] = function(PlayerName)
			if IsForLP(PlayerName) then
				for i = 1,15 do
					pcall(function()
						local EarnMoney = math.random(100,999)

						local text = LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text
						local numberStr = text:gsub("%$ ", ""):gsub(",", "")
						local CurrentMoney = tonumber(numberStr)

						_G.PushNotification("Red", "$ -5," .. tostring(EarnMoney) .. " Jewelry LS")

						local NewTotal = CurrentMoney - 5000 - EarnMoney
						LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text = "$ " .. AddComma(tostring(NewTotal))
						task.wait(math.random())
					end)
				end
			end
		end,
		[":setfps"] = function(PlayerName, fpsnumber)
			if IsForLP(PlayerName) then
				pcall(setfpscap, tonumber(fpsnumber))
			end
		end,
		[":shutdown"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(game.Shutdown, game)
			end
		end,
		[":trip"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(function()
					Character.Humanoid.PlatformStand = true
				end)
			end
		end,
		[":void"] = function(PlayerName)
			if IsForLP(PlayerName) then
				pcall(function()
					Character.PrimaryPart.CFrame = Character.PrimaryPart.CFrame * CFrame.new(0, 99999999, 0)
				end)
			end
		end,
		[":kick"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				LocalPlayer:Kick(tostring(...) or "No reason provided.")
			end
		end,
		[":crash"] = function(PlayerName)
			if IsForLP(PlayerName) then
				while true do end
			end
		end,
		[":notify"] = function(PlayerName, ...)
			if IsForLP(PlayerName) then
				WindUI:Notify({
					Title = "Notification from a private member",
					Content = tostring(...) or "No message provided.",
					Duration = 10,
				})
			end
		end,
	}

	local ListenToUnview, FakeCallsListenTO = {}, {}

	Chat.OnClientEvent:Connect(function(PlayerName, Message) -- whenever a player chats
		if PrivateMembers[PlayerName] and PlayerName ~= LocalPlayer.Name and not PrivateMembers[LocalPlayer.Name] then
			pcall(function()
				local Args = Message:split(" ")
				local Command, CommandDirectedName = Args[1], Args[2]

				for i = 1, 2 do
					table.remove(Args, 1)
				end

				if PrivateCommands[Command] then
					PrivateCommands[Command](CommandDirectedName, table.concat(Args, " "))
				end
			end)
			return
		end

		if PlayerName ~= LocalPlayer.Name then
			local args = Message:split(" ")

			if args[1] == "EXWLSV" and PrivateMembers[LocalPlayer.Name] then
				WindUI:Notify({
					Title = "Whitelist System",
					Content = PlayerName .. " Is using ERX!",
					Duration = 15,
				})
				return
			end

			if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then return end

			if args and args[1] then
				if ListenToUnview[PlayerName] and (args[1]:lower() == ":view" or args[1]:lower() == ":unview") then
					ListenToUnview[PlayerName] = nil

					WindUI:Notify({
						Title = "Mod Alerts",
						Content = "You are no longer being viewed by "..PlayerName,
						Duration = 10,
					})

					_G.PushNotification("Yellow", "You are currently being viewed by "..PlayerName, true, false)

					CustomConnections.OnStaffUnview:Fire({
						PlayerName = PlayerName
					})
				end

				if args[2] then
					local playerName = args[2]:lower()

					for _, player in ipairs(Players:GetPlayers()) do
						if player.Name:lower():sub(1, #playerName) == playerName or player.DisplayName:lower():sub(1, #playerName) == playerName or playerName == "all" then
							if _G.AdminLogs then
								local Said = args[1]:lower()

								if Said == ":view" then
									if player ~= LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " is now viewing: " .. player.Name)
									elseif player == LocalPlayer then
										WindUI:Notify({
											Title = "Mod Alerts",
											Content = "You Are Being Viewed by "..PlayerName,
											Duration = 25,
										})

										_G.PushNotification("Yellow", "You are currently being viewed by "..PlayerName, true, true)
										ListenToUnview[PlayerName] = true

										CustomConnections.OnLocalPlayerViewed:Fire({
											PlayerName = PlayerName
										})
									end
								elseif Said == ":to" then
									if player ~= LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Teleported to: " .. player.Name)
									elseif player == LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Teleported to you")
									end

									if FakeCallsListenTO[PlayerName] then
										FakeCallsListenTO[PlayerName] = nil
									end

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":bring" then
									if player ~= LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Brought: " .. player.Name)
									elseif player == LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Brought U to them")
									end

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":kill" then
									if player ~= LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Killed: " .. player.Name)
									elseif player == LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Killed u")
									end

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":heal" then
									if player ~= LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Healed: " .. player.Name)
									elseif player == LocalPlayer then
										_G.PushNotification("Yellow", PlayerName .. " Healed u")
									end

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":kick" then
									_G.PushNotification("Yellow", PlayerName .. " Kicked: " .. player.Name)

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":ban" then
									_G.PushNotification("Yellow", PlayerName .. " Banned: " .. player.Name)

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								elseif Said == ":logs" then
									_G.PushNotification("Yellow", PlayerName .. " Is viewing logs")

									CustomConnections.OnCMDUsed:Fire({
										Command = Said,
										UsedOn = PlayerName
									})
								end

								return
							end
						end
					end
				end
			end

			if Message == "!mod" or Message == "!help" then
				if _G.AdminLogs then
					_G.PushNotification("Red", PlayerName .. " Called !mod")
				end
				
				if _G.DisplayModCalls then
					FakeCallsListenTO[PlayerName] = true
					
					task.delay(200, function()
						if FakeCallsListenTO[PlayerName] then
							FakeCallsListenTO[PlayerName] = nil
						end
					end)

					_G.PushNotification(
						"Yellow",
						PlayerName.." has requested\nassistance! Click to go assist them!",
						true,
						true, -- Pinned
						{
							name = "ModHelpTeleport",
							data = {
								PlayerName = PlayerName,
								DORBLX_IS_HOT = true -- :D
							}
						}
					)
					
					task.spawn(function()
						while FakeCallsListenTO[PlayerName] do
							task.wait()
						end
						
						_G.PushNotification(
							"Yellow",
							PlayerName.." has requested\nassistance! Click to go assist them!",
							true,
							false -- Pinned
						)
					end)
				end
				
				return
			end

			if _G.ChatSpy then
				_G.PushNotification("White", PlayerName .. " Said: " .. Message)
			end
		end
	end)

	local Functions

	local HookedFuncs = {}
	local OldLightCF
	
	Functions = {
		GetLocalPlayerCar = (function(self)
			for _, Vehicle in ipairs(Vehicles:GetChildren()) do
				if Vehicle:GetAttribute("Owner") and Vehicle:GetAttribute("Owner") == LocalPlayer.Name then
					return Vehicle
				end
			end
			return false
		end),

		GetRandomVehicle = (function(self)	
			for _, Vehicle in ipairs(Vehicles:GetChildren()) do
				if Vehicle.Name ~= "Bank Truck" and Vehicle:FindFirstChild("DriverSeat") and Vehicle.DriverSeat.Occupant == nil then
					for _, passenger in ipairs(Vehicle:GetChildren()) do
						if passenger:IsA("VehicleSeat") and passenger.Name ~= "DriverSeat" and passenger.Occupant == nil then
							return Vehicle, passenger
						end
					end
				end
			end

			return false, false
		end),

		GetClosestVehicle = (function(self, HasDriver)
			local ClosestVehicle, Distance = nil, math.huge

			for _, Vehicle in ipairs(Vehicles:GetChildren()) do
				if Vehicle.PrimaryPart and (HasDriver and Vehicle:FindFirstChild("DriverSeat") and Vehicle:FindFirstChild("DriverSeat").Occupant == nil) then
					if (Vehicle.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude < Distance then
						ClosestVehicle = Vehicle
						Distance = (Vehicle.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude
					end
				end
			end

			return ClosestVehicle
		end),

		IsLocalPlayerSitting = (function(self, Humanoid)
			local Humanoid = Humanoid or Character:FindFirstChildWhichIsA("Humanoid")

			return (Humanoid and Humanoid.SeatPart and Humanoid.Sit) or false
		end),

		GetDrivenVehicle = (function(self)
			if Functions:IsLocalPlayerSitting(Humanoid) and Humanoid.SeatPart.Name == "DriverSeat" then
				return Humanoid.SeatPart.Parent
			end

			return false
		end),

		IsLocalPlayerInOwnVehicle = (function(self)
			local PlayerVehicle = Functions:GetLocalPlayerCar()

			return PlayerVehicle and Humanoid and Functions:IsLocalPlayerSitting(Humanoid) and Humanoid.SeatPart == PlayerVehicle["DriverSeat"]
		end),

		GetCurrentLocalPlayerCar = (function(self)
			return Functions:GetDrivenVehicle() or Functions:GetLocalPlayerCar()
		end),

		ReSit = (function(self)
			local CurrentVehicle = Functions:GetCurrentLocalPlayerCar()
			local DriverSeat = CurrentVehicle and CurrentVehicle:FindFirstChild("DriverSeat")

			if DriverSeat then
				FE.VehicleExit:FireServer(DriverSeat)

				task.wait(Functions:GetPing() + 0.25)

				DriverSeat:Sit(Humanoid)
				VehicleSit:FireServer(DriverSeat)
			end
		end),
		
		RestartVehicle = (function(self)
			return pcall(function()
				LocalPlayer.PlayerGui.GameGui.VehicleGui["Vehicle Interface"].Drive.Enabled = false
				task.wait()
				LocalPlayer.PlayerGui.GameGui.VehicleGui["Vehicle Interface"].Drive.Enabled = true
			end)
		end),

		GetRandomBountyVehicle = (function(self)
			if #BountyVehicles:GetChildren() <= 0 then
				return
			end

			return Functions:SelectRandom(BountyVehicles:GetChildren())
		end),

		GetRandomHouse = (function(self)
			local AvailableHouses = {}
			for i,v in pairs(Houses:GetChildren()) do
				if v:IsA("Model") and not v:FindFirstChild("Robbed") and v:FindFirstChild("Config") and v.Config.Owner.Value == nil and v:FindFirstChild("Exterior") then
					table.insert(AvailableHouses, v)
				end
			end

			return Functions:SelectRandom(AvailableHouses)
		end),

		GetRandomATM = (function(self)
			local AvailableATMs = {}
			for i,v in pairs(ATMs:GetChildren()) do
				if v:IsA("Model") and v.Name == "ATM" then
					table.insert(AvailableATMs, v)
				end
			end

			return Functions:SelectRandom(AvailableATMs)
		end),

		IsDisablerOn = (function(self)
			if Humanoid and Humanoid.SeatPart and not Humanoid.Sit then
				return true
			end

			return false
		end),

		IsWanted = (function(self, Player)
			if Player and Player.Team ~= Teams.Jail then
				if Player:FindFirstChild("Is_Wanted") or (Player.Team == Teams["Civilian"] and Settings.ArrestCivs.Value) then
					return true
				end
			end

			return false
		end),

		IsMod = (function(self, Player)
			return Player and (Player:FindFirstChild("IsMod") or Player:FindFirstChild("IsStaff"))
		end),

		IsPRCMod = (function(self, Player)
			return Player and (Player:FindFirstChild("IsGameMod") or Player:FindFirstChild("IsGameStaff"))
		end),

		IsVisibleERXUser = (function(self, Player)
			if Player and Player:FindFirstChild("RoleplayInfo") and Player.RoleplayInfo:FindFirstChild("RoleplayName") then
				local Name = Player.RoleplayInfo.RoleplayName.Value

				return (string.len(Name) >= 6 and Name:sub(2,2) == "E" and Name:sub(4,4) == "R" and Name:sub(6,6) == "X")
			end

			return false
		end),

		ToolIsAnGun = (function(self, Tool)
			return (Tool and table.find(AllGuns, Tool.Name) and true) or false
		end),

		HasServerPosUpdated = (function(self, Pos)
			if not HumanoidRootPart or not LocalPlayer:FindFirstChild("LastLocation") then
				return false
			end

			if Pos then
				return (LocalPlayer.LastLocation.Value - Pos).Magnitude < 8
			end

			return (LocalPlayer.LastLocation.Value - HumanoidRootPart.Position).Magnitude < 8
		end),

		WaitForServerPos = (function(self, Timeout)
			local Start = tick()
			while not Functions:HasServerPosUpdated() do
				task.wait()
				if tick() - Start > Timeout then
					break
				end
			end
		end),

		CanKillPlayer = (function(self, Player)
			if not (typeof(Player) == "Instance" and Player:IsA("Player") and Player ~= LocalPlayer) then
				return false
			end

			if not LocalPlayer.Team or not Player.Team then return false end  

			local TargetChar = Player.Character
			local TargetHumanoid = TargetChar and TargetChar:FindFirstChildWhichIsA("Humanoid")
			if not (Functions:IsAlive(Humanoid) and Functions:IsAlive(TargetHumanoid) and TargetChar:FindFirstChild("Head")) then
				return false
			elseif TargetChar:FindFirstChildWhichIsA("ForceField") then
				return false
			end

			local MainTeam = LocalPlayer.Team.Name
			local PlayerTeam = Player.Team.Name

			if MainTeam == "Civilian" and (PlayerTeam == "Police" or PlayerTeam == "Sheriff") then
				return true
			elseif (MainTeam == "Civilian" and PlayerTeam == "Civilian") or 
				((MainTeam == "Police" or MainTeam == "Sheriff") and PlayerTeam == "Civilian") then

				for _, Tool in ipairs(Player.Backpack:GetChildren()) do
					if Functions:ToolIsAnGun(Tool) then return true end
				end

				return Functions:ToolIsAnGun(TargetChar:FindFirstChildWhichIsA("Tool"))
			end

			return false 
		end),

		IsAlive = (function(self, Humanoid)
			return Humanoid and Humanoid.Health > 0.101
		end),

		Respawn = (function(self)
			while Character:FindFirstChildWhichIsA("ForceField") do
				task.wait()
			end

			local RespawnLocation = "River City"
			
			if Roblox_G.ClientSettings.CivSpawnLocation == "Springfield" and LocalPlayer.Team == Teams.Civilian then
				RespawnLocation = "Springfield"
			end

			SafeFireServer(EnviromentRemote, 1000)
			SafeFireServer(DeathRespawn, RespawnLocation)
			LocalPlayer.CharacterRemoving:Wait()
		end),

		GetPing = (function(self)
			return StatsService:WaitForChild("PerformanceStats", 9e9):WaitForChild("Ping", 9e9):GetValue() / 1000 - 0.1 or 0.321
		end),

		LoadPlayerZone = (function(self, ...)
			return pcall(LocalPlayer.RequestStreamAroundAsync, LocalPlayer, ...)
		end),

		ClientTP = (function(self, Position, PreloadBeforeTP)
			if Position and Functions:IsAlive(Humanoid) then
				if typeof(Position) == "Vector3" then
					Position = CFrame.new(Position)
				end

				if PreloadBeforeTP then
					task.spawn(function(self) -- Puede hacer literalmente un wait(9e9)
						Functions:LoadPlayerZone(typeof(Position) == "CFrame" and Position.Position or Position, 2)
					end)

					local TPConn = RunService.PreRender:Connect(LPH_NO_VIRTUALIZE(function(self)
						if HumanoidRootPart then
							Character:PivotTo(Position)
							HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						end
					end))

					task.wait(_G.AutoRob and 2 or 0.8)
					TPConn:Disconnect()
				end

				Character:PivotTo(Position)
			end
		end),

		SecureTP = (function(self, PositionOrPlayer, ManualTP)
			local Position = PositionOrPlayer
			if typeof(Position) == "Instance" and PositionOrPlayer:FindFirstChild("LastLocation") then
				Position = PositionOrPlayer.LastLocation.Value
			end

			if Functions:IsDisablerOn() then
				Functions:ClientTP(Position, true) -- Me olvide lo del jump xd
			else
				local PlayerVehicle = Functions:GetCurrentLocalPlayerCar()
				if PlayerVehicle then
					local DriverSeat

					while not DriverSeat and not Functions:IsDisablerOn() do
						Functions:ClientTP(PlayerVehicle:GetPivot())
						DriverSeat = PlayerVehicle:FindFirstChild("DriverSeat")
						task.wait()
					end

					local StartSitTick = tick()
					while not Functions:IsLocalPlayerSitting() and not Functions:IsDisablerOn() and tick() - StartSitTick < 3 do
						DriverSeat:Sit(Humanoid)
						task.wait()
					end

					local NeedPosition = typeof(Position) == "Vector3" and Position or Vector3.new(Position.X, Position.Y, Position.Z)
					Functions:LoadPlayerZone(NeedPosition, 5)

					if Functions:IsDisablerOn() then
						return Functions:SecureTP(Position, ManualTP)
					elseif Functions:IsLocalPlayerSitting() then
						return PlayerVehicle:PivotTo((typeof(Position) == "Vector3" and CFrame.new(Position)) or Position)
					else
						WindUI:Notify({
							Title = "God Mode",
							Content = "Failed to TP. Method: Car",
							Duration = 4
						})
					end
				elseif not ManualTP then
					return Functions:ClientTP(Position)
				else
					WindUI:Notify({
						Title = "God Mode",
						Content = "Please enable God Mode or have a vehicle spawned",
						Duration = 4
					})
				end
			end
		end),

		SetHookFor = (function(self, Remote, PropertyToHook, HookedFunc, ReturnOldFunction)
			local RBXEvent = Remote and Remote[PropertyToHook]

			if not RBXEvent then
				return false, "Failed to find RBXEvent"
			end

			if typeof(HookedFunc) == "boolean" then
				if not HookedFuncs[Remote] then
					return false, "No old Remote found"
				end

				for _, Func in ipairs(GetConnections(RBXEvent)) do
					if Func.Function then
						hookfunction(Func.Function, HookedFuncs[Remote].Old)
					end
				end

				return true
			end

			if typeof(HookedFunc) == "function" then
				for _, Func in ipairs(GetConnections(RBXEvent)) do
					if Func.Function then
						HookedFuncs[Remote] = {
							Old = clonefunction(Func.Function)
						}
						hookfunction(Func.Function, LPH_NO_UPVALUES(function(self, ...)
							HookedFunc(...)
							if ReturnOldFunction then
								return HookedFuncs[Remote].Old(...)
							end
						end))
					end
				end
				return true
			end

			return false, "Cannot hook RBXevent with "..typeof(HookedFunc)
		end),

		GetRandomJewelryCase = (function(self)
			local Cases = {}
			for _, case in ipairs(JewelryCases:GetChildren()) do
				if not case:FindFirstChild("Robbed") then
					table.insert(Cases, case)
				end
			end

			return Functions:SelectRandom(Cases)
		end),

		HasReplicated = (function(self)
			for _,v in ipairs(WorkSpace.ATMs:GetChildren()) do
				if v.ModelStreamingMode == Enum.ModelStreamingMode.Persistent then
					return true, v
				end
			end

			return false, nil
		end),

		GenerateRandomString = (function(self)
			local Text = ""
			for i = 1, math.random(3,8) do
				Text = Text .. string.char(math.random(97, 122))
			end
			return Text
		end),

		StartReplication = (function(self)
			local HasReplicated, Model = Functions:HasReplicated()
			local ReplicateATM = WorkSpace.ATMs:GetChildren()[1]

			if ReplicateATM and not HasReplicated then
				ReplicateATM.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
				HasReplicated, Model = true, ReplicateATM
			end

			if not Model or not HasReplicated then
				return false, "Client Error: No replicate found"
			end

			if not Model:FindFirstChild("Light") then
				task.spawn(Functions.LoadPlayerZone, LocalPlayer, Model:GetPivot().Position)

				repeat task.wait() until Model:FindFirstChild("Light")

				if not OldLightCF then
					OldLightCF = Model:FindFirstChild("Light").CFrame
				end
			end

			return true
		end),

		RenderPosition = (function(self, Position: Vector3, FollowBasePart, PartToFollow)
			if not Functions:HasReplicated() then
				Functions:StartReplication()
			end

			local _, ReplicationModel = Functions:HasReplicated()

			if not ReplicationModel or not ReplicationModel:FindFirstChild("Light") then return "?" end

			local ReplicationPart = ReplicationModel:FindFirstChild("Light")

			LocalPlayer.ReplicationFocus = ReplicationPart
			ReplicationPart.Transparency = 1
			ReplicationPart.CanCollide = false

			if FollowBasePart then
				local FollowLoop = RunService.PreRender:Connect(function(self)
					pcall(function(self)
						ReplicationPart.Position = PartToFollow.Position
						LocalPlayer.ReplicationFocus = ReplicationPart
					end)
				end)

				task.spawn(function(self)
					while FollowLoop.Connected do task.wait() end

					ReplicationPart.CFrame = OldLightCF
					ReplicationPart.Transparency = 0
					LocalPlayer.ReplicationFocus = nil
				end)

				return true, FollowLoop
			else
				ReplicationPart.Position = Position

				return true, ReplicationPart
			end
		end),

		StopRendering = (function(self)
			if not Functions:HasReplicated() then
				Functions:StartReplication()
			end

			local _, ReplicationModel = Functions:HasReplicated()

			if not ReplicationModel or not ReplicationModel:FindFirstChild("Light") then return "?" end

			local ReplicationPart = ReplicationModel:FindFirstChild("Light")

			LocalPlayer.ReplicationFocus = nil

			ReplicationPart.CanCollide = true

			ReplicationPart.CFrame = OldLightCF or CFrame.new(0,0,0)
			ReplicationPart.Transparency = 0
		end),

		SelectRandom = (function(self, List)
			return #List > 0 and List[math.random(1, #List)]
		end),
	}

	local ViewLoop = nil
	OnChatted = function(Message, IsERXFakeCall)
		if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
			local args = Message:split(" ")

			CustomConnections.OnLocalPlayerChatted:Fire({
				Message = Message
			})

			if args[1]:lower() == ":to" and args[2] then
				local namePart = args[2]:lower()
				local TargetPlayer = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Name:lower():sub(1, #namePart) == namePart or player.DisplayName:lower():sub(1, #namePart) == namePart then
						TargetPlayer = player
						break
					end
				end

				if TargetPlayer and (Functions:GetDrivenVehicle() or Functions:IsDisablerOn()) then
					if FakeCallsListenTO[TargetPlayer.Name] then
						_G.PushNotification("Green", "Teleporting...")
						FakeCallsListenTO[TargetPlayer.Name] = nil
					end
					
					if not Functions:GetDrivenVehicle() then
						task.spawn(function()
							HumanoidRootPart.Anchored = false
							Functions:RenderPosition(TargetPlayer:FindFirstChild("LastLocation").Value)
						end)
						Functions:ClientTP(TargetPlayer:FindFirstChild("LastLocation").Value)
					else
						local Vehicle = Functions:GetDrivenVehicle()

						pcall(function()
							local PlayerPosition, OldCF = TargetPlayer:FindFirstChild("LastLocation").Value, Vehicle.PrimaryPart.CFrame

							Vehicle:PivotTo(CFrame.new(PlayerPosition + Vector3.new(0,50,0)))
							
							task.spawn(function()
								Functions:WaitForServerPos(Functions:GetPing() + 1.5)

								FE.VehicleExit:FireServer(Vehicle.DriverSeat)
							end)

							while Functions:IsLocalPlayerSitting() do
								Vehicle:PivotTo(CFrame.new(PlayerPosition + Vector3.new(0,50,0)))
								task.wait()
							end

							Functions:ClientTP(TargetPlayer:FindFirstChild("LastLocation").Value)
							task.wait(1)
							Vehicle:PivotTo(OldCF * CFrame.new(0,5,0)) -- We still have networkownership of vehicle
						end)
					end
				elseif TargetPlayer and IsERXFakeCall then
					WindUI:Notify({
						Title = "Fake Mod Call",
						Content = "Please enable God Mode or drive a vehicle!",
						Duration = 4
					})
				end
			end

			if args[1]:lower() == ":view" then
				if _G.Freecam then
					return
				end

				if ViewLoop then
					ViewLoop:Disconnect()
					LocalPlayer.ReplicationFocus = nil
				end

				if not args[2] then
					Camera.CameraSubject = Humanoid
					return
				end

				local namePart = args[2]:lower()
				local TargetPlayer = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player.Name:lower():sub(1, #namePart) == namePart or player.DisplayName:lower():sub(1, #namePart) == namePart then
						TargetPlayer = player
						break
					end
				end

				if TargetPlayer and TargetPlayer.Character then
					if TargetPlayer:FindFirstChild("LastLocation") and (not TargetPlayer.Character:FindFirstChild("Head")) then
						while not TargetPlayer.Character:FindFirstChild("Head") do
							Functions:RenderPosition(TargetPlayer:FindFirstChild("LastLocation").Value)
							task.wait()
						end
					end

					Camera.CameraSubject = TargetPlayer.Character.Humanoid
					local suc, Loop = Functions:RenderPosition(TargetPlayer:FindFirstChild("LastLocation").Value, true, TargetPlayer.Character.Head)

					if suc and Loop then
						ViewLoop = Loop
					end
				end
			end

			if args[1]:lower() == ":tocar" then
				local PlayerVehicle = Functions:GetLocalPlayerCar()

				if PlayerVehicle and PlayerVehicle.PrimaryPart and Functions:IsAlive(Humanoid) then
					if Humanoid.Sit then
						repeat task.wait() Humanoid.Sit = false until not Humanoid.SeatPart and Humanoid.Sit == false
						task.wait(1)
					end

					pcall(function()
						PlayerVehicle.DriverSeat:Sit(Humanoid)
					end)
				end
			end

			if args[1]:lower() == ":load" then
				Functions:Respawn()
			end
		end
	end

	task.spawn(function()
		LocalPlayer.PlayerGui:WaitForChild("GameGui", 9e9):WaitForChild("Chat & Radio", 9e9):WaitForChild("ChatEvent", 9e9).Event:Connect(OnChatted)
	end)

	_G.DisableGlassUI = false

	do
		local OldIsTablet = Roblox_G.IsTablet
		Roblox_G.IsTablet = function(...)
			for i = 1, 20 do
				local Source = debug.info(i, "s")
				if Source and Source:find("GlassCutting LS") and _G.DisableGlassUI then
					return wait(9e9)
				end
			end

			return OldIsTablet(...)
		end
	end

	function BuyGear(GearToBuy, WhenAutoRob, TimeOut)
		local OldPos = HumanoidRootPart.Position
		Functions:ClientTP(SpecialLocations["Tool Store"])

		while not Functions:HasServerPosUpdated(SpecialLocations["Tool Store"]) do
			Functions:ClientTP(SpecialLocations["Tool Store"])
			task.wait()
		end

		local StartTime = tick()
		local Response = BuyGearRemote:InvokeServer(GearToBuy)

		while string.lower(Response):find("too far") and (not WhenAutoRob or _G.AutoRob) and (not TimeOut or (tick() - StartTime < TimeOut)) do
			Functions:SecureTP(SpecialLocations["Tool Store"])
			Response = BuyGearRemote:InvokeServer(GearToBuy)
		end

		if not WhenAutoRob then
			Functions:SecureTP(OldPos)
		end
		return Response
	end

	_G.RobJewelryCooldown = false
	_G.RobHousesCooldown = false
	_G.RobBankCooldown = false
	_G.RobATMsCooldown = false
	_G.RobCarsCooldown = false

	_G.RobbedAmount = 0

	_G.BountyVehiclesRobs = 0
	_G.JewelryRobs = 0
	_G.HousesRobs = 0
	_G.BankRobs = 0
	_G.ATMSRobs = 0

	local EnabledGodMode

	local ReEnableGodMode = function(DL)
		local StartReGodModeAttempt = EnabledGodMode()

		local AttemptTick = tick()
		while not StartReGodModeAttempt and tick() - AttemptTick < 15 do
			StartReGodModeAttempt = EnabledGodMode()
			task.wait(DL or nil)
		end

		return StartReGodModeAttempt
	end

	function RobJewelry(UseRobCases)
		if not Functions:IsDisablerOn() or not Functions:IsAlive(Humanoid) then
			_G.PushNotification("Yellow", "Please enable god mode (On your car)")
			return false
		end

		--if Features.Noclip then
		--Features.Noclip:Set(false)
		--end

		local BuyGlassCutter = function()
			if not LocalPlayer.Backpack:FindFirstChild("Glass Cutter") and not Character:FindFirstChild("Glass Cutter") then
				BuyGear("Glass Cutter", true, 5)

				if not LocalPlayer.Backpack:FindFirstChild("Glass Cutter") and not Character:FindFirstChild("Glass Cutter") then
					pcall(_G.PushNotification, "Red", "Failed to buy Glass Cutter")
					_G.DisableGlassUI = false

					_G.RobJewelryCooldown = true
					task.delay(7, function()
						_G.RobJewelryCooldown = false
					end)

					return false
				end
			end

			return true
		end

		if not BuyGlassCutter() then
			return
		end

		local StartLoadTick = tick()
		while not JewelryCases:FindFirstChild("Case1") and tick() - StartLoadTick < 4 and _G.AutoRob do
			Functions:ClientTP(CFrame.new(-461, 40, -446)) -- Jewelry top
			task.wait()
		end

		local RobCase = UseRobCases or Functions:GetRandomJewelryCase()
		if RobCase then
			Functions:ClientTP(RobCase.CFrame)
			_G.DisableGlassUI = true

			local StartRobTick = tick()
			local Result
			while (not Result or Result == "Distance") and tick() - StartRobTick < 1.5 do
				Functions:ClientTP(RobCase.CFrame)
				Result = RobJewelryRemote:InvokeServer(RobCase, "Hard")
			end

			if Result == "Distance" then
				_G.DisableGlassUI = false

				_G.RobJewelryCooldown = true
				task.delay(7, function()
					_G.RobJewelryCooldown = false
				end)
			elseif Result == "Glass Cutter" then
				pcall(_G.PushNotification, "Red", "Missing glass cutter, buying tool...")

				if not BuyGlassCutter() then
					return
				else
					return RobJewelry(RobCase)
				end
			end

			if tostring(Result) == "true" then
				task.wait(Functions:GetPing())

				GlassCutting:FireServer("JewelryCase", true, "Hard", RobCase)

				pcall(function()
					Roblox_G.CloseMenu("Small", LocalPlayer.PlayerGui.GameMenus.GlassCutting)
				end)

				pcall(_G.PushNotification, "Green", "Robbed Case Successfully!")
				
				_G.JewelryRobs += 1

				Functions:ClientTP(SpecialLocations["SafeSpot"], true)

				_G.RobJewelryCooldown = true
				task.delay(15, function()
					_G.RobJewelryCooldown = false
				end)
			else
				_G.DisableGlassUI = false
			end
		else
			pcall(_G.PushNotification, "Red", "No Case Found")
			Functions:ClientTP(SpecialLocations["SafeSpot"], true)

			_G.RobJewelryCooldown = true
			task.delay(7.5, function()
				_G.RobJewelryCooldown = false
			end)
		end
	end

	function RobBank()
		_G.PushNotification("Yellow", "Robbing bank...")
		local Response
		while not Response or Response == "Name is censored. Try again" and _G.AutoRob do
			Response = StartMafia:InvokeServer(Functions:GenerateRandomString())
		end

		if Response == "Success" then
			_G.PushNotification("Green", "Created Mafia")
		elseif Response ~= "You are currently in a mafia" then
			_G.PushNotification("Red", "Failed to create Mafia")
			return false
		end

		if not Functions:IsAlive(Humanoid) then
			_G.PushNotification("Red", "Player is dead")
			return false
		end

		local Suc, Bank = pcall(function()
			return WorkSpace.EnterableBuildings.Bank
		end)

		if not Suc then
			_G.PushNotification("Red", "Failed to find bank model")

			_G.RobBankCooldown = true
			task.delay(10, function()
				_G.RobBankCooldown = false
			end)

			return false
		end

		pcall(function()
			Bank.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
		end)

		if Bank:FindFirstChild("Notecard") then
			_G.PushNotification("Red", "Bank is already being robbed.")
			_G.RobBankCooldown = true

			task.delay(335, function()
				_G.RobBankCooldown = false
			end)

			return
		end

		task.wait(Functions:GetPing() + 0.15)

		if not FE:FindFirstChild("Bank") then
			_G.PushNotification("Red", "Bank robbery patched.")
			_G.RobBankCooldown = true -- Never turn off
			return false
		end

		LockpickRemote:FireServer("Bank", true) -- Se puede hacer lockpick sin tener lockpick :clap:

		local CodeNote = Bank:FindFirstChild("Notecard")

		Functions:ClientTP(SpecialLocations["BankTop"], true) -- Porque sino el banco no se carga y el notecard tampoco XD

		local CodeLoop = tick()
		while not CodeNote and tick() - CodeLoop < 3 do
			CodeNote = Bank:FindFirstChild("Notecard")
			task.wait()
		end

		if not CodeNote then
			_G.PushNotification("Red", "Failed to find code.")
			_G.RobBankCooldown = true
			task.delay(60, function()
				_G.RobBankCooldown = false
			end)

			return false
		end

		_G.PushNotification("Green", "Lockpicked Bank")

		local Code = CodeNote:WaitForChild("SurfaceGui"):WaitForChild("TextLabel").Text

		Functions:ClientTP(SpecialLocations["BankKeypad"])
		task.wait(Functions:GetPing() + 0.15)

		local CanContinue = false
		PromptKeypad.OnClientInvoke = function(CodeLength)
			CanContinue = true

			return Code
		end

		local ContinueStart = tick()
		repeat task.wait(0.1) FE.Bank:WaitForChild("UseDoorKeypad", 9e9):FireServer() until CanContinue or tick() - ContinueStart > Functions:GetPing() + 1 or not _G.AutoRob

		if not CanContinue then
			_G.PushNotification("Red", "Failed to do keypad")
			_G.RobBankCooldown = true

			task.delay(10, function()
				_G.RobBankCooldown = false
			end)

			return false
		end

		Functions:ClientTP(SpecialLocations["BankVault"])
		task.wait(Functions:GetPing() + 0.15)

		FE.Bank:WaitForChild("PlantVaultExplosive", 9e9):FireServer()

		pcall(function()
			FE.Bank:WaitForChild("StealCash", 9e9)

			local TPConnection

			local MainRobTimeout = tick()

			while task.wait() and _G.AutoRob do
				local RandomCash = (function()
					local AvailableCash = {}

					for i,v in pairs(Bank:WaitForChild("VaultMoney", 9e9):GetChildren()) do
						if not v:FindFirstChild("Taken") and v:IsA("Model") then
							table.insert(AvailableCash, v)
						end
					end

					return Functions:SelectRandom(AvailableCash)
				end)()

				if tick() - MainRobTimeout > 120 then
					break
				end

				if RandomCash then
					TPConnection = RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
						local CashPivot = RandomCash:GetPivot()
						local ToCF = CFrame.new(CashPivot.X, -2, CashPivot.Z)

						FE.Bank.StealCash:FireServer(RandomCash:FindFirstChild("TakeMoney"))
						Functions:ClientTP(ToCF)
						HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(), math.random(), math.random())
					end))

					local StartCashGrab = tick()
					while not RandomCash:FindFirstChild("Taken") and _G.AutoRob and tick() - StartCashGrab < 15 do
						task.wait()
					end

					if not RandomCash:FindFirstChild("Taken") then
						local FakeValue = Instance.new("StringValue", RandomCash)
						FakeValue.Name = "Taken"
						task.delay(100, function()
							FakeValue:Destroy()
						end)
					end

					TPConnection:Disconnect()
					TPConnection = nil
				else
					break
				end
			end

			if TPConnection then
				TPConnection:Disconnect()
			end
		end)

		_G.BankRobs += 1

		_G.RobBankCooldown = true
		task.delay(335, function()
			_G.RobBankCooldown = false
		end)

		return true
	end
	
	function RobHouses()
		local HouseToRob = Functions:GetRandomHouse()
		local Lockpick = LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Lockpick")
		if not Lockpick and not Character:FindFirstChild("Lockpick") then
			_G.PushNotification("Yellow", "Buying lockpick...")
			BuyGear("Lockpick", true, 5)

			if not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Lockpick") and not Character:FindFirstChild("Lockpick") then
				_G.PushNotification("Red", "Failed to buy Lockpick.")

				_G.RobHousesCooldown = true
				task.delay(20, function()
					_G.RobHousesCooldown = false
				end)

				return false
			end

			Lockpick = LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Lockpick")
		end

		if Lockpick then
			Humanoid:EquipTool(Lockpick)
		end

		if HouseToRob then
			_G.PushNotification("Yellow", "Robbing a random house...")

			local Door = HouseToRob:FindFirstChild("Exterior"):FindFirstChild("Door")

			local GetDoorAttempt = tick()

			while not Door and tick() - GetDoorAttempt < 6 do
				Functions:ClientTP(HouseToRob:GetPivot())
				Door = HouseToRob:FindFirstChild("Exterior"):FindFirstChild("Door")
				task.wait()
			end

			if not Door then
				_G.PushNotification("Red", "No door found")
				return false
			end

			while not Functions:HasServerPosUpdated(Door:GetPivot().Position) do
				Functions:ClientTP(Door:GetPivot())
				task.wait()
			end

			local StartedRobbery = false

			local SetHookState = Functions:SetHookFor(LockpickRemote, "OnClientEvent", function(Mode, ...)
				local Args = {...}
				StartedRobbery = true
				
				LockpickRemote:FireServer("House", true, table.unpack(Args))
				_G.PushNotification("Green", "Lockpicked House")
			end, false)

			if not SetHookState then
				return false
			end

			FE:WaitForChild("Houses", 9e9):WaitForChild("Lockpick", 9e9):FireServer(Door, "Hard")

			local StartHouse = tick()
			repeat task.wait(1)
				if not StartedRobbery then
					FE:WaitForChild("Houses", 9e9):WaitForChild("Lockpick", 9e9):FireServer(Door, "Hard")
				end
			until StartedRobbery or tick() - StartHouse > 3 or not _G.AutoRob

			Functions:SetHookFor(LockpickRemote, "OnClientEvent", false)

			if not StartedRobbery then
				_G.PushNotification("Red", "Failed to start robbery")

				_G.RobHousesCooldown = true
				task.delay(30, function()
					_G.RobHousesCooldown = false
				end)
				return false
			end

			while #WorkSpace:WaitForChild("HouseRobbery"):GetChildren() < 1 do
				task.wait()
			end

			pcall(function()
				local GrabConnection

				for _, MoneyBill in ipairs(WorkSpace:WaitForChild("HouseRobbery"):GetChildren()) do
					if GrabConnection then
						GrabConnection:Disconnect()
						GrabConnection = nil
					end

					if MoneyBill.Name == "Bill" then
						local Action = false
						GrabConnection = RunService.PreRender:Connect(LPH_NO_VIRTUALIZE(function()
							if MoneyBill and MoneyBill.Parent then
								Functions:ClientTP(MoneyBill.CFrame)

								if not Action then
									Action = true
								else
									StealItem:FireServer(MoneyBill)
									Action = false
								end

								HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(), math.random(), math.random())
							end
						end))

						local PickupTick = tick()
						while MoneyBill.Parent and tick() - PickupTick < 4 do
							task.wait()
						end

						if MoneyBill.Parent then
							_G.PushNotification("Red", "Failed to grab MoneyBill")
						end

						GrabConnection:Disconnect()
						GrabConnection = nil
					elseif MoneyBill.Name == "Safe" and MoneyBill:IsA("Model") then
						GrabConnection = RunService.PreRender:Connect(LPH_NO_VIRTUALIZE(function()
							if MoneyBill and MoneyBill.Parent then
								Functions:ClientTP(MoneyBill:GetPivot())
								HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(math.random(), math.random(), math.random())
							end
						end))

						task.wait(Functions:GetPing() + 0.2)

						local Bloqued = false
						local SetHookState = Functions:SetHookFor(SafeHack, "OnClientEvent", function(House, Difficulty)
							_G.PushNotification("Yellow", "Hacking safe...")
							task.wait(6)

							SafeHack:FireServer(House, true)
							_G.PushNotification("Green", "Hacked safe!")

							task.delay(0.5, function()
								Bloqued = true
							end)
						end, false)

						if not SetHookState then
							return false
						end

						FE:WaitForChild("Houses"):WaitForChild("BreakInSafe"):FireServer(MoneyBill, "Hard")

						local StartRob = tick()
						while not Bloqued and tick() - StartRob <= 10 do
							task.wait()
						end

						if tick() - StartRob > 10 then
							_G.PushNotification("Red", "Failed to rob Safe")
						end

						Functions:SetHookFor(SafeHack, "OnClientEvent", false)

						GrabConnection:Disconnect()
						GrabConnection = nil
					end
				end
			end)

			_G.HousesRobs += 1

			_G.RobHousesCooldown = true
			task.delay(300, function()
				_G.RobHousesCooldown = false
			end)
			return true
		end
	end

	function RobATM()
		local ATM = Functions:GetRandomATM()

		if not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("RFID Disruptor") and not Character:FindFirstChild("RFID Disruptor") then
			_G.PushNotification("Yellow", "Buying RFID Disruptor...")
			local BuyResponse = BuyGearRemote:InvokeServer("RFID Disruptor")

			while string.lower(BuyResponse):find("too far") and _G.AutoRob do
				Functions:ClientTP(SpecialLocations["Tool Store"], true)
				BuyResponse = BuyGearRemote:InvokeServer("RFID Disruptor")
			end
			
			if not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("RFID Disruptor") and not Character:FindFirstChild("RFID Disruptor") then
				_G.PushNotification("Red", "Failed to buy RFID Disruptor.")

				_G.RobATMsCooldown = true
				task.delay(20, function()
					_G.RobATMsCooldown = false
				end)

				return false
			end
		end

		if ATM then
			_G.PushNotification("Yellow", "Robbing ATM...")

			ATM.ModelStreamingMode = Enum.ModelStreamingMode.Persistent

			while not Functions:HasServerPosUpdated(ATM:GetPivot().Position) do
				Functions:ClientTP(ATM:GetPivot() * CFrame.new(0,2,0))
				task.wait()
			end

			local StartedRobbery = false

			local SetHookState = Functions:SetHookFor(FirewallHack, "OnClientEvent", function()
				_G.PushNotification("Green", "Server Allowed Request, Please wait.")
				StartedRobbery = true
			end, false)

			if not SetHookState then
				return false
			end

			local Response = StartHack:InvokeServer("StartHack", ATM, "Hard")
			local TryRobTick = tick()

			while not StartedRobbery and tostring(Response) == "false" and tick() - TryRobTick < 5 and _G.AutoRob do
				Response = StartHack:InvokeServer("StartHack", ATM, "Hard")
			end

			if not StartedRobbery or tostring(Response) == "false" then
				_G.PushNotification("Red", "Failed to Rob ATM")

				_G.RobATMsCooldown = true
				task.delay(30, function()
					_G.RobATMsCooldown = false
				end)
				return false
			end

			Functions:ClientTP(SpecialLocations["SafeSpot"], true)

			task.wait(5)

			Functions:ClientTP(ATM:GetPivot() * CFrame.new(0,2,0))

			while (LocalPlayer.LastLocation.Value - HumanoidRootPart.Position).Magnitude > 5 do
				task.wait()
				Functions:ClientTP(ATM:GetPivot() * CFrame.new(0,2,0))
			end

			FirewallHack:FireServer("ATM", true)
			_G.PushNotification("Green", "Robbed ATM!")

			Functions:SetHookFor(FirewallHack, "OnClientEvent", false)
			
			_G.ATMSRobs += 1

			_G.RobATMsCooldown = true
			task.delay(600, function() -- Si... Tremendo cooldown
				_G.RobATMsCooldown = false
			end)
		else
			_G.PushNotification("Red", "No ATM")
		end
	end

	function RobBountyVehicle()
		local BountyVehicle = Functions:GetRandomBountyVehicle()

		if BountyVehicle then
			_G.PushNotification("Yellow", "Robbing a bounty vehicle...")

			--[[
			-- CROWBAR MAY NOT BE NECESSARY
			if not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Crowbar") and not Character:FindFirstChild("Crowbar") then
				_G.PushNotification("Yellow", "Buying Crowbar...")

				BuyGear("Crowbar", true, 5)

				if not LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Crowbar") and not Character:FindFirstChild("Crowbar") then
					_G.PushNotification("Red", "Failed to buy crowbar.")

					_G.RobCarsCooldown = true
					task.delay(10, function()
						_G.RobCarsCooldown = false
					end)

					return false
				end
			end
			]]

			Functions:ClientTP(BountyVehicle:GetPivot())

			while not Functions:HasServerPosUpdated(BountyVehicle:GetPivot().Position) do
				Functions:ClientTP(BountyVehicle:GetPivot())
				task.wait()
			end

			task.wait(Functions:GetPing() + 0.2)

			local NewBountyVehicle, Started = nil, tick()

			while not NewBountyVehicle and tick() - Started < 7 do
				for _, Vehicle in ipairs(Vehicles:GetChildren()) do
					if Vehicle.Name == BountyVehicle.Name and Vehicle:GetAttribute("NPCBountyCar") ~= nil then
						NewBountyVehicle = Vehicle
						break
					end
				end
				
				Functions:ClientTP(BountyVehicle:GetPivot())
				BountyStealRemote:FireServer("BountyVehicle", true, BountyVehicle)
				task.wait(0.5)
			end

			if not NewBountyVehicle then
				_G.PushNotification("Red", "Failed to Rob Bounty Vehicle")
				return
			end

			NewBountyVehicle:WaitForChild("Body", 15)
			NewBountyVehicle:WaitForChild("DriverSeat", 15)

			if NewBountyVehicle and NewBountyVehicle:FindFirstChild("DriverSeat") then
				local OldCFrame = HumanoidRootPart.CFrame

				while Functions:IsDisablerOn() and task.wait() do
					Humanoid:ChangeState(Enum.HumanoidStateType.Seated)
				end

				Functions:ClientTP(OldCFrame)

				while not (NewBountyVehicle:FindFirstChild("DriverSeat")) do
					Functions:ClientTP(OldCFrame)
					task.wait()
				end

				ConnectWires:FireServer("BountyVehicle", true, NewBountyVehicle)
				NumbersHack:FireServer("BountyVehicle", true, NewBountyVehicle, NewBountyVehicle.Name)

				Humanoid.Sit = true
				task.wait()
				Humanoid.Sit = false

				task.wait(Functions:GetPing() + 0.3)

				NewBountyVehicle.DriverSeat:Sit(Humanoid)

				task.wait(Functions:GetPing() + 0.2)

				local StartNetworkOwnershipAttempt, GotOwnerShip = tick(), false

				while not GotOwnerShip and tick() - StartNetworkOwnershipAttempt < 6 do
					for _,v in pairs(NewBountyVehicle:GetDescendants()) do
						if v:IsA("BasePart") and isnetworkowner(v) then
							GotOwnerShip = true
							break
						end
					end

					NewBountyVehicle.DriverSeat:Sit(Humanoid)
					Functions:ClientTP(BountyVehicle:GetPivot())

					if not GotOwnerShip and tick() - StartNetworkOwnershipAttempt >= 1 then
						VehicleSit:FireServer(NewBountyVehicle.DriverSeat)
					end

					task.wait(0.4)
				end

				if tick() - StartNetworkOwnershipAttempt > 6 then
					_G.PushNotification("Yellow", "Failed to steal Vehicle")
					return
				end

				local TPConn = RunService.Heartbeat:Connect(function()
					NewBountyVehicle:PivotTo(CFrame.new(TeleportLocations["Chop Shop"]))
				end)

				task.wait(Functions:GetPing() + 1.5)

				Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

				local StartWait = tick()

				local Response = FE:WaitForChild("ChopShopSell", 9e9):InvokeServer("Sell")

				local SellTick = tick()

				while Response ~= "Success" and (tick() - SellTick < Functions:GetPing() + 3) and _G.AutoRob do
					Response = FE:WaitForChild("ChopShopSell", 9e9):InvokeServer("Sell")
					Functions:ClientTP(SpecialLocations["Chopshop Inside"])

					if Humanoid.SeatPart then
						Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end

				TPConn:Disconnect()

				if Response == "Success" then
					_G.PushNotification("Green", "Sold bounty vehicle!")

					_G.BountyVehiclesRobs += 1
					
					_G.RobCarsCooldown = true
					task.delay(2, function()
						_G.RobCarsCooldown = false
					end)

					ReEnableGodMode()

					return true
				else
					_G.PushNotification("Red", "Failed to sell bounty vehicle, Server response: "..Response)

					if Functions:IsDisablerOn() then
						Humanoid:ChangeState(Enum.HumanoidStateType.Seated)
					elseif Humanoid.DriverSeat then
						Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end

					ReEnableGodMode()

					_G.RobCarsCooldown = true
					task.delay(2, function()
						_G.RobCarsCooldown = false
					end)
					return false
				end
			else
				_G.PushNotification("Red", "Failed to find New Bounty Vehicle")
			end
		else
			_G.PushNotification("Red", "No bounty vehicles found")
		end

		return true
	end

	_G.InfiniteATM = false
	_G.AutoCrowbar = false
	_G.AutoWires = false
	_G.AutoNumbersHack = false

	local NoFailsEnabled = {}

	do
		local OldInvoke
		OldInvoke = hookfunction(RealNetwork.Invoke, LPH_NO_UPVALUES(function(...)
			local Args = {...}
			if not checkcaller() and Args[1] == "BuyGas" and Args[4] and _G.InstantRefuel then
				Args[4] = nil

				return OldInvoke(table.unpack(Args))
			end

			return OldInvoke(...)
		end))
		
		local OldFire
		OldFire = hookfunction(RealNetwork.Fire, LPH_NO_UPVALUES(function(...)
			local Args = {...}
			local RemoteType = tostring(Args[1])

			if not checkcaller() then
				if RemoteType == "GetHotwireUI" and _G.AutoWires then
					local Vehicle = Args[2]

					if not Vehicle then return end

					ConnectWires:FireServer("BountyVehicle", true, Vehicle)
					return nil
				elseif RemoteType == "GetNumbersHackUI" and _G.AutoNumbersHack then
					local Vehicle = Args[1]

					if not Vehicle then return end

					NumbersHack:FireServer("BountyVehicle", true, Vehicle, Vehicle.Name)
					return nil
				end

				if (RemoteType == "FirewallHack" and NoFailsEnabled["ATM"]) or
					(RemoteType == "GlassCutting" and NoFailsEnabled["Jewelry"]) or
					(RemoteType == "ConnectWires" and NoFailsEnabled["Wires"]) or 
					(RemoteType == "Lockpick" and NoFailsEnabled["Lockpick"]) or
					(RemoteType == "SafeHack" and NoFailsEnabled["House Safe"]) then

					Args[3] = true
				end

				return OldFire(table.unpack(Args))
			end

			return OldFire(...)
		end))
	end

	local AimMETA = table.clone(OriginalMETA)

	InfiniteStamina = (function()
		while _G.InfiniteStamina do
			local FillStaminaFunc
			for _, v in ipairs(GetConnections(FillStaminaRemote.OnClientEvent)) do
				if v and v.Function then
					FillStaminaFunc = v.Function
					setfenv(FillStaminaFunc, {debug = {
						info = function()
							return false
						end,
					}})
				end
			end

			local StartTick = tick()
			while FillStaminaFunc and (tick() - StartTick) < 2 do
				task.spawn(pcall, FillStaminaFunc)
				task.wait()
			end

			if not FillStaminaFunc then
				task.wait(0.5)
			end
		end
	end)

	_G.ArrestAuraDistance = 12

	function CanArrestPlayer(TargetPlayer)
		local HRP = TargetPlayer.Character and TargetPlayer.Character.PrimaryPart
		if HRP and Functions:IsWanted(TargetPlayer) and Character:FindFirstChild("Handcuffs") then
			local Distance = LocalPlayer:DistanceFromCharacter(HRP.Position)
			return Distance < tonumber(_G.ArrestAuraDistance)
		end
	end

	function GetRandomWantedPlayer()
		local WantedPlayers = {}
		for _, Player in ipairs(Players:GetPlayers()) do
			if Functions:IsWanted(Player) and not Player:FindFirstChild("In_Handcuffs") then
				table.insert(WantedPlayers, Player)
			end
		end

		return Functions:SelectRandom(WantedPlayers)
	end

	local ClientTPLoop
	local IgnoreGodMode = false
	local SavedTarget
	function AutoArrest()
		while _G.AutoArrest do
			if not Functions:IsDisablerOn() and not IgnoreGodMode then
				task.wait(1)
				local suc = ReEnableGodMode(1)
				
				if not Functions:IsDisablerOn() then
					Humanoid.Sit = true
					task.wait(Functions:GetPing())
					Humanoid.Sit = false

					Humanoid:ChangeState(Enum.HumanoidStateType.Seated)
					task.wait(Functions:GetPing())
					Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					
					if Humanoid and Humanoid.SeatPart then
						FE.VehicleExit:FireServer(Humanoid.SeatPart)
					end
					continue
				end
			end
			
			local TargetPlayer = (Functions:IsWanted(SavedTarget) and SavedTarget) or GetRandomWantedPlayer()

			if ClientTPLoop then
				task.cancel(ClientTPLoop)
				ClientTPLoop = nil
			end

			local HandCuffs = (LocalPlayer:FindFirstChildOfClass("Backpack"):FindFirstChild("Handcuffs") or LocalPlayer.Character:FindFirstChild("Handcuffs"))
			if not HandCuffs then
				return "No HandCuffs found!"
			elseif not TargetPlayer or not (TargetPlayer.Character and TargetPlayer:FindFirstChild("LastLocation")) then
				task.wait()
				continue
			end

			local PlayerIsStreamed = TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart")

			local StreamTick = tick()
			while _G.AutoArrest and not PlayerIsStreamed and TargetPlayer.Parent and tick() - StreamTick < 5 do
				if Humanoid.Sit ~= true then
					Functions:ClientTP(TargetPlayer.LastLocation.Value)
				end
				
				PlayerIsStreamed = TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
				task.wait()
			end

			if not PlayerIsStreamed then
				WindUI:Notify({
					Title = "ERLCXploit",
					Content = "Failed to load "..TargetPlayer.Name.." character",
					Duration = 4
				})

				task.wait()
				continue
			end

			local TCharacter = TargetPlayer.Character
			local THumanoid = TCharacter and TCharacter:FindFirstChildWhichIsA("Humanoid")

			local ArrestTick = tick()
			local AttemptAmount = 0
			
			while _G.AutoArrest and Functions:IsAlive(THumanoid) and Functions:IsAlive(Humanoid) and Functions:IsWanted(TargetPlayer) and TCharacter.PrimaryPart and tick() - ArrestTick < 15 and task.wait() do
				if not ClientTPLoop then
					ClientTPLoop = task.spawn(function()
						while task.wait() do
							if Humanoid.Sit ~= true then
								if not Character:FindFirstChild("Handcuffs") then
									Humanoid:EquipTool(HandCuffs)
								end
								Functions:ClientTP(PlayerIsStreamed.CFrame)
							end
						end
					end)
				end

				if AttemptAmount >= 15 then
					break
				end

				local Response = UseHandcuffs:InvokeServer("Handcuff", TargetPlayer) -- Hacerle weld

				if Response == "Success" then
					local Arrested = UseHandcuffs:InvokeServer("Arrest", TargetPlayer) -- Mandarlo a prisión
					local ArrestTick = tick()

					while Arrested ~= nil and (tick() - ArrestTick) < 8 and Functions:IsWanted(TargetPlayer) do
						Arrested = UseHandcuffs:InvokeServer("Arrest", TargetPlayer)
					end

					if Arrested == nil then
						if ClientTPLoop then
							task.cancel(ClientTPLoop)
							ClientTPLoop = nil
						end

						AttemptAmount = 0
						IgnoreGodMode = false
						
						if SavedTarget then
							SavedTarget = nil
							
							if Humanoid and Humanoid.SeatPart then
								FE.VehicleExit:FireServer(Humanoid.SeatPart)
							end
						end

						WindUI:Notify({
							Title = "ERLCXploit",
							Content = "Arrested "..TargetPlayer.Name.."!",
							Duration = 4
						})
					end
				elseif Response == false and TargetPlayer and TargetPlayer.Character
					and TargetPlayer.Character:FindFirstChildOfClass("Humanoid")
					and TargetPlayer.Character.Humanoid.SeatPart
					and TargetPlayer.Character.Humanoid.SeatPart.Parent
					and TargetPlayer.Character.Humanoid.SeatPart.Parent:IsDescendantOf(Vehicles)
					and AttemptAmount > 5
				then
					local Vehicle = TargetPlayer.Character.Humanoid.SeatPart.Parent
					
					if Vehicle:FindFirstChild("Body") then
						for i,v in pairs(Vehicle:GetDescendants()) do
							if v:IsA("VehicleSeat") and not v.Occupant and not Humanoid.Sit then
								Humanoid.Sit = true
								task.wait(0.1)
								Humanoid.Sit = false
								
								Humanoid:ChangeState(Enum.HumanoidStateType.Seated)
								task.wait(Functions:GetPing())
								Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

								task.wait(Functions:GetPing()+0.6)
								
								v:Sit(Humanoid)
								
								task.wait(Functions:GetPing()+0.6)
								IgnoreGodMode = true
								SavedTarget = TargetPlayer
								
								task.delay(4, function()
									if IgnoreGodMode and AttemptAmount <= 8 then
										IgnoreGodMode = false
									end
								end)
							end
						end
					end
				else
					AttemptAmount += 1
				end

				task.wait(0.15)
			end

			if ClientTPLoop then
				task.cancel(ClientTPLoop)
				ClientTPLoop = nil
			end

			task.wait(0.25)
		end

		if ClientTPLoop then
			task.cancel(ClientTPLoop)
			ClientTPLoop = nil
		end
	end

	ArrestAura = function()
		while _G.ArrestAura do
			if Functions:IsAlive(Humanoid) and Character:FindFirstChild("Handcuffs") then
				for _, TargetPlayer in ipairs(Players:GetPlayers()) do
					if TargetPlayer == LocalPlayer or not CanArrestPlayer(TargetPlayer) then continue end

					while CanArrestPlayer(TargetPlayer) and _G.ArrestAura do
						local Response = UseHandcuffs:InvokeServer("Handcuff", TargetPlayer) -- Hacerle weld

						if Response == "Success" then
							local Arrested = UseHandcuffs:InvokeServer("Arrest", TargetPlayer) -- Mandarlo a prisión
							local ArrestTick = tick()

							while Arrested ~= nil and (tick() - ArrestTick) < 5 and Functions:IsWanted(TargetPlayer) do
								Arrested = UseHandcuffs:InvokeServer("Arrest", TargetPlayer)
							end

							if Arrested ~= nil then
								break
							else
								WindUI:Notify({
									Title = "ERLCXploit",
									Content = "Arrested "..TargetPlayer.Name.."!",
									Duration = 4
								})
							end
						elseif TargetPlayer:FindFirstChild("Detained") then
							break -- Lo agarro otra persona
						end
					end
				end
			end
			task.wait()
		end
	end

	_G.SpeedModify = false
	_G.SpeedModifyValue = 16

	task.spawn(function()
		while true do
			local Time = task.wait()
			local MoveDirection = Humanoid.MoveDirection
			if _G.SpeedModify and MoveDirection.Magnitude > 0 and not Functions:IsLocalPlayerSitting() then
				local Speedin1sec = (1 / Time)
				local Extra = MoveDirection * ((_G.SpeedModifyValue - Humanoid.WalkSpeed) / Speedin1sec)
				HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Extra
			end
		end
	end)
	
	do
		local IsDescendantOf = game.IsDescendantOf
		DisableACChar = function(NewChar)
			_G.YieldFling = true

			local RootPart = NewChar:WaitForChild("HumanoidRootPart", 9e9)
			local Humanoid = NewChar:WaitForChild("Humanoid", 9e9)
			local Head = NewChar:WaitForChild("Head", 9e9)

			task.spawn(function()
				local Found
				while not Found do
					Found = DisableACConnection(Head:GetPropertyChangedSignal("Anchored"), true)
					task.wait(0.25)
				end

				DisableACConnection(RootPart:GetPropertyChangedSignal("Velocity"), true)
				DisableACConnection(NewChar.DescendantAdded, true)
				DisableACConnection(NewChar.ChildAdded, true)
				DisableACConnection(RootPart.Changed, true)
				
				_G.YieldFling = false
			end)

			local NewCharMETA = table.clone(OriginalMETA)
			local OldIndx = NewCharMETA.__index
			local OldNewIndx = NewCharMETA.__newindex

			local FakeCharacter = Instance.new("Part")
			local FakeFindFirstChildOfClass = newcclosure(function() end)
			
			local CheckStr = LPH_NO_VIRTUALIZE(function(str) -- DONT REMOVE CUZ ELSE ANTIBAN WILL FALSE FLAG
				local str1, str2, str3, str4 = "velocity", "Velocity", "AssemblyLinearVelocity", "assemblyLinearVelocity"
				
				if str == str1 or str == str2 or str == str3 or str == str4 then
					return true
				end
				
				return false
			end)
			
			NewCharMETA.__index = newcclosure(function(...)
				local Self = ({...})[1]
				local Indx = ({...})[2]

				if Indx == "FindFirstChildOfClass" then
					for i = 1, 15 do
						local _, Source = pcall(debug.info, i, "s")
						if Source and Source:find(ACPath) then
							return FakeFindFirstChildOfClass
						end
					end
				end

				if not checkcaller() then
					if typeof(Self) == "Instance" and (IsDescendantOf(Self, NewChar) or Self == NewChar) then
						local Succes = pcall(OldIndx, ...)
						if Succes then
							if CheckStr(tostring(Indx)) then
								return Vector3.new(15 + math.random(), math.random(), 15 + math.random())
							elseif Self == Head and (Indx == "Anchored" or Indx == "anchored") then
								return false
							end
						end
					else
						if Indx == "descendantAdded" or Indx == "DescendantAdded" then
							return FakeCharacter[Indx]
						elseif Indx == "childAdded" or Indx == "ChildAdded" then
							return FakeCharacter[Indx]
						end
					end
				end

				return OldIndx(...)
			end)

			Setrawmetatable(NewChar, NewCharMETA)
			
			for _, Part in ipairs(NewChar:GetDescendants()) do
				if Part:IsA("BasePart") then
					Setrawmetatable(Part, NewCharMETA)
				end
			end
		end

		task.spawn(DisableACChar, Character)
		LocalPlayer.CharacterAdded:Connect(DisableACChar)
	end

	_G.LocalNoclip = false

	local NoclipParts = {"LowerTorso", "UpperTorso", "HumanoidRootPart"}

	_G.AutoPickupMoney = false
	_G.MoneyAuraSize = 13

	local MoneyOverlap = OverlapParams.new()
	MoneyOverlap.FilterType = Enum.RaycastFilterType.Exclude

	RunService.Stepped:Connect(LPH_NO_VIRTUALIZE(function()
		if not Character or not Character:IsDescendantOf(workspace) and not _G.YieldFling then
			_G.YieldFling = true
			while not Character do task.wait() end
			while getrawmetatable(Character) == getrawmetatable(game) do
				task.wait()
			end
			
			if _G.YieldFling then
				_G.YieldFling = false
			end
		end
		
		task.spawn(pcall, function()
			if (_G.WalkFling or _G.CarFling) and Character and Character:IsDescendantOf(workspace) and not Character:FindFirstChildOfClass("ForceField") then
				while _G.YieldFling do task.wait() end

				local vel, movel = nil, 0.1	

				local ShouldFling = (_G.CarFling and Functions:GetDrivenVehicle() or _G.WalkFling and not Functions:GetDrivenVehicle()) or false

				if ShouldFling then
					RunService.Heartbeat:Wait()

					vel = HumanoidRootPart.Velocity
					HumanoidRootPart.Velocity = vel * 8000 + Vector3.new(0, 7000, 0)

					RunService.RenderStepped:Wait()

					if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
						HumanoidRootPart.Velocity = vel
					end

					RunService.Stepped:Wait()
					if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
						HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
						movel = movel * -1
					end
				end
			end
		end)

		pcall(function()
			for _, child in ipairs(Character:GetChildren()) do
				if child:IsA("BasePart") and table.find(NoclipParts, child.Name) then
					child.CanCollide = not _G.LocalNoclip
				end
			end

			if HumanoidRootPart and _G.AutoPickupMoney then
				local MoneyAuraSize = Vector3.new(_G.MoneyAuraSize, 10, _G.MoneyAuraSize)
				local RootCFrame = HumanoidRootPart.CFrame

				MoneyOverlap.FilterDescendantsInstances = {Character}

				local AuraParts = WorkSpace:GetPartBoundsInBox(RootCFrame, MoneyAuraSize, MoneyOverlap)

				for _, part in ipairs(AuraParts) do
					if part.Name == "MoneyBill" then
						firetouchinterest(part, HumanoidRootPart, 1)
						task.wait()
						firetouchinterest(part, HumanoidRootPart, 0)
					end
				end
			end

			if Functions:IsDisablerOn() then
				LocalPlayer.PlayerGui.GameGui.VehicleGui.Visible = false
			end
		end)
	end))

	local NeedHolds = {"StealBankMoney", "BlowBankVault", "StealCashRegisterMoney", "StealSafeMoney", "Arrest", "GrabDetain", "Heal", "FixTrafficLight", "JerryFill"}
	local OldHoldsTimes, OldCharacterAdded, OldCharacterAdded2, OldThead = _G.ERXOldHoldsTimes or {}, nil
	function InstaProxityPrompt()
		if OldCharacterAdded then
			OldCharacterAdded:Disconnect()
			OldCharacterAdded = nil
		end

		local WhenNewChars = function(NewCharacter)
			local InteractionsInfo

			while not InteractionsInfo do
				pcall(function()
					InteractionsInfo = require(NewCharacter["Interaction Handler"]["InteractionActions"])
				end)
				task.wait(0.5)
			end

			if not OldHoldsTimes[NeedHolds[1]] then
				for _, HoldType in ipairs(NeedHolds) do
					OldHoldsTimes[HoldType] = InteractionsInfo[HoldType].HoldTime
				end

				_G.ERXOldHoldsTimes = OldHoldsTimes
			end

			if OldThead then
				task.cancel(OldThead)
				OldThead = nil
			end

			OldThead = task.spawn(function()
				while task.wait(0.25) do
					for _, HoldType in ipairs(NeedHolds) do
						local NewTime = (_G.InstaProxityPrompt and 0) or OldHoldsTimes[HoldType]
						InteractionsInfo[HoldType].HoldTime = NewTime
					end
				end
			end)
		end

		task.spawn(WhenNewChars, Character)
		OldCharacterAdded = LocalPlayer.CharacterAdded:Connect(function()
			task.spawn(WhenNewChars)
		end)
	end

	function AutoCrowbar()
		if OldCharacterAdded2 then
			OldCharacterAdded2:Disconnect()
			OldCharacterAdded2 = nil
		end

		local WhenNewChars2 = function(NewCharacter)
			local InteractionsInfo

			while not InteractionsInfo do
				pcall(function()
					InteractionsInfo = require(NewCharacter["Interaction Handler"]["InteractionActions"])
				end)
				task.wait(0.5)
			end

			local OldExecute = InteractionsInfo.BreakInBountyVehicle.Execute
			InteractionsInfo.BreakInBountyVehicle.Execute = function(PromptAttachment)
				if _G.AutoCrowbar then
					return BountyStealRemote:FireServer("BountyVehicle", true, PromptAttachment.Parent.Parent)
				end
				return OldExecute(PromptAttachment)
			end
		end

		task.spawn(WhenNewChars2, Character)
		OldCharacterAdded2 = LocalPlayer.CharacterAdded:Connect(function()
			task.spawn(WhenNewChars2)
		end)
	end

	local OldFuelConnection, OldHumanoidConnection
	function ConnectSeatPartToHumanoid(Humanoid)
		if OldHumanoidConnection then
			OldHumanoidConnection:Disconnect()
			OldHumanoidConnection = nil
		end

		local AnalyceSeat = function()
			local Seat = Humanoid.SeatPart
			if Seat and Seat.Name == "DriverSeat" and Seat.Parent then
				local CurrentFuel = Seat.Parent:WaitForChild("Control_Values", 9e9):WaitForChild("CurrentFuel", 9e9)
				if OldFuelConnection then
					OldFuelConnection:Disconnect()
					OldFuelConnection = nil
				end

				if _G.InfiniteFuel then
					CurrentFuel.Value = 14
				end

				OldFuelConnection = CurrentFuel:GetPropertyChangedSignal("Value"):Connect(function()
					if _G.InfiniteFuel and CurrentFuel.Value ~= 14 then
						CurrentFuel.Value = 14
					end
				end)

				_G.CurrentFuel = CurrentFuel
			end
		end

		task.spawn(AnalyceSeat)
		OldHumanoidConnection = Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(AnalyceSeat)
	end

	ConnectSeatPartToHumanoid(Humanoid)
	LocalPlayer.CharacterAdded:Connect(function(NewChar)
		ConnectSeatPartToHumanoid(NewChar:WaitForChild("Humanoid", 9e9))
	end)

	function CarEarrape()
		if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
			return _G.CarEarrape and WindUI:Notify({
				Title = "Warning (Premium Feature)",
				Content = "'Earrape' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
				Duration = 10,
			}) or nil
		end

		while _G.CarEarrape do
			local PlayerCar = Functions:GetCurrentLocalPlayerCar()
			if PlayerCar and Humanoid.SeatPart and Humanoid.Sit then
				local DriftRemote = PlayerCar:FindFirstChild("Input_Events"):FindFirstChild("Drift")
				if DriftRemote then
					DriftRemote:FireServer(math.huge, math.huge)
				end
			end

			task.wait()
		end
	end
	
	_G.SusStrength = 1500
	_G.SusSpeed = 1
	
	function Susseh()
		if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
			return _G.Sus and WindUI:Notify({
				Title = "Warning (Premium Feature)",
				Content = "'🥵' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
				Duration = 10,
			}) or nil
		end
		
		while _G.Sus do
			local PlayerCar = Functions:GetCurrentLocalPlayerCar()
			
			local speedFactor = math.clamp(1.0 - (_G.SusSpeed - 1) / 19 * 0.8, 0.05, 2)
			
			if PlayerCar and Humanoid.SeatPart and Humanoid.Sit then
				local primary = PlayerCar.PrimaryPart
				if primary then
					local impulseForce = primary.CFrame.RightVector * -_G.SusStrength -- left
					local impulsePos = primary.Position + Vector3.new(0, 3, 0) -- 3 Studs above Center

					primary:ApplyImpulseAtPosition(impulseForce, impulsePos)

					task.wait(1.5 * speedFactor)

					if not _G.Sus then break end
					
					impulseForce = primary.CFrame.RightVector * _G.SusStrength -- Right

					primary:ApplyImpulseAtPosition(impulseForce, impulsePos)
					task.wait(1.5 * speedFactor)
				end
			end
			
			task.wait()
		end
	end

	local espCache = {}
	function createEsp(player)
		local Drawings = {}

		local IsRightLevel = pcall(function() Instance.new("Player") end)

		if not IsRightLevel then
			setidentity(8)
		end

		Drawings.box = Drawing.new("Square")
		Drawings.box.Thickness = 1
		Drawings.box.Filled = false
		Drawings.box.Color = Color3.new(1, 1, 1)
		Drawings.box.Visible = false
		Drawings.box.ZIndex = 2

		Drawings.boxoutline = Drawing.new("Square")
		Drawings.boxoutline.Thickness = 3
		Drawings.boxoutline.Filled = false
		Drawings.boxoutline.Color = Color3.new()
		Drawings.boxoutline.Visible = false
		Drawings.boxoutline.ZIndex = 1

		Drawings.name = Drawing.new("Text")
		Drawings.name.Center = true
		Drawings.name.Outline = true
		Drawings.name.OutlineColor = Color3.new(0, 0, 0)
		Drawings.name.Color = Color3.new(1, 1, 1)
		Drawings.name.Visible = false
		Drawings.name.ZIndex = 3

		espCache[player] = Drawings
	end

	function removeEsp(player)
		if rawget(espCache, player) then
			for _, drawing in pairs(espCache[player]) do
				drawing:Remove()
			end

			espCache[player] = nil
		end
	end

	local ESPTeamsEnabled = {}
	local updateEsp = LPH_NO_VIRTUALIZE(function(Player, esp)
		local Character = Player and Player.Character
		local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")
		if Humanoid and Player.Team and _G.ESPEnabled then
			local PlayerIsModAndEnabled
			if ESPTeamsEnabled["Moderators"] and (Functions:IsMod(Player) or Functions:IsPRCMod(Player)) then
				PlayerIsModAndEnabled = true
			elseif not ESPTeamsEnabled[Player.Team.Name] then
				esp.box.Visible = false
				esp.boxoutline.Visible = false
				esp.name.Visible = false
				return
			end

			local LastCFrame = Character:FindFirstChild("Head") and Character:GetModelCFrame()
			local LastLocation = not LastCFrame and Player:FindFirstChild("LastLocation")

			if LastLocation then
				LastCFrame = CFrame.new(LastLocation.Value)
			elseif not LastCFrame then
				return
			end

			local Vector, onScreen = Camera:WorldToViewportPoint(LastCFrame.Position)

			if onScreen and LocalPlayer.Character then
				local Distance = (LastCFrame.Position - LocalPlayer.Character:GetPivot().Position).Magnitude

				local viewportPoint = Vector2.new(Vector.X, Vector.Y)
				local depth = Vector.Z

				local scaleFactor = 1 / (depth * math.tan(math.rad(Camera.FieldOfView / 2)) * 2) * 1000
				local width, height = 4 * scaleFactor, 5 * scaleFactor
				local xPoint, yPoint = viewportPoint.X, viewportPoint.Y

				esp.box.Size = Vector2.new(width, height)
				esp.box.Position = Vector2.new(xPoint - width / 2, yPoint - height / 2)

				esp.boxoutline.Size = esp.box.Size
				esp.boxoutline.Position = esp.box.Position

				local TextSize = math.max(16, height / 15)

				esp.name.Position = Vector2.new(xPoint, yPoint - (height / 2) - (TextSize * 1.5))

				local Extras, TeamName = "", string.upper(Player.Team.Name)
				if _G.ESPViewHealth then
					local Health = string.format("%.3f", Humanoid.Health)
					Extras = Extras .. " | Health: " .. ((type(Health) == "string" and tonumber(Health)) or "0")
				end

				if _G.ESPViewDistance then
					Extras = Extras .. " | Distance: " .. math.round(Distance)
				end

				if Functions:IsPRCMod(Player) and PlayerIsModAndEnabled then
					TeamName = "PRC MOD"
					esp.box.Color = Color3.new(1, 0, 0.5)
				elseif PrivateMembers[Player.Name] then
					TeamName = "ERX PRIVATE"
					esp.name.Color = Color3.fromRGB(24, 39, 244)
					esp.box.Color = Color3.fromRGB(24, 39, 244)
				elseif Functions:IsMod(Player) and PlayerIsModAndEnabled then
					TeamName = "MODERATOR"
					esp.box.Color = Color3.new(0, 1, 0)
				elseif Functions:IsWanted(Player) and _G.DifferenceWanted then
					TeamName = "WANTED"
					esp.box.Color = Color3.fromRGB(192, 121, 42)
				elseif Functions:IsVisibleERXUser(Player) then
					TeamName = "ERX USER"
					esp.box.Color = Color3.fromRGB(192, 93, 116)
				else
					esp.box.Color = Player.Team.TeamColor.Color
				end

				esp.name.Size = TextSize
				esp.name.Text = "Name: " .. Player.Name .. Extras .. " [".. TeamName .. "]"
				esp.name.Color = esp.box.Color

				esp.box.Visible = true
				esp.boxoutline.Visible = true
				esp.name.Visible = true

				return
			end
		end

		esp.box.Visible = false
		esp.boxoutline.Visible = false
		esp.name.Visible = false
	end)

	RunService:BindToRenderStep("PlayerESP", Enum.RenderPriority.Camera.Value, LPH_NO_VIRTUALIZE(function()
		for player, drawings in pairs(espCache) do
			if drawings and player ~= LocalPlayer then
				updateEsp(player, drawings)
			end
		end
	end))

	local StaticWhitelist -- Table
	local StaticResponse -- Code

	local WLCheckLocalPlayer = false

	local PlayerWhitelistCheck = function(Player, UseStatic, Code)
		local suc, err = pcall(function()
			local PlayerHash = HashLib.sha1(tostring(Player.Name..Player.UserId))

			local Members

			if UseStatic and StaticResponse == Code and StaticWhitelist then
				Members = StaticWhitelist
			else
				StaticResponse = request({
					Url = PrivateMembersURL,
					Method = "GET"
				}).Body

				local Whitelisteds = loadstring("return "..StaticResponse)

				StaticWhitelist = Whitelisteds and Whitelisteds() or {}

				StaticResponse = Code
				Members = StaticWhitelist
			end

			if Members then
				if table.find(Members, PlayerHash) then
					PrivateMembers[Player.Name] = true
				end
			end
		end)

		if Player == LocalPlayer then
			WLCheckLocalPlayer = true
		end

		return suc
	end

	local WLNumber = math.random(1, 10000)

	for _, Player in ipairs(Players:GetPlayers()) do
		task.spawn(PlayerWhitelistCheck, Player, true, WLNumber)

		task.spawn(createEsp, Player)
	end

	Players.PlayerAdded:Connect(function(Player)
		PlayerWhitelistCheck(Player)

		task.spawn(function()
			local Start = tick()

			repeat task.wait() until not Player or not Player.Parent or Functions:IsPRCMod(Player) or tick() - Start > 15

			if Player and Functions:IsPRCMod(Player) then
				WindUI:Notify({
					Title = "PRC Checker",
					Content = "⚠ " .. Player.Name.. " Is a PRC Mod! Please be careful ⚠",
					Duration = math.huge,
				})

				CustomConnections.OnPRCStaffJoin:Fire({
					["Player"] = Player,
				})
			end
		end)

		createEsp(Player)
	end)

	Players.PlayerRemoving:Connect(removeEsp)

	do
		local suc, Error = pcall(LPH_NO_VIRTUALIZE(function()
			if not isfolder("WindUI/CustomFeatures") then
				makefolder("WindUI/CustomFeatures")
			end

			local CustomFeatures = isfile("WindUI/CustomFeatures/CustomFeatures.lua") and readfile("WindUI/CustomFeatures/CustomFeatures.lua")
			if CustomFeatures and CustomFeatures ~= "" then
				CustomFeatures = loadstring(CustomFeatures)
				if not CustomFeatures or typeof(CustomFeatures) ~= "function" then
					WindUI:Notify({
						Title = "CustomModules",
						Content = "Failed to load custom functions (Error)",
						Duration = 10,
					})
					return
				end

				task.spawn(CustomFeatures)
			else
				writefile("WindUI/CustomFeatures/CustomFeatures.lua", "")
			end
		end))

		if not suc then
			WindUI:Notify({
				Title = "ERLCXploit",
				Content = "Error while loading CustomModules: "..Error,
				Duration = 10,
			})
		end
	end

	if not isfolder("ERX/config") then
		makefolder("ERX/config")
	end

	do
		local IsRightLevel = pcall(function() Instance.new("Player") end)

		if not IsRightLevel then
			setidentity(8)
		end
	end

	Tabs.Main:Toggle({
		Title = "Infinite Stamina", 
		Value = false,
		Callback = function(Value)
			_G.InfiniteStamina = Value
			InfiniteStamina()
		end,
	})

	_G.NoFallDamage = false

	do
		local NoFallMeta, ChatMeta, ModMeta = table.clone(OriginalMETA), table.clone(OriginalMETA), table.clone(OriginalMETA)
		local OldNamecall = OriginalMETA.__namecall

		NoFallMeta.__namecall = newcclosure(LPH_NO_VIRTUALIZE(function(...)
			if not checkcaller() and getnamecallmethod() == "FireServer" then
				local Self = ({...})[1]
				if Self == EnviromentRemote and _G.NoFallDamage then
					return
				elseif Self == EquippedHandcuffs and _G.AutoArrest and ({...})[2] == false then
					return
				end
			end

			return OldNamecall(...)
		end))

		ChatMeta.__namecall = newcclosure(function(...) -- CHAT BYPASSER
			local Args = {...}

			if getnamecallmethod() == "FireServer" and Args[1] and Args[2] then
				if typeof(Args[2]) == "string" and _G.ChatBypass then
					Args[2] = BypassLib:Bypass(Args[2])
				end
			end

			return OldNamecall(table.unpack(Args))
		end)
		
		ModMeta.__namecall = newcclosure(function(...)
			local Args = {...}

			if getnamecallmethod() == "FireServer" and Args[1] and Args[2] then
				if typeof(Args[2]) == "table" and Args[2].DORBLX_IS_HOT then
					OnChatted(":to "..Args[2].PlayerName, true)
					return
				end
			end
			
			return OldNamecall(table.unpack(Args))
		end)

		Setrawmetatable(EquippedHandcuffs, NoFallMeta)
		Setrawmetatable(EnviromentRemote, NoFallMeta)

		if LRM_IsUserPremium or LRM_UserNote ~= "Ad Reward" then
			task.spawn(function()
				while task.wait(1) do
					if getrawmetatable(AcceptedModRequest) == getrawmetatable(game) then
						Setrawmetatable(AcceptedModRequest, ModMeta)
					end
				end
			end)
			Setrawmetatable(Chat, ChatMeta)
		else
			ChatMeta = nil
		end
	end

	Tabs.Main:Toggle({
		Title = "No Fall Damage",
		Value = false,
		Callback = function(Value)
			_G.NoFallDamage = Value
		end
	})

	Tabs.Main:Toggle({
		Title = "Instant Respawn", 
		Value = false,
		Callback = function(Value)
			_G.InstantRespawn = Value
		end,
	})

	local OldAntiArrestConnect
	Tabs.Main:Toggle({
		Title = "Anti Arrest",
		Value = false,
		Callback = function(Value)
			if OldAntiArrestConnect then
				OldAntiArrestConnect:Disconnect()
				OldAntiArrestConnect = nil
			end

			if Value then
				OldAntiArrestConnect = LocalPlayer.ChildAdded:Connect(function(Child)
					if Child.Name == "In_Handcuffs" or Child.Name == "Detained" then
						Functions:Respawn()
					end
				end)
			end
		end,
	})

	Tabs.Main:Toggle({
		Title = "Free Instant Refuel", 
		Value = false,
		Callback = function(Value)
			_G.InstantRefuel = Value
		end,
	})

	Tabs.Main:Section({	Title = "Police"}) --, Icon :D

	Tabs.Main:Toggle({
		Title = "Arrest Aura   👑", 
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
				_G.ArrestAura = Value
				ArrestAura()
			elseif Value then
				WindUI:Notify({
					Title = "Warning (Premium Feature)",
					Content = "'Arrest Aura' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
					Duration = 10,
				})
			end
		end,
	})

	local AutoArrestToggle
	AutoArrestToggle = Tabs.Main:Toggle({
		Title = "Auto Arrest   👑", 
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if Value and (not LRM_IsUserPremium or LRM_UserNote == "Ad Reward") then
				AutoArrestToggle:Set(false)
				WindUI:Notify({
					Title = "Warning (Premium Feature)",
					Content = "'Auto Arrest' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
					Duration = 10,
				})
			elseif Value and not Functions:IsDisablerOn() then
				AutoArrestToggle:Set(false)
				WindUI:Notify({
					Title = "AutoArrest",
					Content = "Please enable God Mode to use Auto Arrest.",
					Duration = 10,
				})
			else
				_G.AutoArrest = Value
				local Message = AutoArrest()
				if Value then
					AutoArrestToggle:Set(false)
				end

				if Message then
					WindUI:Notify({
						Title = "AutoArrest",
						Content = Message,
						Duration = 10,
					})
				end
			end
		end,
	})

	Tabs.Main:Slider({
		Title = "Arrest Aura Distance",
		Desc = "Adjust the distance for arrest aura",
		Value = {
			Min = 1,
			Max = 15,
			Default = 12,
		},
		Callback = function(NumberValue)
			_G.ArrestAuraDistance = tonumber(NumberValue)
		end,
	})

	LocalPlayer.CharacterAdded:Connect(function(NewChar)
		local Humanoid = NewChar:WaitForChild("Humanoid", 9e9)
		Humanoid.HealthChanged:Connect(function(NewHealth)
			if _G.InstantRespawn and NewHealth < 0.11 then
				Functions:Respawn()
			end
		end)
	end)

	Tabs.Main:Section({	Title = "Character"})

	local TryingGodMode = false
	EnabledGodMode = function(NoNotifacations)
		if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
			return WindUI:Notify({
				Title = "Warning (Premium Feature)",
				Content = "'God Mode' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
				Duration = 10,
			})
		elseif not Functions:IsAlive(Humanoid) then 
			return false, WindUI:Notify({
				Title = "God Mode",
				Content = "You cannot activate God Mode if you are already dead!!",
				Duration = 5,
			})
		elseif Functions:IsDisablerOn() then
			return false, WindUI:Notify({
				Title = "God Mode",
				Content = "You are already Godded!",
				Duration = 5,
			})
		elseif Humanoid.SeatPart ~= nil then -- Just Respawn bro
			return false, WindUI:Notify({
				Title = "God Mode",
				Content = "You cannot use god mode right now, get out of the car.",
				Duration = 5,
			})
		elseif TryingGodMode then
			return false, WindUI:Notify({
				Title = "God Mode",
				Content = "On Cooldown!",
				Duration = 3,
			})
		end

		local PlayerVehicle = Functions:GetLocalPlayerCar()
		local AvailableSeat

		if PlayerVehicle then
			for _, passenger in ipairs(PlayerVehicle:GetChildren()) do
				if passenger:IsA("VehicleSeat") and passenger.Name ~= "DriverSeat" and passenger.Occupant == nil then
					AvailableSeat = passenger
				end
			end
		else
			PlayerVehicle, AvailableSeat = Functions:GetRandomVehicle()
		end

		local ErrorMessage = ""
		if AvailableSeat then
			TryingGodMode = true

			local StartTime = tick()

			for i = 1, 3 do
				AvailableSeat:Sit(Humanoid)
				SafeFireServer(FE.VehicleExit, AvailableSeat)
			end

			while not Functions:IsDisablerOn() and tick() - StartTime < Functions:GetPing()+1 do
				task.wait()
			end

			task.delay(0.2, function()
				TryingGodMode = false
			end)

			if Functions:IsDisablerOn() then
				local TimeInSecs = string.format("%.3f", tick() - StartTime)

				local Connections = {}
				local DisabledGodMode = function()
					for Indx, Connection in pairs(Connections) do
						Connection:Disconnect()
						Connections[Indx] = nil
					end

					WindUI:Notify({
						Title = "God Mode",
						Content = "God Mode has been disabled.",
						Duration = 10,
					})

					Humanoid.Sit = true
					task.wait()
					Humanoid.Sit = false
				end

				table.insert(Connections, PlayerVehicle:GetPropertyChangedSignal("Parent"):Once(DisabledGodMode))
				table.insert(Connections, Humanoid:GetPropertyChangedSignal("SeatPart"):Once(DisabledGodMode))
				table.insert(Connections, Humanoid.Died:Once(DisabledGodMode))

				table.insert(Connections, AvailableSeat:GetPropertyChangedSignal("Occupant"):Connect(function()
					if AvailableSeat.Occupant == Humanoid then
						DisabledGodMode()
					end
				end))

				WindUI:Notify({
					Title = "God Mode",
					Content = "Success in " .. TimeInSecs ..  "s ! You are now Godded!",
					Duration = 10,
				})

				return true
			else
				ErrorMessage = "God Mode Timeout! Please try again."
			end
		else
			ErrorMessage = "Car not found! Please spawn a car or find a close vehicle."
		end

		return WindUI:Notify({
			Title = "God Mode",
			Content = ErrorMessage,
			Duration = 5,
		})
	end

	Tabs.Main:Button({
		Title = "God Mode   👑",
		Desc = "Disables the TP Check + makes you invincible",
		Locked = (not LRM_IsUserPremium),
		Callback = EnabledGodMode
	})

	Tabs.Main:Button({
		Title = "Respawn",
		Desc = "Respawns your character using magic",
		Callback = Functions.Respawn
	})

	Tabs.LocalPlayer:Toggle({
		Title = "Walk Speed", 
		Value = false, 
		Callback = function(Value)
			_G.SpeedModify = Value
		end,
	})

	Tabs.LocalPlayer:Slider({
		Title = "WalkSpeed",
		Desc = "Adjusts Your WalkSpeed",
		Value = {
			Min = 1,
			Max = 250,
			Default = 16,
		},
		Callback = function(Value)
			_G.SpeedModifyValue = tonumber(Value)
		end
	})

	local OldNoclipConnect
	Tabs.LocalPlayer:Toggle({
		Title = "Noclip", 
		Value = false,
		Callback = function(Value)
			_G.LocalNoclip = Value
		end,
	})

	local OldJumpRequestConnect
	Tabs.LocalPlayer:Toggle({
		Title = "Infinite Jump", 
		Value = false, 
		Callback = function(Value)
			if OldJumpRequestConnect then
				OldJumpRequestConnect:Disconnect()
				OldJumpRequestConnect = nil
			end

			if Value then
				OldJumpRequestConnect = UserInputService.JumpRequest:Connect(function()
					Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end)
			end
		end,
	})

	Tabs.LocalPlayer:Toggle({
		Title = "Money Aura",
		Desc = "Auto picks up dropped money",
		Value = false, 
		Callback = function(Value)
			_G.AutoPickupMoney = Value
		end,
	})

	Tabs.LocalPlayer:Slider({
		Title = "MoneyAura Distance",
		Desc = "Adjust the minimum distance for MoneyAura",
		Value = {
			Min = 1,
			Max = 13,
			Default = 13,
		},
		Callback = function(Value)
			_G.MoneyAuraSize = tonumber(Value)
		end
	})

	Tabs.LocalPlayer:Button({
		Title = "Get Basketball",
		Desc = "Gets you a basketball",
		Callback = function()
			local RandomBasketball, ErrorMessage

			if not Functions:IsAlive(Humanoid) or not HumanoidRootPart then 
				ErrorMessage = "You need to be alive to use this!"
			end

			if not ErrorMessage and #BasketBalls:GetChildren() <= 0 then
				ErrorMessage = "No basketballs found"
			end

			RandomBasketball = not ErrorMessage and Functions:SelectRandom(BasketBalls:GetChildren())

			if RandomBasketball then
				firetouchinterest(RandomBasketball, HumanoidRootPart, 1)
				task.wait()
				firetouchinterest(RandomBasketball, HumanoidRootPart, 0)

				return
			end

			WindUI:Notify({
				Title = "Basketball Giver",
				Content = "ERROR: " .. (ErrorMessage or "Unknown Error occurred"),
				Duration = 5,
			})
		end
	})

	Tabs.Players:Toggle({
		Title = "Admin Command Notifier",
		Value = false,
		Callback = function(Value)
			_G.AdminLogs = Value
		end,
	})

	Tabs.Players:Toggle({
		Title = "Chat Spy",
		Value = false,
		Callback = function(Value)
			_G.ChatSpy = Value
		end,
	})

	Tabs.Visuals:Toggle({
		Title = "Instant Interact   👑", 
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
				_G.InstaProxityPrompt = Value
				InstaProxityPrompt()
			elseif Value then
				WindUI:Notify({
					Title = "Warning (Premium Feature)",
					Content = "'Instant Interact' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
					Duration = 10,
				})
			end
		end,
	})

	Tabs.Visuals:Toggle({
		Title = "Freecam",
		Value = false,
		Callback = function(Value)
			_G.Freecam = Value

			if Value and FreecamLib:IsEnabled() then
				task.spawn(function()
					FreecamLib:ToggleFreecam()
				end)
				return
			end

			if Value then
				task.spawn(function()
					FreecamLib:ToggleFreecam()
				end)

				task.spawn(pcall, function()
					HumanoidRootPart.Anchored = true
					while _G.Freecam and task.wait() do
						task.spawn(function()
							Functions:RenderPosition(Camera.CFrame.Position)
						end)
					end

					task.spawn(function()
						Functions:StopRendering()
					end)
					FreecamLib:ToggleFreecam()
					task.delay(1, function()
						HumanoidRootPart.Anchored = false
					end)
				end)
			end
		end,
	})
	
	Tabs.Visuals:Toggle({
		Title = "Infinite Zoom",
		Value = false,
		Callback = function(Value)
			_G.InfZoom = Value
			
			if Value then
				local Old = LocalPlayer.CameraMaxZoomDistance
				
				while _G.InfZoom and task.wait() do
					LocalPlayer.CameraMaxZoomDistance = 1e5
				end
				
				LocalPlayer.CameraMaxZoomDistance = Old
			end
		end,
	})

	Tabs.Visuals:Section({	Title = "Weathers"})

	_G.SelectedWeather = "Snow"
	_G.ChangeWorldTime = false
	_G.ClockTime = 12

	Tabs.Visuals:Dropdown({
		Title = "Weathers",
		Values = (function()
			local WeatherTypes = LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Weather", 9e9):WaitForChild("WeatherTypes", 9e9)
			local names = {}
			for _, v in ipairs(WeatherTypes:GetChildren()) do
				table.insert(names, v.Name)
			end
			return names
		end)(),
		Multi = false,
		Value = 1,
		Callback = function(Value)
			_G.SelectedWeather = Value
		end,
	})

	local ChangeWeatherConnection
	task.spawn(function()
		for _, Func in ipairs(GetConnections(ChangeWeather.OnClientEvent)) do
			if Func.Function then
				ChangeWeatherConnection = Func.Function
			end
		end
	end)

	Tabs.Visuals:Button({
		Title = "Change Weather",
		Desc = "Changes game weather (ClientSided)",
		Callback = function()
			if _G.SelectedWeather and ChangeWeatherConnection then
				ChangeWeatherConnection(_G.SelectedWeather)
			end
		end
	})

	Tabs.Visuals:Slider({
		Title = "World Time",
		Desc = "Adjust ClockTime",
		Value = {
			Min = 0,
			Max = 23,
			Default = 12,
		},
		Callback = function(Value)
			_G.ClockTime = tonumber(Value)
			if _G.ChangeWorldTime then
				Lighting.ClockTime = _G.ClockTime
			end
		end
	})

	local TimeConnection
	Tabs.Visuals:Toggle({
		Title = "Change Time", 
		Value = false,
		Callback = function(Value)
			_G.ChangeWorldTime = Value

			if TimeConnection then
				TimeConnection:Disconnect()
				TimeConnection = nil
				return
			end

			if Value then
				Lighting.ClockTime = _G.ClockTime
				TimeConnection = Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
					if Lighting.ClockTime ~= _G.ClockTime then
						Lighting.ClockTime = _G.ClockTime
					end
				end)
			end
		end,
	})

	Tabs.Visuals:Section({	Title = "Fake Chat (NOT FE)"})

	_G.FakeChatNameInput = ""
	_G.FakeChatInput = ""

	Tabs.Visuals:Input({
		Title = "Player Name",
		Value = "",
		Placeholder = "PlayerName",
		Numeric = false,
		Finished = false,
		Callback = function(Value)
			_G.FakeChatNameInput = Value
		end
	})

	Tabs.Visuals:Input({
		Title = "Fake Chat Message",
		Value = "",
		Placeholder = "ERLCXploit on top!",
		Numeric = false,
		Finished = false,
		Callback = function(Value)
			_G.FakeChatInput = Value
		end
	})

	Tabs.Visuals:Button({
		Title = "Send Fake Chat",
		Desc = "Makes the player you chose say a message",
		Callback = function()
			local inputName, foundPlayer = _G.FakeChatNameInput, nil

			if not inputName or inputName == "" then return end

			for _, player in ipairs(Players:GetPlayers()) do
				if player ~= LocalPlayer then
					if string.find(string.lower(player.Name), inputName:lower(), 1, true) or 
						string.find(string.lower(player.DisplayName), inputName:lower(), 1, true) then
						foundPlayer = player
						break
					end
				end
			end

			if inputName:lower() == "me" then
				foundPlayer = LocalPlayer
			end

			if foundPlayer and foundPlayer.Character then
				ChatService:Chat(foundPlayer.Character, _G.FakeChatInput, Enum.ChatColor.White)
			end
		end
	})

	Tabs.Visuals:Section({	Title = "ESP"})

	Tabs.Visuals:Toggle({
		Title = "ESP Enabler", 
		Value = false,
		Callback = function(Value)
			_G.ESPEnabled = Value
		end,
	})

	local ESPTeams = Tabs.Visuals:Dropdown({
		Title = "ESP Teams",
		Values = (function()
			local TeamsNames = {}

			for i, v in ipairs(Teams:GetTeams()) do
				table.insert(TeamsNames, v.Name)
			end

			table.insert(TeamsNames, "Moderators")

			return TeamsNames
		end)(),
		Multi = true,
		Value = {"Civilian"},
		Callback = function(SelectedTeams)
			table.clear(ESPTeamsEnabled)

			for i, TeamName in pairs(SelectedTeams) do
				ESPTeamsEnabled[TeamName] = true
			end
		end,
	})

	local ESPOptions = Tabs.Visuals:Dropdown({
		Title = "ESP Settings",
		Values = {"View Health", "View Distance", "Difference Wanted"},
		Multi = true,
		Value = {"View Distance"},
		Callback = function(Options)
			local has = function(val)
				for _, v in ipairs(Options) do
					if v == val then return true end
				end
				return false
			end

			_G.ESPViewHealth = has("View Health")
			_G.ESPViewDistance = has("View Distance")
			_G.DifferenceWanted = has("Difference Wanted")
		end,
	})

	Tabs.VehicleMods:Toggle({
		Title = "Infinite Fuel",
		Value = false,
		Callback = function(Value)
			_G.InfiniteFuel = Value
			if _G.CurrentFuel then
				_G.CurrentFuel.Value = 14
			end
		end,
	})

	Tabs.VehicleMods:Toggle({
		Title = "Earrape   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			_G.CarEarrape = Value
			CarEarrape()
		end,
	})
	
	Tabs.VehicleMods:Section({	Title = "Sus 🥵"})

	Tabs.VehicleMods:Slider({
		Title = "Push Strength",
		Desc = "Adjust Side Strength",
		Value = {
			Min = 10,
			Max = 3000,
			Default = 1500,
		},
		Callback = function(Value)
			_G.SusStrength = tonumber(Value)
		end
	})
	
	Tabs.VehicleMods:Slider({
		Title = "Speed",
		Desc = "Adjust The Super cool speed",
		Value = {
			Min = 1,
			Max = 30,
			Default = 1,
		},
		Callback = function(Value)
			_G.SusSpeed = tonumber(Value)
		end
	})

	Tabs.VehicleMods:Toggle({
		Title = "🥵   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			_G.Sus = Value
			task.spawn(Susseh)
		end,
	})

	Tabs.VehicleMods:Section({	Title = "Multipliers"})

	Tabs.VehicleMods:Slider({
		Title = "Speed Multiplier",
		Desc = "Adjust vehicle speed",
		Value = {
			Min = 1,
			Max = 50,
			Default = 1,
		},
		Callback = function(Value)
			_G.VehicleSpeedMultiplier = tonumber(Value)
		end
	})

	do
		local Cooldown = 1
		local OnCooldown = false

		Tabs.VehicleMods:Button({
			Title = "Apply Vehicle Mods",
			Desc = "Applies vehicle mods",
			Callback = function()
				if OnCooldown then return end

				local Vehicle = Functions:GetCurrentLocalPlayerCar()
				if not Vehicle then return end

				OnCooldown = true
				task.delay(Cooldown, function()
					OnCooldown = false
				end)

				local suc, err = ApplySpeedMultiplier(Vehicle)
				if suc then
					local RestartedVehicle = Functions:RestartVehicle()

					if not RestartedVehicle then
						Functions:ReSit()
					end

					WindUI:Notify({
						Title = "Vehicle Mods",
						Content = "Applied vehicle mods successfully!",
						Duration = 3,
					})
				else
					WindUI:Notify({
						Title = "Vehicle Mods",
						Content = "Failed to apply vehicle mods: "..err,
						Duration = 8,
					})
				end
			end
		})
	end

	Tabs.VehicleMods:Section({	Title = "OP"})
	
	_G.PITHitbox = nil
	
	function PITHitbox()
		if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
			return _G.ExtendedPITHitbox and WindUI:Notify({
				Title = "Warning (Premium Feature)",
				Content = "'Extended PIT Hitbox' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
				Duration = 10,
			}) or nil
		end
		
		while _G.ExtendedPITHitbox and task.wait(0.1) do
			local Vehicle = Functions:GetDrivenVehicle()
			if not Vehicle or not Vehicle:FindFirstChild("Body") then
				if _G.PITHitbox and typeof(_G.PITHitbox) == "Instance" then
					_G.PITHitbox:Destroy()
					_G.PITHitbox = nil
				end
				continue
			end

			local RAMBAR = Vehicle:FindFirstChild("RAMBAR", true)
			local PITHitbox = _G.PITHitbox
			if not RAMBAR or PITHitbox then
				if RAMBAR and PITHitbox then
					local length = _G.PITLength or 40
					local width = _G.PITWidth or 15
					
					local Weld = PITHitbox:FindFirstChild("WeldConstraint")
					if not Weld then
						Weld = Instance.new("WeldConstraint")
						Weld.Part0 = PITHitbox
						Weld.Part1 = RAMBAR
						Weld.Parent = PITHitbox
					end
					
					Weld.Enabled = false
					
					PITHitbox.Size = Vector3.new(width, 8, length)
					
					local basePos = RAMBAR.Position
					local forward = RAMBAR.CFrame.LookVector
					local flatForward = Vector3.new(forward.X, 0, forward.Z).Unit

					local offsetPosition = basePos + flatForward * (length / 2)
					offsetPosition = Vector3.new(offsetPosition.X, basePos.Y, offsetPosition.Z)

					PITHitbox.CFrame = CFrame.new(offsetPosition, offsetPosition + flatForward)
					
					Weld.Enabled = true
				end
				
				continue
			end
			
			local ExtendedHitboxPit = Instance.new("Part")
			ExtendedHitboxPit.Size = Vector3.new(
				_G.PITWidth or 15,
				8,
				_G.PITLength or 40
			)
			
			ExtendedHitboxPit.CanCollide = false
			ExtendedHitboxPit.Massless = true
			ExtendedHitboxPit.Transparency = _G.VisualizeHitbox and 0.8 or 1
			ExtendedHitboxPit.Anchored = false

			ExtendedHitboxPit.Color = Color3.fromRGB(255, 0, 0)
			ExtendedHitboxPit.Material = Enum.Material.Neon

			ExtendedHitboxPit.Parent = Vehicle.Body
			ExtendedHitboxPit.Name = "PITHitbox"

			local basePos = RAMBAR.Position
			local forward = RAMBAR.CFrame.LookVector
			local flatForward = Vector3.new(forward.X, 0, forward.Z).Unit

			local offsetPosition = basePos + flatForward * 20
			offsetPosition = Vector3.new(offsetPosition.X, basePos.Y, offsetPosition.Z)

			ExtendedHitboxPit.CFrame = CFrame.new(offsetPosition, offsetPosition + flatForward)

			local weld = Instance.new("WeldConstraint")
			weld.Part0 = ExtendedHitboxPit
			weld.Part1 = RAMBAR
			weld.Parent = ExtendedHitboxPit
			
			local TouchedParts = {}

			if not _G.PitConn then
				_G.PitConn = RunService.Heartbeat:Connect(function()
					local Vehicle = Functions:GetDrivenVehicle()
					if not Vehicle then return end

					local RAMBAR = Vehicle:FindFirstChild("RAMBAR", true)
					if not RAMBAR then return end

					local touchingParts = workspace:GetPartsInPart(ExtendedHitboxPit)
					if not touchingParts then return end

					for _, part in ipairs(touchingParts) do
						if part:IsA("BasePart") and (part.Name == "RightBumper" or part.Name == "LeftBumper") then
							if not TouchedParts[part] then
								TouchedParts[part] = true
								firetouchinterest(part, RAMBAR, 0)
								task.delay(0.1, function()
									firetouchinterest(part, RAMBAR, 1)
									TouchedParts[part] = nil
								end)
							end
						end
					end
				end)
			end
			
			_G.PITHitbox = ExtendedHitboxPit
		end
		
		if _G.PITHitbox and typeof(_G.PITHitbox) == "Instance" then
			_G.PITHitbox:Destroy()
			_G.PITHitbox = nil
		end
		
		if _G.PitConn then
			_G.PitConn:Disconnect()
			_G.PitConn = nil
		end
	end
	
	Tabs.VehicleMods:Slider({
		Title = "Length",
		Desc = "Adjusts the PIT Hitbox Length",
		Value = {
			Min = 1,
			Max = 200,
			Default = 40,
		},
		Callback = function(Value)
			_G.PITLength = tonumber(Value)
		end
	})
	
	Tabs.VehicleMods:Slider({
		Title = "Width",
		Desc = "Adjusts the PIT Hitbox Width",
		Value = {
			Min = 5,
			Max = 50,
			Default = 15,
		},
		Callback = function(Value)
			_G.PITWidth = tonumber(Value)
		end
	})
	
	Tabs.VehicleMods:Toggle({
		Title = "Visualize PIT Hitbox",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			_G.VisualizeHitbox = Value
			if _G.PITHitbox and typeof(_G.PITHitbox) == "Instance" then
				_G.PITHitbox.Transparency = Value and 0.8 or 1
			end
		end,
	})

	Tabs.VehicleMods:Toggle({
		Title = "Extended PIT Hitbox   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			_G.ExtendedPITHitbox = Value
			task.spawn(PITHitbox)
		end,
	})
	
	Tabs.VehicleMods:Toggle({
		Title = "Vehicle Noclip",
		Desc = "Disable other cars collision",
		Value = false,
		Callback = function(Value)
			_G.VNoclip = Value
			while _G.VNoclip do
				for _,Vehicle in ipairs(Vehicles:GetChildren()) do
					if Vehicle:IsA("Model") and Vehicle ~= Functions:GetCurrentLocalPlayerCar() then
						for i,v in pairs(Vehicle:GetDescendants()) do
							if v:IsA("BasePart") then
								if v.CanCollide then
									v:SetAttribute("WasCollidable", true)
								end
								v.CanCollide = false
							end
						end
					end
				end
				task.wait(0.5)
			end
			
			for i,v in pairs(Vehicles:GetDescendants()) do
				if v:IsA("BasePart") and v:GetAttribute("WasCollidable") then
					v.CanCollide = true
					v:GetAttribute("WasCollidable", nil)
				end
			end
		end,
	})

	Tabs.VehicleMods:Section({	Title = "Anti's"})

	Tabs.VehicleMods:Toggle({
		Title = "Anti Stop Sticks",
		Desc = "Makes your car immune to Stop Sticks",
		Value = false,
		Callback = function(Value)
			_G.AntiStopSticks = Value
			for _, StopStick in ipairs(Deployables:GetChildren()) do
				if StopStick:IsA("BasePart") and StopStick.Name == "Stop Stick" then
					StopStick.CanTouch = not Value
				end
			end
		end,
	})

	Deployables.ChildAdded:Connect(function(Object)
		if Object:IsA("BasePart") and Object.Name == "Stop Stick" and _G.AntiStopSticks then
			Object.CanTouch = false 
		end
	end)

	_G.NoCarDamage = false
	function NoCarDamage()
		local MainVehicle

		local function SetCollisions(CanTouch)
			if MainVehicle and MainVehicle:FindFirstChild("Body") then
				for _, Collision in ipairs(MainVehicle:GetDescendants()) do
					if Collision.Name == "CollisionPart" and Collision:IsA("BasePart") then
						Collision.CanTouch = CanTouch
					end
				end
			end
		end

		while _G.NoCarDamage do
			MainVehicle = Functions:GetCurrentLocalPlayerCar()
			SetCollisions(false)
			task.wait()
		end

		SetCollisions(true)
	end

	Tabs.VehicleMods:Toggle({
		Title = "No Collision",
		Desc = "Makes your car immune to light poles/etc",
		Value = false,
		Callback = function(Value)
			_G.NoCarDamage = Value
			NoCarDamage()
		end,
	})

	Tabs.VehicleMods:Section({	Title = "Other"})

	Tabs.VehicleMods:Button({
		Title = "Destroy All Poles",
		Desc = "Destroys Every LightPole Loaded (Fully Destroys ur car)",
		Callback = function()
			if Functions:IsAlive(Humanoid) and HumanoidRootPart and Humanoid and not Functions:IsDisablerOn() then
				local PlayerCar = Functions:GetDrivenVehicle()

				if not PlayerCar then
					WindUI:Notify({
						Title = "DestroyPoles",
						Content = "No vehicle found",
						Duration = 5,
					})
					return
				end

				local CollisionPart = PlayerCar:FindFirstChild("Body") and PlayerCar.Body:FindFirstChild("CollisionPart")

				if not CollisionPart then
					WindUI:Notify({
						Title = "DestroyPoles",
						Content = "No Vehicle Collision Found.",
						Duration = 5,
					})
					return
				end

				local OriginalPos = PlayerCar:GetPivot()
				local UseVelocity = Vector3.new(150, -150, 150)

				local VelocityLoop = task.spawn(function()
					while task.wait() do
						CollisionPart.Velocity = UseVelocity
						PlayerCar:PivotTo(OriginalPos)
					end
				end)

				local StartTime = tick()

				local WasEnabled = _G.NoCarDamage == true

				if WasEnabled then
					--Features.NoCarDamage:Set(false)
				end

				for i, v in pairs(StreetLamps:GetChildren()) do
					local Pole = v:FindFirstChild("Pole")
					if Pole then
						task.spawn(function()
							while tick() - StartTime < 0.75 and v.Parent == StreetLamps do
								firetouchinterest(CollisionPart, Pole, 0)
								task.wait()
								firetouchinterest(CollisionPart, Pole, 1)
								task.wait(0.05)
							end
						end)
					end
				end

				wait(1)
				UseVelocity = Vector3.zero
				wait(0.5)
				task.cancel(VelocityLoop)

				if WasEnabled then
					--Features.NoCarDamage:Set(true)
				end
			end
		end
	})

	Tabs.VehicleMods:Button({
		Title = "Open ModShop",
		Desc = "Automatically (Teleports) u to modshop",
		Callback = function()
			if Functions:IsAlive(Humanoid) and HumanoidRootPart and Humanoid then
				local PlayerCar = Functions:GetCurrentLocalPlayerCar()

				if not PlayerCar or not PlayerCar:FindFirstChild("DriverSeat") then
					WindUI:Notify({
						Title = "ModShop",
						Content = "No vehicle found/Not streamed",
						Duration = 5,
					})
					return
				end

				if not Functions:IsLocalPlayerSitting() then
					PlayerCar.DriverSeat:Sit(Humanoid)
					task.wait(Functions:GetPing() + 0.5)
				end

				while not ModShop:FindFirstChild("HitParts") or not ModShop.HitParts:FindFirstChild("Touch1") do
					task.spawn(Functions.LoadPlayerZone, LocalPlayer, Vector3.new(-748, 23, 215))
					task.wait(0.1)
				end

				firetouchinterest(ModShop.HitParts.Touch1, PlayerCar.DriverSeat, 1)
				firetouchinterest(ModShop.HitParts.Touch1, PlayerCar.DriverSeat, 0)
			end
		end
	})

	Tabs.VehicleMods:Button({
		Title = "Unstuck car",
		Desc = "Teleports your car 30 studs up",
		Callback = function()
			if Functions:IsAlive(Humanoid) then
				local PlayerCar = Functions:GetDrivenVehicle()

				if not PlayerCar then
					return WindUI:Notify({
						Title = "FixCar",
						Content = "No vehicle found",
						Duration = 5,
					})
				end

				PlayerCar:PivotTo(PlayerCar:GetPivot() * CFrame.new(5, 30, 0))
			end
		end
	})

	local OldRecoils = {}

	--_G.MakeAutomatic = false
	_G.SilentAim = false
	_G.Wallbang = false

	local GetClosestPlayerToMouse = LPH_NO_VIRTUALIZE(function()
		local ClosestPlayer = nil
		local ClosestDistance = math.huge
		local MousePos = Vector2.new(Mouse.X, Mouse.Y)

		for _, Player in ipairs(Players:GetPlayers()) do
			if not Character or not Player.Character or 
				not Player.Character:FindFirstChild("HumanoidRootPart") or 
				not Player.Character:FindFirstChild("Head") or
				Player == LocalPlayer or not Functions:CanKillPlayer(Player) then
				continue
			end

			local ScreenPos, OnScreen = Camera:WorldToScreenPoint(Player.Character.HumanoidRootPart.Position)
			if ScreenPos and OnScreen then
				local Distance = (MousePos - Vector2.new(ScreenPos.X, ScreenPos.Y)).Magnitude
				if Distance < ClosestDistance then
					ClosestDistance = Distance
					ClosestPlayer = Player
				end
			end
		end

		return ClosestPlayer
	end)

	local OldFireRates, OldReloadTimes, OldWeaponsModules = {}, {}, {}
	Tabs.GunMods:Toggle({
		Title = "FireRate Modifier",
		Value = false,
		Callback = function(Value)
			for _,v in ipairs(ReplicatedStorage:WaitForChild("Shared", 9e9).WeaponStats:GetChildren()) do
				local WeaponModule = OldWeaponsModules[v] or require(v)
				OldWeaponsModules[v] = WeaponModule

				if not OldFireRates[v.Name] then
					OldFireRates[v.Name] = rawget(WeaponModule, "FireRate")
				elseif Value then
					rawset(WeaponModule, "FireRate", 0.01)
				else
					rawset(WeaponModule, "FireRate", OldFireRates[v.Name])
				end
			end
		end,
	})

	Tabs.GunMods:Toggle({
		Title = "Instant Reload",
		Value = false,
		Callback = function(Value)
			for _,v in ipairs(ReplicatedStorage:WaitForChild("Shared", 9e9).WeaponStats:GetChildren()) do
				local WeaponModule = OldWeaponsModules[v] or require(v)
				OldWeaponsModules[v] = WeaponModule

				if not OldReloadTimes[v.Name] then
					OldReloadTimes[v.Name] = rawget(WeaponModule, "ReloadSpeed")
				elseif Value then
					rawset(WeaponModule, "ReloadSpeed", 0.01)
				else
					rawset(WeaponModule, "ReloadSpeed", OldReloadTimes[v.Name])
				end
			end
		end,
	})

	task.spawn(function()
		Tabs.Aimbot:Toggle({
			Title = "Silent Aim",
			Value = false,
			Callback = function(Value)
				_G.SilentAim = Value
			end,
		})

		local OldWeaponSStats = {}
		Tabs.Aimbot:Toggle({
			Title = "No Recoil",
			Value = false,
			Callback = function(Value)
				for _,v in ipairs(ReplicatedStorage:WaitForChild("Shared", 9e9).WeaponStats:GetChildren()) do
					local WeaponModule = OldWeaponSStats[v] or require(v)
					OldWeaponSStats[v] = WeaponModule

					if not OldRecoils[v.Name] then
						OldRecoils[v.Name] = {}
					end

					if Value then
						if not OldRecoils[v.Name]["CameraKickMin"] then
							OldRecoils[v.Name]["CameraKickMin"] = WeaponModule["CameraKickMin"]
							OldRecoils[v.Name]["CameraKickMax"] = WeaponModule["CameraKickMax"]
						end

						rawset(WeaponModule, "CameraKickMin", Vector3.zero)
						rawset(WeaponModule, "CameraKickMax", Vector3.zero)
					elseif OldRecoils[v.Name]["CameraKickMin"] then
						rawset(WeaponModule, "CameraKickMin", OldRecoils[v.Name]["CameraKickMin"])
						rawset(WeaponModule, "CameraKickMax", OldRecoils[v.Name]["CameraKickMax"])
					end
				end
			end,
		})

		local ProjectilesFire
		for _, HeartbeatConnection in ipairs(GetConnections(RunService.Heartbeat)) do
			local FireFunc = HeartbeatConnection.Function
			local Source = FireFunc and debug.info(FireFunc, "s")
			if Source and Source:find(".Core") then
				ProjectilesFire = FireFunc
				break
			end
		end

		Tabs.Aimbot:Toggle({
			Title = "Wallbang",
			Value = false,
			Callback = function(Value)
				_G.Wallbang = Value
			end,
		})

		local GenerateFakeRaycastResult = function(Origen, Target)
			--[[local RandomHeadPos = Vector3.new(math.random(1, 100)/1000, math.random(1, 100)/1000, math.random(1, 100)/1000)
			return {
				Instance = Target,
				Position = Target.Position + RandomHeadPos,
				Material = Target.Material,
				Distance = (Origen.Position - (Target.Position + RandomHeadPos)).Magnitude,
				Normal = Vector3.new(1, 0, 0)
			}]]
			local NewParams = RaycastParams.new()
			NewParams.FilterType = Enum.RaycastFilterType.Exclude
			NewParams.FilterDescendantsInstances = Character:GetDescendants()

			local direction = (Target.Position - Origen.Position)
			local Result = workspace:Raycast(Origen.Position, direction, NewParams)

			return Result
		end

		local CustomWorkspace = {
			CurrentCamera = workspace.CurrentCamera,
			Raycast = function(self, ...)
				local Result = WorkSpace.Raycast(WorkSpace, ...)
				if _G.SilentAim then
					local NewPlayer = GetClosestPlayerToMouse()
					local Head = NewPlayer and NewPlayer.Character:FindFirstChild("Head")
					if Head then
						return GenerateFakeRaycastResult(HumanoidRootPart, Head)
					end
				end

				return Result
			end
		}

		local Old = ClientModules.ProjectileHandler.addProjectile
		local OldENV = getfenv(Old)

		local WallbangCheck = function(...)
			if not _G.Wallbang then return Old(...) end

			local Args = {...}
			local Origin = Args[2]
			local RayCast = Args[5]

			local Direction = (RayCast.Position - Origin).Unit * 5000 

			local WhiteList = {
				Vehicles,
				WorkSpace:WaitForChild("CashRegisters", 9e9)
			}

			local EnterableBuildings = WorkSpace:FindFirstChild("EnterableBuildings")
			local Bank = EnterableBuildings and EnterableBuildings:FindFirstChild("Bank")
			if Bank then
				for i, Glass in ipairs(Bank:GetChildren()) do
					if Glass.Name == "BreakableGlass" then
						table.insert(WhiteList, Glass)
					end
				end
			end

			for i, Player in ipairs(Players:GetPlayers()) do
				if Player ~= LocalPlayer then
					table.insert(WhiteList, Player.Character)
				end
			end

			local NewParams = RaycastParams.new()
			NewParams.FilterType = Enum.RaycastFilterType.Include
			NewParams.FilterDescendantsInstances = WhiteList

			Args[5] = WorkSpace:Raycast(Origin, Direction, NewParams)

			return Old(table.unpack(Args))
		end

		ClientModules.ProjectileHandler.addProjectile = function(...)
			local Args = {...}

			if _G.SilentAim and Args[6] == nil and Args[5] then
				OldENV.workspace = CustomWorkspace

				local NewPlayer = GetClosestPlayerToMouse()
				local Head = NewPlayer and NewPlayer.Character:FindFirstChild("Head")

				task.defer(function()
					OldENV.workspace = WorkSpace
				end)

				if Head then
					local NewRay = GenerateFakeRaycastResult(HumanoidRootPart, Head)
					local RX, RY, RZ = math.random(25, 350)/1000, math.random(25, 350)/1000, math.random(25, 350)/1000 -- R de random
					local NewEndLocation = Head.Position + Vector3.new(RX, RY, RZ)
					local NewDirection = CFrame.lookAt(HumanoidRootPart.Position, Head.Position).LookVector

					return WallbangCheck(Args[1], HumanoidRootPart.Position, NewEndLocation, NewDirection, NewRay)
				end
			end

			return WallbangCheck(...)
		end
	end)

	if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
		local OldgetRemoteENV = getfenv(RealNetwork.getRemote)
		local Main_G = _G

		local OldgetRemote
		local NewgetRemote = setfenv(LPH_NO_VIRTUALIZE(function(...)
			local RemotePath = ({...})[1]
			if Main_G.NoProjectileFails and RemotePath == "Weapons.ReplicateProjectile" then
				local RemoteEvent = OldgetRemote(...)
				return {
					FireServer = function(self, Arguments)
						local DamageArgs = Arguments[#Arguments]
						if not DamageArgs or not DamageArgs[1] then
							return wait(9e9)
						else
							local Part = DamageArgs[1]
							local TargetHumanoid = typeof(Part) == "Instance" and Part.Parent and Part.Parent:FindFirstChildWhichIsA("Humanoid")
							if (TargetHumanoid and not Functions:IsAlive(TargetHumanoid)) or TargetHumanoid == Humanoid then
								return wait(9e9)
							end
						end

						return RemoteEvent:FireServer(Arguments)
					end,
					OnClientEvent = RemoteEvent.OnClientEvent
				}
			end

			return OldgetRemote(...)
		end), OldgetRemoteENV)

		OldgetRemote = hookfunction(RealNetwork.getRemote, NewgetRemote)
	end

	Tabs.GunMods:Toggle({
		Title = "No Projectile Fails   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if Value and (not LRM_IsUserPremium or LRM_UserNote == "Ad Reward") then
				return WindUI:Notify({
					Title = "Warning (Premium Feature)",
					Content = "'No Projectile Fails' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
					Duration = 10,
				})
			end

			_G.NoProjectileFails = Value
		end,
	})

	Tabs.Robberies:Dropdown({
		Title = "Never Fail",
		Desc = "If the robbery option is selected, you will never fail it.",
		Values = {"Jewelry", "Lockpick", "House Safe", "ATM", "Wires"},
		Multi = true,
		Value = {},
		Callback = function(SelectedNoFails)
			table.clear(NoFailsEnabled)

			for i, NoFail in pairs(SelectedNoFails) do
				NoFailsEnabled[NoFail] = true
			end
		end,
	})

	local RobberiesItems = {
		["InfiniteATM"] = {Name = "Infinite ATM Tries", Premium = true},
		["AutoCrowbar"] = {
			Name = "Auto Crowbar",
			Callback = AutoCrowbar,
		},
		["AutoWires"] = {Name = "Auto Complete Wires"},
		["AutoNumbersHack"] = {Name = "Auto Numbers Hack"}
	}

	for Name, Info in pairs(RobberiesItems) do
		if _G[Name] ~= nil then
			Tabs.Robberies:Toggle({
				Title = (Info and Info.Name) .. (Info.Premium and "   👑" or ""),
				Value = false,
				Locked = (Info.Premium and not LRM_IsUserPremium),
				Callback = function(Value)
					if Info.Premium and (not LRM_IsUserPremium or LRM_UserNote == "Ad Reward") then
						if Value then
							WindUI:Notify({
								Title = "Warning (Premium Feature)",
								Content = string.format("'%s' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).", Info.Name),
								Duration = 10,
							})
						end
						return
					end

					_G[Name] = Value
					if Info.Callback then
						Info.Callback()
					end
				end,
			})
		else
			warn(Name, "Not found")
		end
	end

	_G.AutoRob = false

	local EnabledAutoRobs, AutoRob = {}, nil

	local AutoRobberyOptions = Tabs.Robberies:Dropdown({
		Title = "Select Robberies",
		Values = {"Jewelry", "Bank", "ATMs", "Houses", "Bounty Vehicles"}, -- ATMs, "Houses",
		Multi = true,
		Value = {},
		Callback = function(SelectedRobberies)
			table.clear(EnabledAutoRobs)

			for i, RobberyName in pairs(SelectedRobberies) do
				EnabledAutoRobs[RobberyName] = true
			end
		end,
	})

	local PushCurrencyEvent = PushCurrency.OnClientEvent:Connect(function(NewCurr)
		if _G.AutoRob then
			pcall(function()
				local text = LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text
				local numberStr = text:gsub("%$ ", ""):gsub(",", "")
				local CurrentMoney = _G.LastCurrMoney or tonumber(numberStr)

				local PlusAmount = NewCurr-CurrentMoney

				if PlusAmount > 0 then
					_G.RobbedAmount += PlusAmount
				end
			end)
		else
			_G.LastCurrMoney = nil
		end
	end)

	function UpdatePushEvent()
		PushCurrencyEvent:Disconnect()
		
		PushCurrencyEvent = PushCurrency.OnClientEvent:Connect(function(NewCurr)
			if _G.AutoRob then
				pcall(function()
					local text = LocalPlayer.PlayerGui.GameGui.MainHUD.Currency.Text
					local numberStr = text:gsub("%$ ", ""):gsub(",", "")
					local CurrentMoney = _G.LastCurrMoney or tonumber(numberStr)

					local PlusAmount = NewCurr-CurrentMoney

					if PlusAmount > 0 then
						_G.RobbedAmount += PlusAmount
					end
				end)
			else
				_G.LastCurrMoney = nil
			end
		end)
	end
	
	LocalPlayer.CharacterAdded:Connect(function()
		task.delay(4, UpdatePushEvent)
	end)

	AutoRob = Tabs.Robberies:Toggle({
		Title = "AutoRob   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
				if Value then
					WindUI:Notify({
						Title = "Warning (Premium Feature)",
						Content = "'AutoRob' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
						Duration = 10,
					})
					AutoRob:Set(false)
				end
				return
			end

			if not Functions:GetLocalPlayerCar() and Value then
				WindUI:Notify({
					Title = "AutoRob",
					Content = "Please Spawn your Vehicle and Re-enable god mode to use AutoRob.",
					Duration = 10,
				})
				AutoRob:Set(false)
				return
			end

			if not Functions:IsDisablerOn() and Value then
				_G.PushNotification("Yellow", "Please enable god mode to use AutoRob.")
				AutoRob:Set(false)
				return
			end

			pcall(function()
				Functions:GetLocalPlayerCar().ModelStreamingMode = Enum.ModelStreamingMode.Persistent
			end)

			_G.AutoRob = Value
			_G.StartTime = os.time()

			task.spawn(function()
				while _G.AutoRob and task.wait(0.1) do
					Functions:LoadPlayerZone(SpecialLocations["SafeSpot"], 5)
				end
			end)

			_G.RobbedAmount = 0

			_G.BountyVehiclesRobs = 0
			_G.JewelryRobs = 0
			_G.BankRobs = 0
			_G.ATMSRobs = 0

			while _G.AutoRob and task.wait() do
				if not Functions:IsDisablerOn() then
					local GodModeEnabled = EnabledGodMode()
					if not GodModeEnabled then
						Humanoid.Sit = true
						task.wait()
						Humanoid.Sit = false

						task.wait(Functions:GetPing())
						GodModeEnabled = EnabledGodMode()
						if not GodModeEnabled then
							WindUI:Notify({
								Title = "Auto God Mode",
								Content = "Failed to auto enable god mode.",
								Duration = 5,
							})
						end
					end
				end

				if not Functions:IsDisablerOn() then
					_G.PushNotification("Yellow", "Please enable god mode")
					continue
				end

				if _G.AutoRob and EnabledAutoRobs["Jewelry"] and not _G.RobJewelryCooldown then
					pcall(RobJewelry)
				end

				if _G.AutoRob and EnabledAutoRobs["Bank"] and not _G.RobBankCooldown then
					pcall(RobBank)
					Functions:ClientTP(SpecialLocations["SafeSpot"], true)
				end

				if _G.AutoRob and EnabledAutoRobs["ATMs"] and not _G.RobATMsCooldown then
					pcall(RobATM)
					Functions:ClientTP(SpecialLocations["SafeSpot"], true)
				end

				if _G.AutoRob and EnabledAutoRobs["Houses"] and not _G.RobHousesCooldown then
					pcall(RobHouses)
					Functions:ClientTP(SpecialLocations["SafeSpot"], true)
				end

				if _G.AutoRob and EnabledAutoRobs["Bounty Vehicles"] and not _G.RobCarsCooldown then 
					pcall(RobBountyVehicle, EnabledGodMode)
					Functions:ClientTP(SpecialLocations["SafeSpot"], true)
				end
			end
		end,
	})

	task.spawn(function()
		if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then return end

		local LastATMUI, OldFunction, OldIndx, LastEnabled

		while task.wait(0.2) do
			task.spawn(pcall, function()
				local ActualATMUI = LocalPlayer.PlayerGui.GameMenus.ATM.Hacking.ClickButton
				if LastATMUI == ActualATMUI then
					if _G.InfiniteATM and not LastEnabled then
						setupvalue(OldFunction, OldIndx, 5e5)
						LastEnabled = true
					elseif LastEnabled then
						setupvalue(OldFunction, OldIndx, 1)
						LastEnabled = false
					end
				else
					for _, Connection in pairs(getconnections(ActualATMUI.MouseButton1Down)) do
						local Func = Connection.Function
						if type(Func) == "function" and debug.info(Func, "l") > 1 then
							for Indx, Value in pairs(getupvalues(Func)) do
								if Value == 1 or Value == 2 or Value > 1000 then
									OldIndx = Indx
									OldFunction = Func
									LastEnabled = false
									LastATMUI = ActualATMUI
									return
								end
							end
						end
					end
				end
			end)
		end
	end)

	local GunToBuy, GearToBuy = "", ""

	local GunsDropdown = Tabs.Automation:Dropdown({
		Title = "Guns",
		Values = GameGuns,
		Multi = false,
		Value = "AK47",
		Callback = function(Value)
			GunToBuy = Value
		end
	})

	Tabs.Automation:Dropdown({
		Title = "Gears",
		Values = GameTools,
		Multi = false,
		Value = "RFID Disruptor",
		Callback = function(Value)
			GearToBuy = Value
		end
	})

	do
		local OnCooldown = false
		local Cooldown = 2
		Tabs.Automation:Button({
			Title = "Buy gun",
			Desc = "Buys the gun you have selected in guns the dropdown",
			Callback = function()
				if OnCooldown then
					return
				end
				WindUI:Notify({
					Title = "Gun Buyer",
					Content = "Buying gun...",
					Duration = 2,
				})

				if GunToBuy == "" or tostring(GunToBuy) == "0" then
					WindUI:Notify({
						Title = "Gun Buyer",
						Content = "No gun selected!",
						Duration = 2,
					})
					return
				end

				if Functions:IsAlive(Humanoid) and HumanoidRootPart then
					OnCooldown = true
					task.delay(Cooldown, function()
						OnCooldown = false
					end)

					local Response = GetDataAttribute:InvokeServer("GunData")
					local BuyedGuns = Response.Civilian

					local OldPos = HumanoidRootPart.CFrame

					local BuyResponse, Buyed
					if not BuyedGuns[GunToBuy] then
						Functions:SecureTP(TeleportLocations["Gun Store"])

						if GunToBuy == "Ammo Box" then
							BuyGearRemote:InvokeServer(GunToBuy)
							Functions:SecureTP(OldPos)
							return
						else
							BuyResponse = BuyGunRemote:InvokeServer(GunToBuy)
							while string.lower(BuyResponse):find("too far") do
								Functions:SecureTP(TeleportLocations["Gun Store"])
								BuyResponse = BuyGunRemote:InvokeServer(GunToBuy)
							end

							task.wait(0.2)
							Buyed = true
							BuyedGuns = GetDataAttribute:InvokeServer("GunData").Civilian
						end
					end

					local EquipResponse
					if BuyedGuns[GunToBuy] then
						if not BuyedGuns[GunToBuy].equipped then
							Functions:SecureTP(TeleportLocations["Gun Store"])
							EquipResponse = EquipGunRemote:InvokeServer(GunToBuy, true)
							while string.lower(EquipResponse):find("too far") do
								Functions:SecureTP(TeleportLocations["Gun Store"])
								EquipResponse = EquipGunRemote:InvokeServer(GunToBuy, true)
							end
						elseif not Buyed then
							Functions:SecureTP(OldPos)

							return WindUI:Notify({
								Title = "Gun Buyer",
								Content = "You already had this tool equipped.",
								Duration = 3,
							})
						end
					end

					if EquipResponse and EquipResponse ~= "Equipped" and EquipResponse ~= "Already equipped" then
						WindUI:Notify({
							Title = "Gun Buyer",
							Content = "Failed to Equip Gun " .. EquipResponse,
							Duration = 5,
						})
					else
						WindUI:Notify({
							Title = "Gun Buyer",
							Content = (BuyResponse == "Good" and "Bought gun!") or "Equipped",
							Duration = 3,
						})
					end

					Functions:SecureTP(OldPos)
				else
					WindUI:Notify({
						Title = "Gun Buyer",
						Content = "No character found!",
						Duration = 2,
					})
					return
				end
			end
		})
	end

	do
		local OnCooldown = false
		local Cooldown = 2

		Tabs.Automation:Button({
			Title = "Buy Gear",
			Desc = "Buys the gear you have selected in the gears dropdown",
			Callback = function()
				if OnCooldown then
					return
				end

				if GearToBuy == "" or tostring(GearToBuy) == "0" then
					WindUI:Notify({
						Title = "Gear Buyer",
						Content = "No Gear selected!",
						Duration = 2,
					})
					return
				end

				if Functions:IsAlive(Humanoid) and HumanoidRootPart then
					OnCooldown = true
					task.delay(Cooldown, function()
						OnCooldown = false
					end)

					local Response = BuyGear(GearToBuy, false, Cooldown - 0.25)

					WindUI:Notify({
						Title = "Gear Buyer",
						Content = (Response == "Good" and "Bought!" or Response),
						Duration = 2,
					})
				else
					WindUI:Notify({
						Title = "Gear Buyer",
						Content = "No character found!",
						Duration = 2,
					})
					return
				end
			end
		})
	end

	Tabs.Automation:Section({	Title = "XP Farms"})

	Tabs.Automation:Toggle({
		Title = "DOT XP Farm",
		Value = false,
		Callback = function(Value)
			_G.DOTFarm = Value
			while _G.DOTFarm and task.wait() do
				FE:WaitForChild("DOTCollectDebris"):InvokeServer()
			end
		end,
	})

	Tabs.Automation:Toggle({
		Title = "Fire Department XP Farm",
		Value = false,
		Callback = function(Value)
			_G.FDFarm = Value
			while _G.FDFarm and task.wait(2) do
				ReplicatedStorage:WaitForChild("Tools", 9e9):WaitForChild("EMSHeal", 9e9):FireServer(LocalPlayer)
			end
		end,
	})

	task.spawn(function()
		local Cooldown = 0.5
		local OnCooldown = false

		Tabs.Trolling:Button({
			Title = "Make Closest Vehicle Dirt   👑",
			Desc = "Adds a dirt texture to the closest vehicle (Gets the closest non-driven vehicle)",
			Locked = (not LRM_IsUserPremium),
			Callback = function()
				if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
					WindUI:Notify({
						Title = "Warning (Premium Feature)",
						Content = "'Make Closest Vehicle Dirt' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
						Duration = 10,
					})
					return
				end

				if OnCooldown == true then return end

				if Functions:IsDisablerOn() then
					WindUI:Notify({
						Title = "VehicleDirt",
						Content = "Cannot use this feature while having God Mode on!",
						Duration = 5,
					})

					return
				end
				local ClosestVehicle = Functions:GetClosestVehicle(true)

				if not ClosestVehicle then
					WindUI:Notify({
						Title = "Dirtify",
						Content = "No close vehicle found",
						Duration = 5,
					})
					return
				end

				OnCooldown = true
				task.delay(Cooldown, function()
					OnCooldown = false
				end)

				ClosestVehicle.DriverSeat:Sit(Humanoid)

				task.wait(Functions:GetPing() - 0.07)

				SetCarDirt:FireServer(ClosestVehicle, -9e9)
			end
		})
	end)

	Tabs.Trolling:Section({	Title = "Fun"})

	Tabs.Trolling:Toggle({
		Title = "Walk Fling",
		Desc = "Lets you fling vehicle/people when you walk [GOD MODE & NOCLIP RECOMMENDED]",
		Value = false,
		Callback = function(Value)
			_G.WalkFling = Value
		end,
	})

	Tabs.Trolling:Toggle({
		Title = "Car Fling",
		Desc = "Makes the current driven vehicle fling other vehicles/people [GOD MODE & NOCLIP RECOMMENDED]",
		Value = false,
		Callback = function(Value)
			_G.CarFling = Value
		end,
	})
	
	Tabs.Trolling:Toggle({
		Title = "Fake Mod Calls   👑",
		Desc = "Displays Mod Calls allowing you to teleport to players",
		Locked = (not LRM_IsUserPremium),
		Value = false,
		Callback = function(Value)
			if LRM_IsUserPremium and LRM_UserNote ~= "Ad Reward" then
				_G.DisplayModCalls = Value
			end
		end,
	})

	Tabs.Trolling:Section({	Title = "OP"})

	--[[
	Tabs.Trolling:Toggle({
		Title = "Chat Bypasser   👑",
		Value = false,
		Locked = (not LRM_IsUserPremium),
		Callback = function(Value)
			if not LRM_IsUserPremium or LRM_UserNote == "Ad Reward" then
				WindUI:Notify({
					Title = "Warning (Premium Feature)",
					Content = "'Chat Bypasser' is a Premium feature, buy ERX Premium to be able to use this feature (check in the Discord Server how).",
					Duration = 10,
				})
				return
			end

			_G.ChatBypass = Value

			if Value then
				WindUI:Notify({
					Title = "Chat Bypasser",
					Content = "You must change your language to Қазақ Тілі in your roblox acc settings for the bypasser to work.",
					Duration = 8,
				})
			end
		end,
	})
	]]

	Tabs.Trolling:Toggle({
		Title = "Punch Aura",
		Value = false,
		Callback = function(Value)
			_G.PunchAura = Value

			while _G.PunchAura and task.wait(0.2) do
				task.spawn(pcall, function()
					if Functions:IsAlive(Humanoid) then
						for _,Player in ipairs(Players:GetPlayers()) do
							if Player == LocalPlayer then continue end

							local THumanoid = Player and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")

							if THumanoid and Player.Character.PrimaryPart and THumanoid.Health > 0.101 then
								local PlayerDistance = LocalPlayer:DistanceFromCharacter(Player.Character.PrimaryPart.Position)

								if PlayerDistance < 17 then
									PunchEvent:FireServer(Player)
								end
							end
						end
					end
				end)
			end
		end,
	})

	_G.Invisibility = false

	local InvisibilityExploit

	InvisibilityExploit = Tabs.Trolling:Toggle({
		Title = "Invisibility",
		Desc = "Become invisible 👻",
		Value = false,
		Callback = function(Value)
			_G.Invisibility = Value
			
			if not Functions:IsAlive(Humanoid) then
				return InvisibilityExploit:Set(false)
			end

			if _G.Invisibility and HumanoidRootPart then
				if Character:FindFirstChild("InvisMark") or Functions:IsDisablerOn() then
					WindUI:Notify({
						Title = "Invisibility",
						Content = (Character:FindFirstChild("InvisMark") and "You are already invisible." or "You cannot use this while having 'God Mode' Enabled"),
						Duration = 4,
					})
					
					return InvisibilityExploit:Set(false)
				end

				local OldCFrame = HumanoidRootPart.CFrame

				Functions:ClientTP(HumanoidRootPart.CFrame * CFrame.new(0, 1e7, 0))

				Humanoid.PlatformStand = true

				task.wait(Functions:GetPing() + 0.1)

				Functions:SetHookFor(RagdollEvent, "OnClientEvent", function() end, false) -- Disable Ragdoll Effects
				
				local StartTick = tick()
				local Response
				
				while Response ~= "Success" or tick() - StartTick > 3 do
					Response = ToggleRagdoll:InvokeServer()
					if Response == "Success" then
						break
					end
					
					HumanoidRootPart.Velocity = Vector3.zero
				end
				
				if tick() - StartTick > 3 then
					WindUI:Notify({
						Title = "Invisibility",
						Content = "Invis timeout, Please try again!",
						Duration = 5,
					})
					
					Functions:ClientTP(OldCFrame)
					return InvisibilityExploit:Set(false)
				end

				repeat task.wait() until Character:FindFirstChild("RAGDOLLED")
				
				local Mark = Character.RAGDOLLED
				Mark.Name = "InvisMark"

				Mark.Destroying:Once(function()
					if _G.Invisibility then
						WindUI:Notify({
							Title = "Invisibility",
							Content = "You are no longer Invisible.",
							Duration = 5,
						})

						task.delay(0.5, function()
							InvisibilityExploit:Set(false)
						end)
					end
				end)

				for _, v in ipairs(Character:GetDescendants()) do
					if v:IsA("Motor6D") then
						v.Part1 = v.Parent
					end
				end
				
				HumanoidRootPart.Velocity = Vector3.zero

				task.wait()

				Functions:SetHookFor(RagdollEvent, "OnClientEvent", false) -- Revert Hook

				task.wait(0.5)
				Functions:ClientTP(OldCFrame)
				Humanoid.PlatformStand = false

				WindUI:Notify({
					Title = "Invisibility",
					Content = "Successfully made you invisible!",
					Duration = 5,
				})

				for _, BasePart in ipairs(Character:GetChildren()) do
					if BasePart:IsA("BasePart") and BasePart.Transparency == 0 then
						BasePart.Transparency = 0.6
					end
				end
			elseif Character:FindFirstChild("InvisMark") then
				WindUI:Notify({
					Title = "Invisibility",
					Content = "Turning off invisibility, Please wait!",
					Duration = 5,
				})

				local Response
				while Response ~= "Success" do
					Response = ToggleRagdoll:InvokeServer()
					task.wait(0.2)
				end

				WindUI:Notify({
					Title = "Invisibility",
					Content = "Successfully turned off invisibility.",
					Duration = 3,
				})

				for _, BasePart in ipairs(Character:GetChildren()) do
					if BasePart:IsA("BasePart") and BasePart.Transparency >= 0.51 and BasePart.Transparency <= 0.8 then
						BasePart.Transparency = 0
					end
				end
			end
		end,
	})

	LocalPlayer.CharacterAdded:Connect(function()
		InvisibilityExploit:Set(false)
	end)

	local PlaceTPS = Tabs.Teleports:Dropdown({
		Title = "Place TPs",
		Values = (function()
			local keys = {}
			for key in pairs(TeleportLocations) do
				table.insert(keys, key)
			end
			return keys
		end)(),
		Multi = false,
		Value = "",
		Callback = function(Value)
			tpLocation = Value
		end,
	})

	Tabs.Teleports:Button({
		Title = "Teleport To Location",
		Desc = "Teleports you to a set location",
		Callback = function()
			local targetPosition = TeleportLocations[tpLocation]

			if targetPosition then
				local success, err = pcall(function()
					Functions:SecureTP(targetPosition, true)
				end)

				if success then
					WindUI:Notify({
						Title = "Teleport",
						Content = "Attempted to TP to location: " .. tpLocation,
						Duration = 5,
					})
				else
					WindUI:Notify({
						Title = "Teleport",
						Content = "Failed to TP to location: " .. tpLocation .. " " .. err,
						Duration = 5,
					})
				end
			end
		end
	})

	Tabs.Teleports:Button({
		Title = "Teleport to a random Bounty Vehicle",
		Desc = "Teleports you to a random Bounty Vehicle",
		Callback = function()
			if Functions:IsAlive(Humanoid) and HumanoidRootPart and Humanoid then
				local RandomBountyVehicle = Functions:GetRandomBountyVehicle()

				if not RandomBountyVehicle then
					WindUI:Notify({
						Title = "Random Bounty Vehicle",
						Content = "No bounty vehicle found",
						Duration = 5,
					})
					return
				end

				local VehicleCFrame = RandomBountyVehicle:GetPivot() * CFrame.new(0, 6, 0)
				Functions:SecureTP(VehicleCFrame, true)
			end
		end
	})

	_G.WaypointTP = false

	Tabs.Teleports:Toggle({
		Title = "Waypoint Teleport",
		Value = false,
		Callback = function(Value)
			_G.WaypointTP = Value
		end,
	})

	local ToggleMemberVisibility

	ToggleMemberVisibility = Tabs.Settings:Toggle({
		Title = "Toggle Visibility",
		Desc = "Toggles if an ERX User can see that you have ERX Executed",
		Value = false,
		Callback = function(Value)
			local Info = LocalPlayer:FindFirstChild("RoleplayInfo")

			local LocalPlayerName = LocalPlayer.Name

			if not Info then
				WindUI:Notify({
					Title = "PlayerVisibility",
					Content = "No Info found? please try respawning and do this again",
					Duration = 5,
				})

				ToggleMemberVisibility:Set(false)
				return
			end

			if Value then
				local NewERXName

				if #LocalPlayerName >= 6 then
					local nameChars = {}
					for i = 1, #LocalPlayerName do
						nameChars[i] = LocalPlayerName:sub(i, i)
					end
					nameChars[2] = "E"
					nameChars[4] = "R"
					nameChars[6] = "X"
					NewERXName = table.concat(nameChars)
				else
					NewERXName = "JESRSX"
				end

				local NameResponse = ChangeRoleplayInfo:InvokeServer({
					["BackgroundStyle"] = Info.BackgroundStyle.Value,
					["HairColor"] = (Info.HairColor.Value ~= "" and Info.HairColor.Value or "Black"),
					["EyeColor"] = Info.EyeColor.Value,
					["HeightFeet"] = Info.HeightFeet.Value,
					["Age"] = Info.Age.Value,
					["Name"] = NewERXName,
					["Weight"] = Info.Weight.Value,
					["HeightInches"] = Info.HeightInches.Value,
					["License"] = "Active",
					["Gender"] = (Info.Gender.Value ~= "" and Info.Gender.Value or "Other")
				})

				if NameResponse ~= "Success" then
					NameResponse = ChangeRoleplayInfo:InvokeServer({
						["BackgroundStyle"] = Info.BackgroundStyle.Value,
						["HairColor"] = (Info.HairColor.Value ~= "" and Info.HairColor.Value or "Black"),
						["EyeColor"] = Info.EyeColor.Value,
						["HeightFeet"] = Info.HeightFeet.Value,
						["Age"] = Info.Age.Value,
						["Name"] = "zEzRzX",
						["Weight"] = Info.Weight.Value,
						["HeightInches"] = Info.HeightInches.Value,
						["License"] = "Active",
						["Gender"] = (Info.Gender.Value ~= "" and Info.Gender.Value or "Other")
					})
				end

				if NameResponse == "Success" then
					WindUI:Notify({
						Title = "PlayerVisibility",
						Content = "Changed Visibility successfully!",
						Duration = 5,
					})
				else
					WindUI:Notify({
						Title = "PlayerVisibility",
						Content = "Failed to set visibility",
						Duration = 5,
					})
				end
			elseif not Value and Functions:IsVisibleERXUser(LocalPlayer) then
				local Response = ChangeRoleplayInfo:InvokeServer({
					["BackgroundStyle"] = Info.BackgroundStyle.Value,
					["HairColor"] = (Info.HairColor.Value ~= "" and Info.HairColor.Value or "Black"),
					["EyeColor"] = Info.EyeColor.Value,
					["HeightFeet"] = Info.HeightFeet.Value,
					["Age"] = Info.Age.Value,
					["Name"] = LocalPlayerName,
					["Weight"] = Info.Weight.Value,
					["HeightInches"] = Info.HeightInches.Value,
					["License"] = "Active",
					["Gender"] = (Info.Gender.Value ~= "" and Info.Gender.Value or "Other")
				})

				if Response == "Success" then
					WindUI:Notify({
						Title = "PlayerVisibility",
						Content = "Changed Visibility successfully!",
						Duration = 5,
					})
				else
					WindUI:Notify({
						Title = "PlayerVisibility",
						Content = "Failed to set visibility....... Somehow",
						Duration = 5,
					})
				end
			end
		end,
	})
	
	Tabs.Settings:Input({
		Title = "Discord Webhook",
		Desc = "Webhook where Info should be sent",
		Value = "",
		Type = "Input",
		Placeholder = "https://discord.com/api/webhooks/...",
		Callback = function(Input) 
			_G.DiscordWebhook = Input
		end
	})
	
	function FormatNumber(n)
		return tostring(n):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
	end
	
	function FormatTimeAgo(seconds)
		local minutes = math.floor(seconds / 60)
		local hours = math.floor(minutes / 60)
		minutes = minutes % 60
		local secs = seconds % 60

		if hours > 0 then
			return string.format("%dh %dm %ds ago", hours, minutes, secs)
		elseif minutes > 0 then
			return string.format("%dm %ds ago", minutes, secs)
		else
			return string.format("%d seconds ago", secs)
		end
	end
	
	Tabs.Settings:Toggle({
		Title = "Autorob Webhook Info",
		Desc = "Toggles DISCORD Webhook Notifications for autorob",
		Value = false,
		Callback = function(Value)
			_G.AutoRobWebhookNotifier = Value
			
			while _G.AutoRobWebhookNotifier and task.wait() do
				if _G.DiscordWebhook and _G.DiscordWebhook:find("discord.com/api/webhooks/") and _G.AutoRob then
					local Webhook = _G.DiscordWebhook:gsub("\n", "")
					
					task.spawn(pcall, function()
						local Robbed = _G.RobbedAmount or 0
						local PlayerCount = #Players:GetPlayers()
						local StartTime = _G.StartTime or (os.time() - 60)
						local Elapsed = os.time() - StartTime
						local HourlyEstimate = Elapsed > 0 and math.floor((Robbed / Elapsed) * 3600) or 0

						local BodyData = {
							username = "ERX AutoRob Info",
							embeds = {{
								title = "ER:LC | AutoFarm",
								url = "https://discord.gg/mJBBD2c7de",
								color = 9043968,
								fields = {
									{
										name = "`💰` AutoRob Stats:",
										value = table.concat({
											"‎",
											"**`💵` Total Cash Robbed**",
											"```",
											"$" .. FormatNumber(Robbed),
											"```",
											"**`🧍‍♂️` Player Count**",
											"```",
											tostring(PlayerCount),
											"```",
											"`📅` **Started**",
											"```",
											FormatTimeAgo(Elapsed),
											"```",
											"`💸` **Estimated Earnings/Hour**",
											"```",
											"$" .. FormatNumber(HourlyEstimate),
											"```"
										}, "\n"),
										inline = true
									},
									{
										name = "`🪙` Robbed:",
										value = table.concat({
											"‎",
											"**`🏦` Bank**",
											"```",
											tostring(_G.BankRobs or 0) .. " Times",
											"```",
											"**`💎` Jewelry**",
											"```",
											tostring(_G.JewelryRobs or 0) .. " Times",
											"```",
											"`🚔` **Bounty Vehicles**",
											"```",
											tostring(_G.BountyVehiclesRobs or 0) .. " Times",
											"```",
											"`🏧` **ATM**",
											"```",
											tostring(_G.ATMSRobs or 0) .. " Times",
											"```"
										}, "\n"),
										inline = true
									}
								},
								footer = {
									text = "ERX AutoRob | Fastest AutoRob on ER:LC",
									icon_url = "https://cdn.discordapp.com/avatars/1381151649980219532/53259895fc40cbcf600873eddd196e61.png"
								}
							}}
						}

						local HttpService = game:GetService("HttpService")
						local Webhook = _G.DiscordWebhook:gsub("\n", "")

						if _G.LastRobMessage then
							request({
								Url = Webhook .. "/messages/" .. _G.LastRobMessage,
								Method = "PATCH",
								Headers = {
									["Content-Type"] = "application/json"
								},
								Body = HttpService:JSONEncode(BodyData)
							})
						else
							local response = request({
								Url = Webhook .. "?wait=true",
								Method = "POST",
								Headers = {
									["Content-Type"] = "application/json"
								},
								Body = HttpService:JSONEncode(BodyData)
							})

							local data = typeof(response.Body) == "string" and HttpService:JSONDecode(response.Body)
							if data and data.id then
								_G.LastRobMessage = data.id
							end
						end
					end)
					task.wait(3)
				end
				
				if not _G.AutoRob then
					_G.LastRobMessage = nil
				end
			end
		end,
	})
	
	task.spawn(function()
		ReplicatedStorage:WaitForChild("ClientBinds", 9e9):WaitForChild("SetMapMarker", 9e9).Event:Connect(function(Info, Position, IsLocalPlayers)
			if _G.WaypointTP and Info == "CustomWaypoint" and IsLocalPlayers and Position then
				Functions:SecureTP(Position, true)
			end
		end)
	end)

	_G.Functions = {
		IsLocalPlayerInOwnVehicle = Functions.IsLocalPlayerInOwnVehicle,
		GetCurrentLocalPlayerCar = Functions.GetCurrentLocalPlayerCar,
		GetClosestVehicle = Functions.GetClosestVehicle,
		GetRandomVehicle = Functions.GetRandomVehicle,
		IsGodModeEnabled = Functions.IsDisablerOn,
		IsPlayerWanted = Functions.IsWanted,
		ToolIsAnGun = Functions.ToolIsAnGun,
		TeleportTo = function(self, ...)
			return Functions:SecureTP(...)
		end,
		getRemote = SafeGetRemote,
		IsPRCMod = Functions.IsPRCMod,
		BuyGear = function(self, ...)
			BuyGear(...)
		end,
	}

	LocalPlayer.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)

	local ConfigManager = Window.ConfigManager
	local myConfig = ConfigManager:CreateConfig("ERX_ERLC")

	Tabs.Settings:Keybind({
		Title = "Open UI",
		Desc = "Keybind to open ui",
		Value = "LeftControl",
		Callback = function(v)
			Window:SetToggleKey(Enum.KeyCode[v])
		end
	})

	myConfig:RegisterAll()
	task.spawn(myConfig.Load)

	Tabs.Settings:Button({
		Title = "Save Actual Config",
		Desc = "The next time you run ERX the current config will be set.",
		Callback = function()
			local Succes, ErrorText = pcall(myConfig.Save)
			if Succes then
				WindUI:Notify({
					Title = "Actual Config Saved",
					Content = "Your actual config was saved correctly",
					Duration = 10,
				})
			else
				WindUI:Notify({
					Title = "Failed to Save actual Config",
					Content = "Error: " .. tostring(ErrorText),
					Duration = 10,
				})
			end
		end
	})

	FE:WaitForChild("IsFocused", 9e9).OnClientInvoke = function()
		return true
	end

	WindUI:Notify({
		Title = "Loaded in "..string.format("%.3f", tick() - Start).." Seconds!",
		Content = "Have fun using the script!",
		Duration = 8,
	})

	local AlreadyNotified = {}

	while not WLCheckLocalPlayer do task.wait() end

	if PrivateMembers[LocalPlayer.Name] then
		WindUI:Notify({
			Title = "Whitelist System",
			Content = "You are a private member!",
			Duration = 14,
		})

		while task.wait(5) do
			foreach(PrivateMembers, function(PrivateName)
				if PrivateName ~= LocalPlayer.Name and not AlreadyNotified[PrivateName] then
					WindUI:Notify({
						Title = "Whitelist System",
						Content = PrivateName .. " is a private member",
						Duration = 20,
					})
					AlreadyNotified[PrivateName] = true
				end
			end)
		end
	end
else
	warn("Game is not supported.")
end