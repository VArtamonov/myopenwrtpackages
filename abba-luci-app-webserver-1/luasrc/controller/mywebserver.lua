--
--
--
module("luci.controller.mywebserver", package.seeall)  --notice that new_tab is the name of the file new_tab.lua

function index()
	local uci	= require("luci.model.uci").cursor()
	local nxfs	= require "nixio.fs"		-- global definitions not available
	local sys	= require "luci.sys"		-- in function index()

	local page

	-- no config create an empty one
	if not nxfs.access("/etc/config/mywebserver") then
		nxfs.writefile("/etc/config/mywebserver", "")
	end

--	entry({"admin", "status"}, alias("admin", "status", "overview"), _("Status"), 20).index = true
	entry({"admin", "mywebserver"}, firstchild(), _("MYWEBSERVER"), 60).index=true
--	entry({"admin", "mywebserver"}, alias("admin", "mywebserver", "overview"))
	entry({"admin", "mywebserver", "overview"}, cbi("mywebserver/mywebserver"), _("WEB Overview"), 10).dependent = true

	entry({"admin", "mywebserver", "status"}, cbi("mywebserver/mystatus-1"), _("WEB Status"), 20).dependent = true


--	page = entry({"admin", "network", "network"}, arcombine(cbi("admin_network/network"), cbi("admin_network/ifaces")), _("Interfaces"), 10)
--	page.leaf   = true
--	page.subindex = true
--	if page.inreq then
--		uci:foreach("network", "interface",
--			function (section)
--				local ifc = section[".name"]
--				if ifc ~= "loopback" then
--					entry({"admin", "network", "network", ifc}, true, ifc:upper())
--				end
--			end)
--	end

	-- entry({"admin", "webserver", "logview"}, alias("admin", "webserver", "logview", "log1"), _("WEB Log view"), 20)
-- , {hideapplybtn=true, hidesavebtn=true, hideresetbtn=true}

	page = entry({"admin", "mywebserver", "logview"}, 
		arcombine(
				cbi("mywebserver/mylogview-1"),
				cbi("mywebserver/mylogview-2")
			), _("WEB Log view"), 20)
	page.leaf   = true
	page.subindex = true
	if page.inreq then
		uci:foreach("mywebserver", "logview",
			function (section)
				local ifc = section.name
--		entry({"admin", "mywebserver", "logview", "log1"}, true ,_("WEB Log view 1"))
				entry({"admin", "mywebserver", "logview", ifc}, true ,_("WEB view ")..ifc)
			end)
	end



end
