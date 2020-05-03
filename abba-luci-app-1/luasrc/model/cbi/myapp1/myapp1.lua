
m = Map("abba", translate("MYAPP"), translate("MYABBA applicaton"))
s = m:section(SimpleSection, "myapp1", translate("Server Settings"), translate("test server setting"))
s.anonymous = true
s.addremove = false
return m
