#
# Copyright (C) 2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=abba-lua-mylib-1
PKG_VERSION:=2019
PKG_RELEASE:=1

#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://codeload.github.com/keplerproject/wsapi/tar.gz/v$(PKG_VERSION)?
#PKG_HASH:=48dc7aba0fd2e96a3e5ef51045b5d923964f6ae299de761aa0467031ad44e987

#PKG_SOURCE_URL:=https://github.com/vartamonov/fork-cgilua.git
#PKG_SOURCE_PROTO:=git
#PKG_SOURCE_VERSION:=master

### PKG_BUILD_DIR:=$(BUILD_DIR)/wsapi-$(PKG_VERSION)
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
### PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

#PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/abba-lua-mylib-1
	SUBMENU:=ABBA
	SECTION:=myopenwrtpackages
	CATEGORY:=Extra packages
	TITLE:=LUA Lib user 1
	DEPENDS:=+lua
endef

define Package/abba-lua-mylib-1/description
	CGILua is a tool for creating dynamic Web pages and manipulating input data
	from Web forms. CGILua allows the separation of logic and data handling from
	the generation of pages, making it easy to develop web applications with Lua.
endef

define Build/Configure
	@echo 'Configure $(PKG_NAME) ...'
	@$(call MESSAGE, "TEST ...")
	@pwd
	@ls
endef

define Build/Compile
	@echo 'Compile $(PKG_NAME) ...'
endef

#define Build/Install
#	@echo 'Install $(PKG_NAME) ...'
#	@pwd
#	@ls
#endef

define Package/abba-lua-mylib-1/install
##	$(INSTALL_DIR) $(1)/usr/lib/lua
##	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/wsapi.lua $(1)/usr/lib/lua
##	$(INSTALL_DIR) $(1)/usr/bin
##	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/launchers/* $(1)/usr/bin

	$(INSTALL_DIR) $(1)/usr/lib/lua/mylib
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/src/*.lua $(1)/usr/lib/lua/mylib

endef

$(eval $(call BuildPackage,abba-lua-mylib-1))
