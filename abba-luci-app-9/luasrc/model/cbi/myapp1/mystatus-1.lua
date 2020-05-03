---
---

local uci = require "luci.model.uci"
local mws = require "luci.tools.mywebserver"		-- multiused functions

m = Map("mywebserver", translate("Status view"), translate("This list status."))
--m:chain("mywebserver")
m.pageaction = false

-- m:section(SimpleSection).template  = "mywebserver/server-status"

dbs = m:section(TypedSection, "database", translate("Clear connection"))
a2 = dbs:option(Value, "filename", translate("Filename database:"))
a2.datatype = "file"
a2.readonly = true
e = dbs:option(Button, "endisable", translate("Clear"))
e.inputstyle = "reload"
function e.write(self, section)
	local val = m:get(section, "filename")
	mws.db_clear(val)
	luci.http.redirect(luci.dispatcher.build_url("admin/mywebserver", "status"))
end

tab1 = mws.get_ii()
s = m:section(Table, tab1, translate("List connection"))
s.reset = false
s.submit = false

---function s.parse(self, ...)
---	TypedSection.parse(self, ...)
---	-- os.execute("/etc/init.d/led enable")
---end

-- { index, ip, name, dt, number }
s:option(DummyValue, "index", translate("index"))
s:option(DummyValue, "ip", translate("IP Address"))
s:option(DummyValue, "name", translate("Host name"))
s:option(DummyValue, "dt", translate("Last Date/Time"))
s:option(DummyValue, "number", translate("Number connection"))
s:option(DummyValue, "req", translate("REQUEST_METHOD"))
s:option(DummyValue, "status", translate("STATUS"))

return m


