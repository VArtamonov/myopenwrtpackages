#
# Copyright (C) 2020 ABBA
#
# See /LICENSE for more information.
#
# $Id$

include $(TOPDIR)/rules.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=abba-dir320
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
  SECTION:=myopenwrtpackages
  CATEGORY:=Extra packages
  TITLE:=Proprietary ABBA D-DLINK DIR-320 driver
  DEPENDS:=+kmod-abba-dir320-detect
endef

## Package description; a more verbose description on what our package does
define Package/abba-dir320/description
  This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

# Source settings (i.e. where to find the source codes)
# This is a custom variable, used below
#USE_SOURCE_DIR:=files

# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
define Build/Prepare
	@echo '...'
	@echo 'Prepare $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
	$(Build/Prepare/Default)
#	mkdir -p $(PKG_BUILD_DIR)
#	$(CP) ./src/* $(PKG_BUILD_DIR)
endef

define Build/Configure
	@echo '...'
	@echo 'Configure $(PKG_NAME) ...'
endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile
	@echo '...'
	echo 'Compile $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
#	$(MAKE) -C $(PKG_BUILD_DIR) \
#		CC="$(TARGET_CC)" \
#		CFLAGS="$(TARGET_CFLAGS)" \
#		LDFLAGS="$(TARGET_LDFLAGS)"
##	$(MAKE) $(KERNEL_MAKEOPTS) SUBDIRS="$(PKG_BUILD_DIR)" modules
endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
define Package/abba-dir320/install
	@echo '...'
	echo 'Install $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
	$(Build/Install/Default)
#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld $(1)/usr/bin
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call BuildPackage,abba-dir320))

