--
--
--
module("luci.controller.myabbaapp", package.seeall)  --notice that new_tab is the name of the file new_tab.lua

function index()
	local uci	= require("luci.model.uci").cursor()
	local nxfs	= require "nixio.fs"		-- global definitions not available
	local sys	= require "luci.sys"		-- in function index()

	local page

	-- no config create an empty one
	if not nxfs.access("/etc/config/myabbaapp") then
		nxfs.writefile("/etc/config/myabbaapp", "")
	end

	entry({"admin", "myabbaapp"}, firstchild(), _("MYAPP"), 60).index=true
	entry({"admin", "myabbaapp", "about"}, cbi("myabbaapp/about"), _("ABBA About"), 20).dependent = true

end
