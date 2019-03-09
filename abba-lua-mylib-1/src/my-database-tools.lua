#!/usr/bin/env lua
--
--
--
--
-- module("luci.tools.my-database-tools", package.seeall)

local sqlite3 = require("lsqlite3")
require "uci"

local M = { }


-- сперва необходимо создать курсор
local uci = uci.cursor()
if not uci then
  error "Failed to open uci cursor"
end

local width = 78
local function line(pref, suff)
    pref = pref or ''
    suff = suff or ''
    local len = width - 2 - string.len(pref) - string.len(suff)
    print(pref .. string.rep('-', len) .. suff)
end

local db, vm
local assert_, assert = assert, function (test)
    if (not test) then
        error(db:errmsg(), 2)
    end
end

-- line(sqlite3.version())

--        tab1 = {}
--	db = sqlite3.open("/etc/lighttpd/database/".."test1.db")
--	db:exec[[
--			PRAGMA foreign_keys = ON;
--			CREATE TABLE IF NOT EXISTS TEST_IP (ID INTEGER PRIMARY KEY AUTOINCREMENT, IP1, DT1);
--		]]
--
--	for row in db:nrows("SELECT * FROM TEST_IP") do
--		-- print(row.id, row.content)
--		tab1[#row+1] = { row.id, row.ip1}
--	end
--	
--	return tab1

function do_query(sql)
	local r
	local vm = db:prepare(sql)
	assert(vm, db:errmsg())

	--error(db:errmsg())
	--error(vm:get_unames())
	r = vm:step()
	-- error(sqlite3.ROW)
	while (r == sqlite3.ROW) do
		-- print(vm:get_uvalues())
		-- error(vm:get_uvalues())
        	r = vm:step()
    	end

	assert(r == sqlite3.DONE)
	assert(vm:finalize() == sqlite3.OK)
end


function M.GetFileName()
	-- получаем текущее значение опции disabled
  	-- секции <iface> конфигурации network
	--return uci:get("network", iface, "disabled")
	return uci:get("mywebserver", "db1", "filename")
end


-- ExecuteScalar(

function M.OpenDataBase()

	db = sqlite3.open(M.GetFileName())
	db:exec[[
BEGIN;
PRAGMA FOREIGN_KEYS = ON;
CREATE TABLE IF NOT EXISTS TEST_IP (ID INTEGER PRIMARY KEY AUTOINCREMENT, IP1 TEXT, NUM1 INTEGER, DT1 TEXT);
END;
		]]
	
	return db
end

function M.LogToDataBase(str_ip, str_dt)
	local mcount = 0
	db = M.OpenDataBase()
	db:exec("BEGIN;")
	--CREATE TABLE IF NOT EXISTS TEST_IP (ID INTEGER PRIMARY KEY AUTOINCREMENT, IP1 TEXT, NUM1 INTEGER, DT1 TEXT);
	--str = "INSERT INTO TEST_IP (IP1, DT1) VALUES( '"..cgilua.servervariable"REMOTE_ADDR".."', '"..dt.."')"

	local function showrow(udata,cols,values,names)
		--assert(udata=='test_udata')
		print('exec:')
		for i=1,cols do print('',names[i],values[i]) end
		return 0
		end

	i1 = db:exec("SELECT COUNT(*) FROM TEST_IP WHERE IP1 IN ('"..str_ip.."');", function(ud, ncols, values, names)
		assert(names[1]=='COUNT(*)')
		--print(names[1] .." = ".. values[1])
		mcount = tonumber(values[1])
		return sqlite3.OK
		end)

	--print("mcount=" .. mcount)

	if (mcount==0 ) then
		--print("ADD ->" .. mcount)
		i2 = db:exec("INSERT INTO TEST_IP (IP1, DT1, NUM1) VALUES( '"..str_ip.."', '"..str_dt.."', 1);")
		assert(i2)
	else
		print("UPDATE ->" .. mcount)
		i2 = db:exec("UPDATE TEST_IP SET NUM1=NUM1+1, DT1='"..str_dt.."' WHERE IP1=='"..str_ip.."';")
		assert(i2)
	end

    	assert( db:exec("COMMIT;") )
	assert( db:close() )

end

function M.GetInfoTable()
	local tab1= {}
	
	db = M.OpenDataBase()
	for row in db:nrows[[
SELECT * FROM TEST_IP;
]] do
		local t1 = {}
		-- { index, ip, name, dt, number }
		t1.index = tostring(row.ID)
		t1.ip = row.IP1
		t1.name = ""
		t1.dt = tostring(row.DT1)
		t1.number = tostring(row.NUM1)
		table.insert(tab1, t1)

	end	
  	assert( db:close() )

	return tab1
end

return M
