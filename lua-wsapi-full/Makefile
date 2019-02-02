#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=lua-wsapi-full
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/keplerproject/wsapi/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=48dc7aba0fd2e96a3e5ef51045b5d923964f6ae299de761aa0467031ad44e987
PKG_BUILD_DIR:=$(BUILD_DIR)/wsapi-$(PKG_VERSION)
PKG_LICENSE:=MIT
PKG_BUILD_PARALLEL:=1
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/lua-wsapi-full
  SUBMENU:=Examples
  SECTION:=myopenwrtpackages
  CATEGORY:=Extra packages
  TITLE:=Lua WSAPI FULL
  DEPENDS:= +lua +luafilesystem +fcgi
endef

define Package/lua-wsapi-full/description
  WSAPI is an API that abstracts the web server from Lua web applications
  This package contains the basic stuff.
endef

define Build/Configure
endef

define Build/Compile
endef

define Build/Install
endef

define Package/lua-wsapi-full/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi.lua $(1)/usr/lib/lua
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/launcher/wsapi.cgi $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/lua/wsapi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi/{common,request,response,util,cgi,sapi,ringer,mock}.lua $(1)/usr/lib/lua/wsapi
endef

$(eval $(call BuildPackage,lua-wsapi-full))
