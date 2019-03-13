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

-- require'ing the application. It should be in your package.path
local app = require"mylib.app-hello"

-- errorlog("Example of script that uses the fastcgi launcher to launch application")
-- Calls the launcher, app.run is the WSAPI run method of the application
fastcgi.run(app.run)
