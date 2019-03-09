
m = Map("mywebserver", translate("WEBSERVER"), translate("LIGHTTP"))

--s = m:section(NamedSection, "config", "mywebserver", translate("WEBSERVER settings"))
--s.addremove = false

s = m:section(TypedSection, "webserver", translate("Server Settings"))
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


dbs = m:section(TypedSection, "database", translate("DataBase Server Settings"))
dbs.anonymous = true
dbs.addremove = false

a1 = dbs:option(Value, "comment", translate("Comment"))
a1.datatype = "string"
a1.placeholder = "database1"

a2 = dbs:option(Value, "filename", translate("Filename databse of test"))
a2.datatype = "file"
a2.optional = true
a2.placeholder = "database1.db"

---s:taboption("log", ListValue, "name", translate("Log Name"))
---s:taboption("log", ListValue, "filename", translate("Log File Name"))


return m
