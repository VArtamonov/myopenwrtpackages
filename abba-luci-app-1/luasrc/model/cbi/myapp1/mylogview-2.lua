---
---
---

-- local fs = require "nixio.fs"
local uci = require "luci.model.uci"
local mws = require "luci.tools.mywebserver"		-- multiused functions
local tpl = require "luci.template"

-- takeover arguments -- #######################################################
local section = arg[1]

local d = mws.get_fnl(section)

m = Map("mywebserver")
m.title = translate("Log view")
m.description = translate("File: ") .. "'" .. d .."'"
m.pageaction = true
m.flow.hideapplybtn = true
m.flow.hidesavebtn = true
m.flow.hideresetbtn = true

local function getlinelog(self)
	line = {}
	nl, lines = mws.get_nl(d)
	if nl>0 then
		ii=1
		if nl>self.rows then
			ii = nl - self.rows
		end
		--"[" .. ii  .."] " ..lines[ii]
		line[tonumber(ii)] = { ["index"] = tostring(ii), ["str"]= lines[ii]}
		for i=ii+1,nl do
			--line = line .."\n".. "[" .. i  .."] " .. lines[i]
			line[tonumber(i)] = { ["index"] = tostring(i), ["str"]= lines[i]}
		end
	end
	return line
end

-- <textarea class="cbi-input-textarea" <% if not self.size then %> style="width: 100%"<% else %> cols="<%=self.size%>"<% end %> data-update="change"<%= attr("name", cbid) .. attr("id", cbid) .. ifattr(self.rows, "rows") .. ifattr(self.wrap, "wrap")  .. ifattr(self.readonly, "readonly") %>>
-- <%=log:pcdata()%>
--		<div class="cbi-section">

local my_template_1 = [[
	<div class="cbi-section-node"><textarea style="font-size: 12px; width: 100%;" readonly="readonly" <%= ifattr(self.rows, "rows") .. ifattr(self.wrap, "wrap")%>><%=self.linelog%></textarea></div>
	]]

-- TableSection definition -- ##################################################
--- s = m:section(SimpleSection)
s = m:section(Table)
s:option(DummyValue, "index", translate("Num"))
s:option(DummyValue, "str", translate("Message"))

--s.sectionhead = translate("Configuration")
--s.template = "cbi/tblsection"
--s.rmempty = true

s.rows = 80
s.wrap = "off"
s.linelog = ""
s.data = getlinelog(s)


--function s.render(self, sid)
--	self.linelog = getlinelog(self)
--	tpl.render_string(my_template_1, {self = self})
--end

m.redirect = luci.dispatcher.build_url("admin/mywebserver/logview")

return m

