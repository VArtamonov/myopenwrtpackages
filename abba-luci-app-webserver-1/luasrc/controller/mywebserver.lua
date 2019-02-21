--
--
--
module("luci.controller.mywebserver.new_tab", package.seeall)  --notice that new_tab is the name of the file new_tab.lua

local NX   = require "nixio"
local NXFS = require "nixio.fs"
local DISP = require "luci.dispatcher"
local HTTP = require "luci.http"
local I18N = require "luci.i18n" 		-- not globally avalible here
local IPKG = require "luci.model.ipkg"
local SYS  = require "luci.sys"
local UCI  = require "luci.model.uci"
local UTIL = require "luci.util"

function index()
	local nxfs	= require "nixio.fs"		-- global definitions not available
	local sys	= require "luci.sys"		-- in function index()
	local muci	= require "luci.model.uci"

	-- no config create an empty one
	if not nxfs.access("/etc/config/mywebserver") then
		nxfs.writefile("/etc/config/mywebserver", "")
	end

	entry({"admin", "WEB"}, firstchild(), "MYWEBSERVER", 60).dependent=false
--this adds the top level tab and defaults to the first sub-tab (tab_from_cbi), also it is set to position 30

	entry({"admin", "WEB", "tab_from_cbi"}, cbi("mywebserver/cbi_tab"), "CBI Tab", 1)
--this adds the first sub-tab that is located in <luci-path>/luci-myapplication/model/cbi/myapp-mymodule and the file is called cbi_tab.lua, also set to first position

-- entry({"admin", "WEB", "tab_from_view"}, template("mywebserver/view_tab"), "View Tab", 2)
-- this adds the second sub-tab that is located in <luci-path>/luci-myapplication/view/myapp-mymodule and the file is called view_tab.htm, also set to the second position

	entry({"admin", "WEB", "web_log", "logview"}, call("logread") ).leaf = true

end


-- called by XHR.get from detail_logview.htm
function logread(section)
	-- read application settings
	local uci	= UCI.cursor()
	local ldir	= uci:get("ddns", "global", "ddns_logdir") or "/var/log/ddns"
	local lfile	= ldir .. "/" .. section .. ".log"

	local ldata	= NXFS.readfile(lfile)
	if not ldata or #ldata == 0 then
		ldata="_nodata_"
	end

--	uci:unload("ddns")

	HTTP.write(ldata)
end
