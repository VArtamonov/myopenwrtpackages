#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=abba-lua-wsapi
PKG_VERSION:=2019
PKG_RELEASE:=1

# PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
# PKG_SOURCE_URL:=https://codeload.github.com/keplerproject/wsapi/tar.gz/v$(PKG_VERSION)?
# PKG_HASH:=48dc7aba0fd2e96a3e5ef51045b5d923964f6ae299de761aa0467031ad44e987
# PKG_SOURCE_URL:=https://github.com/keplerproject/wsapi.git
# PKG_SOURCE_PROTO:=git
# PKG_SOURCE_VERSION:=master
# PKG_BUILD_DIR:=$(BUILD_DIR)/wsapi-$(PKG_VERSION)
# PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
# PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/abba-lua-wsapi
	SUBMENU:=ABBA
	SECTION:=myopenwrtpackages
	CATEGORY:=Extra packages
	TITLE:=Lua WSAPI FULL
	DEPENDS:= +lua +luafilesystem +fcgi +lua-coxpcall
endef

define Package/abba-lua-wsapi/description
	WSAPI is an API that abstracts the web server from Lua web applications
	This package contains the ABBA modify.
endef

#define Build/Configure
#	@echo '..................................................'
#	@echo 'Configure $(PKG_NAME) ...'
#	@pwd
#	@ls
#endef

define Build/Compile
	@echo '..................................................'
	@echo 'Compile $(PKG_NAME) ...'
	@pwd
	@ls
endef

#define Build/Install
#	@echo '..................................................'
#	@echo 'Install $(PKG_NAME) ...'
#	@pwd
#	$(call Build/Install/Default)
#	@ls
#endef

define Package/abba-lua-wsapi/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi.lua $(1)/usr/lib/lua

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/launcher/lua.* $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/lua/wsapi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi/{common,request,response,util,cgi,sapi,ringer,mock}.lua $(1)/usr/lib/lua/wsapi

	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/fastcfg/lfcgi.so $(1)/usr/lib/lua/lfcgi.so

endef

$(eval $(call BuildPackage,abba-lua-wsapi))
