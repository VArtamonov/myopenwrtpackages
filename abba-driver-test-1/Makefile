#
# Copyright (C) 2020 ABBA
#
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=abba-driver-test-1
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=MIT

#PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/abba-driver-test-1
  SUBMENU:=ABBA
  SECTION:=kernel
  TITLE:=Driver for ABBA
  DEPENDS:= @GPIO_SUPPORT @TARGET_brcm47xx
  FILES:=$(PKG_BUILD_DIR)/abba-driver-test-1.ko
  AUTOLOAD:=$(call AutoLoad,30,abba-driver-test-1,1)
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

EXTRA_KCONFIG:= \
	CONFIG_ABBA_DRIVER_TEST_1=m

EXTRA_CFLAGS:= \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=m,%,$(filter %=m,$(EXTRA_KCONFIG)))) \
	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=y,%,$(filter %=y,$(EXTRA_KCONFIG)))) \

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)" \
	EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \
	$(EXTRA_KCONFIG)

define Build/Compile
	$(MAKE) -C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

$(eval $(call KernelPackage,abba-driver-test-1))
+