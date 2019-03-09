---
---

local uci = require "luci.model.uci"
local mws = require "luci.tools.mywebserver"		-- multiused functions

--local m = Map("mywebserver", translate("Log Overview"), translate("Log overview test"))
--m:chain("mywebserver")
--m.pageaction = false

m = SimpleForm("mywebserver", translate("Status view"), translate("This list status."))
m.reset = false
m.submit = false

---s = m:section(TypedSection, "logview", "")
---s.anonymous = true
---s.addremove = true


tab1 = mws.get_ii()
s = m:section(Table, tab1)
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

return m


