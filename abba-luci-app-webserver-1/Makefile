#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=abba-luci-app-webserver-1

# Version == major.minor.patch
# increase on new functionality (minor) or patches (patch)
PKG_VERSION:=2019

# Release == build
# increase on changes of translation files
PKG_RELEASE:=1

PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI application WEB server.

LUCI_DESCRIPTION:=LuCI my web server

LUCI_DEPENDS:=+abba-lua-cgi +abba-lua-mylib-1

include ../../luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
