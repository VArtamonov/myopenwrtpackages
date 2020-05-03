
m = Map("myabbaapp", translate("MYAPP"), translate("MYABBA applicaton"))
s = m:section(SimpleSection, "myapp1", translate("MY ABBA Settings"), translate("test"))
s.anonymous = true
s.addremove = false
return m
