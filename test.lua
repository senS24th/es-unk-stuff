--!nolint
--!nocheck

placeholder = {}
local p = {}

function AsCon(condition, testName, reason)
	if not condition then
		if not p[testName] then
			placeholder[testName] = reason
			p[testName] = true
			return condition, testName, reason
		end
	else
		p[""] = ""
		placeholder[testName] = true
		return condition, testName
	end
end

if getgenv().DebugMode then
	print("Getting depencencies")
end

local first, second = loadstring(game:HttpGet("https://gitlab.com/sens3/nebunu/-/raw/main/dep1.lua?ref_type=heads"))()
local nnn = loadstring(game:HttpGet("https://gitlab.com/sens3/nebunu/-/raw/main/dep2.lua?ref_type=heads"))()
local mmm = loadstring(game:HttpGet("https://gitlab.com/sens3/nebunu/-/raw/main/dep3.lua?ref_type=heads"))()

if getgenv().DebugMode then
	print("Got depencencies?")
end
task.wait(0.005)

if debug.getstack then
	local a, b = pcall(function()
		local pp = first .. second
		if debug.getstack(1)[1] ~= first .. second then
			if debug.getstack(1)[1] == "ab" then
				AsCon(4 < 3, "debug.getstack", "Try not to fake unc! CHALLENGE: IMPOSSIBLE")
			end
			AsCon(4 < 3, "debug.getstack", "Didn't return the correct value")
		end
		
		if debug.getstack(1, 1) ~= first .. second then
			if debug.getstack(1, 1) == "ab" then
				AsCon(4 < 3, "debug.getstack", "Try not to fake unc! CHALLENGE: IMPOSSIBLE")
			end
			AsCon(4 < 3, "debug.getstack", "NO TEST")
		end
	end)

	if not a then
		AsCon(4<3, "debug.getstack", b)
	end

	task.wait()
else
	AsCon(4<3, "debug.getstack", "function is nil")
end

if placeholder["debug.getstack"] == nil then
	AsCon(3 < 4, "debug.getstack", "")
end

if getgenv().DebugMode then
	print("Past getstack[1]")
end
task.wait(0.076)
if debug.getproto then
	local a, b = pcall(function()
		local m
		local function v()
			local function insider()
				local nnn =
					loadstring(game:HttpGet("https://gitlab.com/sens3/nebunu/-/raw/main/dep2.lua?ref_type=heads"))()
				m = nnn
				return nnn
			end
		end

		v()
		local a = debug.getproto(v, 1, true)
		if a[1]() ~= m then
			AsCon(4 < 3, "debug.getproto", "Didn't return the correct value from the proto")
		end

		local lok = debug.getproto(v, 1, true)
		if lok[1] ~= nil then
			if lok[1]() == true or lok[1]() == "true" then
				AsCon(4 < 3, "debug.getproto", "Good job trying to fake getproto 🤑(true, indeed)")
			end
		end

		local function func()
			local function proto()
				return "hi"
			end
			return proto
		end

		local real = func()
		local lol = debug.getproto(func, 1, true)[1]
		if real ~= lol then
			AsCon(4 < 3, "debug.getproto", "Returned proto shouldn't differ")
		end
	end)

	if not a then
		AsCon(4 < 3, "debug.getproto", b)
	end
else
	AsCon(4 < 3, "debug.getproto", "function is nil")
end

if placeholder["debug.getproto"] == nil then
	AsCon(3 < 4, "debug.getproto", "")
end

if getgenv().DebugMode then
	print("Past getproto[i]")
end

if debug.setstack == nil then
	AsCon(4 < 3, "debug.setstack", "function is nil")
end

local a, b = pcall(function()
	local realisimusimus = nnn
	local function t()
		return "=0", debug.setstack(1, 1, realisimusimus)
	end

	if (t() == realisimusimus) == false then
		AsCon(4 < 3, "debug.setstack", "Couldn't set the first stack item")
	end
end)

if not a then
	AsCon(4 < 3, "debug.setstack", b)
end

if placeholder["debug.setstack"] == nil then
	AsCon(3 < 4, "debug.setstack", "")
end

if getgenv().DebugMode then
	print("Past setstack")
end

