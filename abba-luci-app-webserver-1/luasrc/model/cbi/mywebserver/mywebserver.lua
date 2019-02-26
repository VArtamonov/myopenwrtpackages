
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

---s:taboption("log", ListValue, "name", translate("Log Name"))
---s:taboption("log", ListValue, "filename", translate("Log File Name"))


return m
