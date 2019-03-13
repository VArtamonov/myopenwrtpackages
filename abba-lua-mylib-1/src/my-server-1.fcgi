#!/usr/bin/env lua

local ok, err = pcall(require, "wsapi.fastcgi")

if not ok then
  io.stderr:write("WSAPI FastCGI not loaded:\n" .. err .. "\n\nPlease install wsapi-fcgi\n")
  os.exit(1)
end

local common = require "wsapi.common"
local fastcgi = require"wsapi.fastcgi"

local ONE_HOUR = 60 * 60
local ONE_DAY = 24 * ONE_HOUR

local my_loader = common.make_isolated_launcher{
  filename = "", "/website/www/index.lp",           -- if you want to force the launch of a single script
  launcher = "my-server-1.fcgi", -- the name of this launcher
  modname = "mylib.my-sapi",   -- WSAPI application that processes the script
  reload = true,            -- if you want to reload the application on every request
  period = ONE_HOUR,        -- frequency of Lua state staleness checks
  ttl = ONE_DAY,            -- time-to-live for Lua states
  vars =                    -- order of checking for the path of the script
   { "SCRIPT_FILENAME",
     "PATH_TRANSLATED" } 
}

fastcgi.run(my_loader)


