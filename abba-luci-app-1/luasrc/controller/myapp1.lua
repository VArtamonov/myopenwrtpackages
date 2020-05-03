--
--
--
module("luci.controller.myapp1", package.seeall)  --notice that new_tab is the name of the file new_tab.lua

function index()
	local uci	= require("luci.model.uci").cursor()
	local nxfs	= require "nixio.fs"		-- global definitions not available
	local sys	= require "luci.sys"		-- in function index()

	local page

	-- no config create an empty one
	if not nxfs.access("/etc/config/myapp1") then
		nxfs.writefile("/etc/config/myapp1", "")
	end

	entry({"admin", "myapp1"}, firstchild(), _("MYAPP"), 60).index=true
	entry({"admin", "myapp1", "about"}, cbi("myapp1/about"), _("ABBA About"), 20).dependent = true

end
