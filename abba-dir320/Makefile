#	
# PACKAGE ABBA DIR-320
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=abba-dir320
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_LICENSE:=MIT

#
#PKG_BUILD_DIR=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)
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
	TITLE:=Proprietary D-DLINK DIR-320 driver test
	DEPENDS:=@(PACKAGE_kmod-abba-dir320-detect)
	SUBMENUDEP:=(TARGET_brcm47xx)
endef

define KernelPackage/abba-dir320-detect
	SECTION:=myopenwrtpackages
	DEPENDS:=@(TARGET_brcm47xx)
	TITLE:=Kernel driver for D-LINK DIR-320A
#	FILES:=$(PKG_BUILD_DIR)/driver/abba_dir320_test.o
#	AUTOLOAD:=$(call AutoProbe,10,abba-dir320-detect)
endef

# Package description; a more verbose description on what our package does
define Package/abba-dir320/description
	This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

define KernelPackage/abba-dir320-detect/description
	This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

# MAKE_PATH := setup/
# Source settings (i.e. where to find the source codes)
# This is a custom variable, used below
#USE_SOURCE_DIR:=files

# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
define Build/Prepare
	@echo '...'
	@echo 'MAKE_PATH = $(MAKE_PATH)'
	@echo 'Prepare $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
	@mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./files/* $(PKG_BUILD_DIR)
endef


# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call KernelPackage,abba-dir320-detect))
$(eval $(call BuildPackage,abba-dir320))