if getrawmetatable then
	local a,b = pcall(function()
		local dummy = {}
		local dummy1 = {}
		setmetatable(dummy, { __metatable = dummy1 })
		if getrawmetatable(dummy) == dummy1 then
			AsCon(4 < 3, "getrawmetatable", "Me when I getmetatable super real and pro 👍👍")
		end

		local metatable = {}
		local object = setmetatable({}, metatable)
		local mt = getrawmetatable(workspace.CurrentCamera)

		if mt == nil or mt == "nil" then
			AsCon(4 < 3, "getrawmetatable", "Couldn't retrieve the raw metatable")
		else
			if mt.__mod or mt.__sub or mt.__idiv or mt.__lt or mt.__le or mt.__pow or mt.__concat then
				AsCon(4 < 3, "getrawmetatable", "So many options. Thank you, dear executor💔🙏")
			else
				local bloop = false
				local originalNewIndex = getrawmetatable(game).__newindex
				setreadonly(getrawmetatable(game), false)

				getrawmetatable(game).__newindex = function(self, index, value)
					if index == "FieldOfView" then
						bloop = true
					end
					return originalNewIndex(self, index, value)
				end

				workspace.Camera.FieldOfView = 70
				getrawmetatable(game).__newindex = originalNewIndex
				setreadonly(getrawmetatable(game), true)
				if bloop == false then
					AsCon(
						4 < 3,
						"getrawmetatable",
						"Didn't return the needed value (might be an attempt to fake getrawmetatable)"
					)
				end

				if not pcall(getrawmetatable, "") then
					AsCon(4 < 3, "getrawmetatable", "Failed to get the rawmetatable of a string")
				end

				if not pcall(getrawmetatable, Vector3.zero) then
					AsCon(4 < 3, "getrawmetatable", "Failed to get the rawmetatable of vector3")
				end
			end
		end
	end)
	if not a then
		AsCon(4<3, "getrawmetatable", b)
	end
	if placeholder["getrawmetatable"] == nil then
		AsCon(3 < 4, "getrawmetatable")
	end
else
	AsCon(4 < 3, "getrawmetatable", "function is nil")
end

if getgenv().DebugMode then
	print("Past getrmetatable")
end

local a, b = pcall(function()
	if hookmetamethod then
		local kuur = false
		local ogcall
		local popo, moopu = pcall(function()
			local callingscript = "none"
			local n = 18
			ogcall = hookmetamethod(game, "__index", function(...)
				kuur = true
				if callingscript ~= "CameraModule" then
					callingscript = tostring(getcallingscript())
				end
				return ogcall(...)
			end)

			repeat
				n = n - 1
				task.wait(0.1)
			until tostring(callingscript) == "CameraModule" or n <= 0

			if getgenv().DebugMode then
				print(callingscript, " cscript")
			end

			if n <= 0 and callingscript ~= "CameraModule" then
				AsCon(4 < 3, "getcallingscript", "Couldn't retrieve the needed value")
			else
				AsCon(3 < 4, "getcallingscript", "")
			end

			game:GetService("Lighting")

			if kuur == false then
				AsCon(4 < 3, "hookmetamethod", "Couldn't hook the metamethod")
			elseif kuur == true then
				AsCon(3 < 4, "hookmetamethod", "")
			end
		end)

		if not popo then
			AsCon(4 < 3, "hookmetamethod", b)
		else
			hookmetamethod(game, "__index", ogcall)
		end
	end
end)

if not a then
	AsCon(4 < 3, "hookmetamethod", b)
end

if getgenv().DebugMode then
	print("Past hookmetamethod/getcallingscript")
end

if getnamecallmethod then
	local a, b = pcall(function()
		if placeholder["hookmetamethod"] == false then
			AsCon(4 < 3, "getnamecallmethod", "Can't verify due to 'hookmetamethod' not working")
		end
		local o
		local a
		local b
		b = hookmetamethod(game, "__namecall", function(...)
			if not a then
				a = getnamecallmethod()
			end
			return b(...)
		end)

		game:IsA("Part")
		if a == "GetService" then
			AsCon(4 < 3, "getnamecallmethod", "Getting the service, gangy, hold on 🙏🔥")
		end
		if a ~= "IsA" then
			AsCon(4 < 3, "getnamecallmethod", "Couldn't get the namecallmethod")
		end
	end)

	if not a then
		AsCon(4 < 3, "getnamecallmethod", b)
	else
		if b then
			hookmetamethod(game, "__namecall", b)
		end
	end
else
	AsCon(4 < 3, "getnamecallmethod", "function is nil")
end

if placeholder["getnamecallmethod"] == nil then
	AsCon(3 < 4, "getnamecallmethod", "")
end

if getgenv().DebugMode then
	print("Past getnamecallmethod")
end

