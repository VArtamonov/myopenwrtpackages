#
# Copyright (C) 2006 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=abba-driver-test-1
PKG_VERSION:=0
PKG_RELEASE:=1

#PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/abba-driver-test-1
  SUBMENU:=ABBA
  SECTION:=kernel
  TITLE:=Driver for ABBA
  DEPENDS:= @GPIO_SUPPORT @TARGET_brcm47xx
  FILES:=$(PKG_BUILD_DIR)/abba-dir320-test-1.ko
  AUTOLOAD:=$(call AutoLoad,30,abba-dir320-test-1,1)
endef

define KernelPackage/abba-driver-test-1/description
 This package contains the proprietary wireless driver for the ABBA.
endef

define Build/Configure
	@echo ...
	echo 'Configure $(PKG_NAME) ...'
#	@echo 'LINUX_DIR = $(LINUX_DIR)'
#	@echo 'KERNEL_MAKEOPTS = $(KERNEL_MAKEOPTS)'
	@echo ...
endef

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILER="$(KERNEL_CROSS)"
	SUBDIRS="$(PKG_BUILD_DIR)"

define Build/Compile
	@echo ...
	@echo '... Compile $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
	@echo 'LINUX_DIR = $(LINUX_DIR)'
	@echo 'MAKE_OPTS = $(MAKE_OPTS)'
	$(MAKE) V=1 -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,abba-driver-test-1))

