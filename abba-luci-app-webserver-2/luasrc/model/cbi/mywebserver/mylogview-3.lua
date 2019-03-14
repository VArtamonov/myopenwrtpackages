
-- takeover arguments -- #######################################################
-- local section = arg[1]

--m = Map("wireless", translate("Wireless Overview"))
--m:chain("network")
--m.pageaction = false

-- local m = Map("mywebserver", translate("Log view").. " - " .. arg[1]:upper(), translate("Log view test"))
--  .. " - " .. arg[1]:upper()))
-- m:chain("mywebserver")
-- m.pageaction = false

-- local fs = require "nixio.fs"
local uci = require "luci.model.uci"
local mws = require "luci.tools.mywebserver"		-- multiused functions

--arg[1]:upper()

local d = mws.get_fnl(arg[1])

m = SimpleForm("mywebserver", translate("Log view").. " - '" .. d .."'", translate("Log view test"))
m.reset = false
m.submit = false

t = m:field(TextValue, "logview")
t.rmempty = true
t.rows = 50
t.wrap = "off"

function t.cfgvalue()
	line = ""
	nl, lines = mws.get_nl(d)
	if nl>0 then
	-- fs.readfile(d)
	-- print all line numbers and their contents
	--for k,v in pairs(lines) do
	--    print('line[' .. k .. ']', v)
	--end
		ii=1
		if nl>t.rows then
			ii=nl-t.rows
		end
		line = lines[ii]
		for i=ii+1,nl do
			line = line .."\n".. lines[i]
		end
	end
	return line
end

function m.handle(self, state, data)
--	if state == FORM_VALID then
--		if data.crons then
--			fs.writefile(cronfile, data.crons:gsub("\r\n", "\n"))
--			luci.sys.call("/usr/bin/crontab %q" % cronfile)
--		else
--			fs.writefile(cronfile, "")
--		end
--	end
	return true
end

m.redirect = luci.dispatcher.build_url("admin/mywebserver/logview")

return m

