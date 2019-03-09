#!/usr/bin/env lua

-- Example of script that uses the fastcgi launcher to launch application
--
-- cgilua.put"Oi!"
-- io.write"something\n"
-- cgilua.errorlog ("eca", "emerg")
--

local ok, err = pcall(require, "wsapi.fastcgi")

if not ok then
  io.stderr:write("WSAPI FastCGI not loaded:\n" .. err .. "\n\nPlease install wsapi-fcgi with LuaRocks\n")
  os.exit(1)
end

local fastcgi = require"wsapi.fastcgi"
local common = require "wsapi.common"
local lfcgi = require"lfcgi"

local function myerrorlog(msg)
	local error = lfcgi.stderr
        error:write (msg)
end

local ONE_HOUR = 60 * 60
local ONE_DAY = 24 * ONE_HOUR

local sapi_loader = common.make_isolated_launcher{
  filename = nil,           -- if you want to force the launch of a single script
  launcher = "cgilua.fcgi", -- the name of this launcher
  modname = "my-sapi",   -- WSAPI application that processes the script
  reload = true,            -- if you want to reload the application on every request
  period = ONE_HOUR,        -- frequency of Lua state staleness checks
  ttl = ONE_DAY,            -- time-to-live for Lua states
  vars =                    -- order of checking for the path of the script
   { "SCRIPT_FILENAME",
     "PATH_TRANSLATED" } 
}



-- errorlog("Example of script that uses the fastcgi launcher to launch application")
-- Calls the launcher, app.run is the WSAPI run method of the application

fastcgi.run(sapi_loader)

