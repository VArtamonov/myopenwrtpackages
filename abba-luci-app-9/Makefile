#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=abba-luci-app-1

# Version == major.minor.patch
# increase on new functionality (minor) or patches (patch)
PKG_VERSION:=2020

# Release == build
# increase on changes of translation files
PKG_RELEASE:=1

PKG_LICENSE:=MIT

LUCI_TITLE:=LuCI ABBA MAIN

LUCI_DESCRIPTION:=LuCI application ABBA

LUCI_DEPENDS:=+luci-base

include ../../luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
