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

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://codeload.github.com/keplerproject/wsapi/tar.gz/v$(PKG_VERSION)?
#PKG_HASH:=48dc7aba0fd2e96a3e5ef51045b5d923964f6ae299de761aa0467031ad44e987

PKG_SOURCE_URL:=https://github.com/vartamonov/fork-wsapi.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=master

### PKG_BUILD_DIR:=$(BUILD_DIR)/wsapi-$(PKG_VERSION)
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
### PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

#PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/abba-lua-wsapi
  SUBMENU:=ABBA
  SECTION:=myopenwrtpackages
  CATEGORY:=Extra packages
  TITLE:=Lua WSAPI FULL
  DEPENDS:=+lua +liblua +luafilesystem +fcgi +lua-coxpcall +lua-rings

endef

define Package/lua-wsapi-full/description
  WSAPI is an API that abstracts the web server from Lua web applications.
  This package contains the basic stuff.
endef

define Build/Configure
	@echo 'Configure $(PKG_NAME) ...'
	@$(call MESSAGE, "TEST ...")
endef

define Build/Compile
	@echo 'Compile $(PKG_NAME) ...'
	$(TARGET_CC) $(TARGET_CFLAGS) -fPIC -o $(PKG_BUILD_DIR)/src/fastcgi/lfcgi.o -c $(PKG_BUILD_DIR)/src/fastcgi/lfcgi.c
	$(TARGET_CC) $(TARGET_LDFLAGS) -shared -o $(PKG_BUILD_DIR)/src/fastcgi/lfcgi.so $(PKG_BUILD_DIR)/src/fastcgi/lfcgi.o -lfcgi
endef

define Build/Install
	@echo 'Install $(PKG_NAME) ...'
# 	$(call Build/Install/Default)
endef

define Package/abba-lua-wsapi/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi.lua $(1)/usr/lib/lua

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/launcher/wsapi.cgi $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/launcher/wsapi.fcgi $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/lua/wsapi
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi/*.lua $(1)/usr/lib/lua/wsapi

	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/fastcgi/lfcgi.so $(1)/usr/lib/lua/lfcgi.so

endef

$(eval $(call BuildPackage,abba-lua-wsapi))
