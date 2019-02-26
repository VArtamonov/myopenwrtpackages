---
---

local uci = require "luci.model.uci"
local mws = require "luci.tools.mywebserver"		-- multiused functions

--local m = Map("mywebserver", translate("Log Overview"), translate("Log overview test"))
--m:chain("mywebserver")
--m.pageaction = false

m = SimpleForm("mywebserver", translate("Log view"), translate("This list gives an overview over currently log web server and their status."))
m.reset = false
m.submit = false

---s = m:section(TypedSection, "logview", "")
---s.anonymous = true
---s.addremove = true

l = {}
local val
uci:foreach("mywebserver", "logview", function (s)
	ll = {}
	ll.name = s.name
	ll.filename = s.filename
	ln = mws.get_nl(s.filename)
	ll.nlines = tostring(ln)

	table.insert(l, ll)
	end)

s = m:section(Table, l)
s.reset = false
s.submit = false

---function s.parse(self, ...)
---	TypedSection.parse(self, ...)
---	-- os.execute("/etc/init.d/led enable")
---end
s:option(DummyValue, "name", translate("Name"))
s:option(DummyValue, "filename", translate("File Name"))
s:option(DummyValue, "nlines", translate("Number lines"))

return m