local a, b = pcall(function()
	if not checkcaller then
		AsCon(4 < 3, "checkcaller", "function is nil")
	end

	if placeholder["hookmetamethod"] ~= false then
		local old
		local good
		old = hookmetamethod(game, "__namecall", function(...)
			if good ~= true and good ~= false then
				good = checkcaller()
				if good == true and getgenv().DebugMode then
					print(getcallingscript())
				end
			end
			return old(...)
		end)
		task.wait(0.07)
		hookmetamethod(game, "__namecall", old)
		if good then
			AsCon(4 < 3, "checkcaller", "Very true, very pro return true checkcaller 👀🔥💲💯")
		end
	else
		AsCon(4 < 3, "checkcaller", "Can't test due to 'hookmetamethod' not working")
	end
end)

if getgenv().DebugMode then
	print("Past checkcaller[1]")
end

local a, b = pcall(function()
	if not hookfunction then
		AsCon(4<3, "checkcaller", "hookfunction is needed in order to test")
	end
	local old
	local realmoment = nil
	local executed = false
	old = hookfunction(getrawmetatable(game).__index, function(...)
		if not executed then
			realmoment = checkcaller()
			executed = true
		end
		return old(...)
	end)
	local a = 10
	repeat
		a -= 1
		task.wait(0.1)
	until executed and not realmoment or a <= 0
	hookfunction(getrawmetatable(game).__index, old)
	if realmoment then
		AsCon(4 < 3, "checkcaller", "Very true, very pro return true checkcaller \xf0\x9f\x91\x80 [2]")
	end
	--------------------------------------------------------------------------------------
	
	if getgenv().DebugMode then
		print("Past section1CC")
	end

	local old
	local realmoment = nil
	local executed = false
	old = hookfunction(getrawmetatable(game).__index, function(...)
		if not executed then
			realmoment = checkcaller()
			executed = true
		end
		return old(...)
	end)
	local _ = game.Players
	local a = 10
	repeat
		a -= 1
		task.wait(0.1)
	until executed or a <= 0
	hookfunction(getrawmetatable(game).__index, old)
	if not realmoment then
		AsCon(4 < 3, "checkcaller", "Very true, very pro return false checkcaller \xf0\x9f\x91\x80")
	end
	--------------------------------------------------------------------------------------

	if getgenv().DebugMode then
		print("Past section2CC")
	end

	if not checkcaller() then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in the main thread")
	end

	if not coroutine.wrap(function()
		return checkcaller()
	end)() then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in an exec-made thread[1]")
	end

	if not select(
		2,
		coroutine.resume(task.spawn(function()
			task.wait()
			return checkcaller()
		end))
	) then
		AsCon(4 < 3, "checkcaller", "Returned false when executed in an exec-made thread[2]")
	end

	local decisive = false
	local oldidentity = getthreadidentity()
	for _, v in { -0, 0, 8, math.huge } do
		setthreadidentity(v)
		decisive = decisive or not checkcaller()
	end
	if decisive then
		AsCon(4 < 3, "checkcaller", "Didn't return true regardless of thread's identity")
	end
	setthreadidentity(oldidentity)
end)

if not a then
	AsCon(4 < 3, "checkcaller", b)
end

if placeholder["checkcaller"] == nil then
	AsCon(3 < 4, "checkcaller", "")
end

if getgenv().DebugMode then
	print("Past checkcaller[2]")
end

local a, b = pcall(function()
	local a = getsenv(game.Players.LocalPlayer.Character.Animate)
	local b = false
	local c = function()
		b = true
	end
	hookfunction(a.onSeated, c)
	game.Players.LocalPlayer.Character.Humanoid.Sit = true
	task.wait(0.06)
	game.Players.LocalPlayer.Character.Humanoid.Sit = false
	if not b then
		AsCon(4 < 3, "hookfunction", "Failed to successfully hook a script's function")
	end
end)

if not a then
	AsCon(4 < 3, "hookfunction", b)
end

if not placeholder["hookfunction"] then
	AsCon(4<3, "hookfunction", "neutral")
end

local a, b = pcall(function()
	local boom = 3
	local ookok = "real"
	local potatopride = function(...)
		boom = "ookok"
		ookok = "boom"
		return ookok
	end

	local info = debug.getinfo(potatopride)
	if info.nups ~= 2 then
		AsCon(4 < 3, "debug.getinfo", "Didn't return the correct value for 'nups' ")
	end
end)

if not a then
	AsCon(4 < 3, "debug.getinfo", b)
end

if placeholder["debug.getinfo"] == nil then
	AsCon(4<3, "debug.getinfo", "neutral")
end

return placeholder
