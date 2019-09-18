
m = Map("myapp1", translate("MYAPP"), translate("LIGHTTP"))

--s = m:section(NamedSection, "config", "mywebserver", translate("WEBSERVER settings"))
--s.addremove = false

s = m:section(TypedSection, "myapp1", translate("Server Settings"), translate("test server setting"))
s.anonymous = true
s.addremove = false

s:tab("general",  translate("General Settings"))
s:tab("advanced", translate("Advanced Settings"))
---s:tab("log", translate("Log View Settings"))

port = s:taboption("general", Value, "port", translate("Port"))
port.datatype = "port"
port.default  = 8080

lf = s:taboption("advanced", Value, "webservr_pid_file", translate("WEBSERVER PID file"))
lf.placeholder = "/var/run/webserver.pid"
lf.default=lf.placeholder

-- DATABASE
dbs = m:section(TypedSection, "database", translate("DataBase Server Settings"), translate("test database view"))
dbs.anonymous = false
dbs.addremove = false

a1 = dbs:option(Value, "comment", translate("Comment"))
a1.datatype = "string"
a1.placeholder = "database1"
a1.readonly = true

a2 = dbs:option(Value, "filename", translate("Filename databse of test"))
a2.datatype = "file"
a2.optional = true
a2.placeholder = "database1.db"
a2.readonly = true

-- LOGVIEW
logv = m:section(TypedSection, "logview", translate("LogView Server Settings"), translate("test log view"))
logv.anonymous = false
logv.addremove = false

a3 = logv:option(Value, "name", translate("Log Name"))
a3.readonly = true

a4 = logv:option(Value, "filename", translate("Log File Name"))
a4.readonly = true
a4.datatype = "file"

return m
