#
# Copyright (C) 2020 ABBA
#
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=abba-dir320-detect
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL

#
# PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)
#
# Source settings (i.e. where to find the source codes)
# This is a custom variable, used below
# SOURCE_DIR:=files
#

include $(INCLUDE_DIR)/package.mk

# Package definition; instructs on how and where our package will appear in the overall configuration menu ('make menuconfig')
define Package/abba-dir320
  SUBMENU:=ABBA
#  SECTION:=kernel
#  CATEGORY:=Kernel modules
  TITLE:=Proprietary D-DLINK DIR-320 driver test
  DEPENDS:=PACKAGE_kmod-abba-dir320-detect
endef

define KernelPackage/abba-dir320-detect
  SUBMENU:=ABBA
  SECTION:=kernel
  TITLE:=Kernel driver for D-LINK DIR-320A
  DEPENDS:= @GPIO_SUPPORT @TARGET_brcm47xx
  FILES:=$(PKG_BUILD_DIR)/abba-dir320-detect.ko
  AUTOLOAD:=$(call AutoLoad,30,abba-dir320-detect,1)
endef

## Package description; a more verbose description on what our package does
#define Package/abba-dir320/description
# This package contains the proprietary wireless driver for the D-LINK DIR-320A.
#endef

define KernelPackage/abba-dir320-detect/description
 This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

#EXTRA_CFLAGS:= \
#	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=m,%,$(filter %=m,$(EXTRA_KCONFIG)))) \
#	$(patsubst CONFIG_%, -DCONFIG_%=1, $(patsubst %=y,%,$(filter %=y,$(EXTRA_KCONFIG)))) \
#	EXTRA_CFLAGS="$(EXTRA_CFLAGS)" \

MAKE_OPTS:= \
	ARCH="$(LINUX_KARCH)" \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	SUBDIRS="$(PKG_BUILD_DIR)"

define Build/Compile
	$(MAKE) \
		$(if $(findstring c,$(OPENWRT_VERBOSE)),V=1,V='') \
		-C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call KernelPackage,abba-dir320-detect))
#$(eval $(call BuildPackage,abba-dir320))

