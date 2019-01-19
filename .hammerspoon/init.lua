hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners.radius = 4
spoon.RoundedCorners:start()

--function reloadConfig(files)
--	doReload = false
--	for _,file in pairs(files) do
--		if file:sub(-4) == ".lua" then
--			doReload = true
--		end
--	end
--	if doReload then
--		hs.reload()
--	end
--end
--configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

kicadScrolling = hs.eventtap.new({hs.eventtap.event.types.scrollWheel}, function(e)
	-- Trackpad scroll events are continuous, mouse scroll events are not.
	if 0 == e:getProperty(hs.eventtap.event.properties.scrollWheelEventIsContinuous) then
		local front = hs.application.frontmostApplication()
		if "KiCad" == front:name() then
			local title = front:focusedWindow():title()
			if "Eeschema" == title:sub(0, 8) or "Pcbnew" == title:sub(0, 6) then
				local flags = e:getFlags()
				flags['cmd'] = true
				e:setFlags(flags)
			--else
				--print(title)
			end
		end
	end
end):start()

hs.alert.show("Config reloaded")
