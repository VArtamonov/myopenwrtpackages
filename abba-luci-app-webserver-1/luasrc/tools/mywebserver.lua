-- Copyright 2019
-- Licensed to the public under the Apache License 2.0.

module("luci.tools.mywebserver", package.seeall)

local uci = require "luci.model.uci".cursor()

--local sqlite3 = require("lsqlite3")
local dbo = require("mylib.my-database-tools")

function get_nl(file)
	nlines=0
	lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
		nlines = nlines + 1
	end
	return nlines, lines
end

---
---config logview
---	option name 'AccessLog'
---	option filename '/var/log/lighttpd/access.log'
---

function get_fnl(name)
	local val
	uci:foreach("mywebserver", "logview", function (s)
		if s.name == name then
			-- val = uci:get("mywebserver", "logview", "filename")
			val = s.filename
			return val
		end
	end)
	return val
end


function get_ii()
	local tab1 = {}
	-- tab1 = dbo.GetInfoTable()
	local ok, tab1 = xpcall(dbo.GetInfoTable, debug.traceback)
	return tab1
end
