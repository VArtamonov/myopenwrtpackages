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
define KernelPackage/abba-dir320-detect
  SUBMENU:=ABBA
  SECTION:=myopenwrtpackages
  CATEGORY:=Extra packages
  TITLE:=Kernel driver for D-LINK DIR-320A of ABBA
  DEPENDS:= @GPIO_SUPPORT @TARGET_brcm47xx
  FILES:=$(PKG_BUILD_DIR)/abba-dir320-detect.ko
  AUTOLOAD:=$(call AutoLoad,30,abba-dir320-detect,1)
endef

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
	$(call MESSAGE, Compile $(PKG_NAME)... );
	$(MAKE) \
		$(if $(findstring c,$(OPENWRT_VERBOSE)),V=1,V='') \
		-C "$(LINUX_DIR)" \
		$(MAKE_OPTS) \
		modules
endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
define Package/abba-dir320-detect/install
	@echo '...'
	@echo 'Install $(PKG_NAME) ...'
	@echo 'BIN_DIR = $(BIN_DIR)'
#	$(CP) ./files/* $(1)/
#	$(Build/Install/Default)
#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld $(1)/usr/bin
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call KernelPackage,abba-dir320-detect))


