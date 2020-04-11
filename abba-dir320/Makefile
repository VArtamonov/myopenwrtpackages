#	
# PACKAGE HELLO WORLD
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=abba-dir320-test
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
define Package/abba-dir320-test
#    SECTION:=kernel
#    CATEGORY:=Kernel modules
#    DEPENDS:=@(PACKAGE_kmod-abba-dir320-detect)
#    SUBMENU:=Proprietary D-DLINK DIR-320 driver test
#    SUBMENUDEP:=(TARGET_brcm47xx||TARGET_brcm63xx)
    SUBMENU:=ABBA
    SECTION:=myopenwrtpackages
    CATEGORY:=Extra packages
    TITLE:=Proprietary D-DLINK DIR-320 driver test
#DEPENDS:=@(PACKAGE_kmod-abba-dir320-detect)
#SUBMENUDEP:=(TARGET_brcm47xx||TARGET_brcm63xx)
endef

define KernelPackage/abba-dir320-detect
  SECTION:=kernel
  DEPENDS:=@(TARGET_brcm47xx||TARGET_brcm63xx) +wireless-tools
  TITLE:=Kernel driver for D-LINK DIR-320A
  FILES:=$(PKG_BUILD_DIR)/glue/wl_glue.ko
  AUTOLOAD:=$(call AutoProbe,wl)
endef

# Package description; a more verbose description on what our package does
define Package/abba-dir320/description
    This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

define KernelPackage/abba-dir320-detect/description
    This package contains the proprietary wireless driver for the D-LINK DIR-320A.
endef

# Source settings (i.e. where to find the source codes)
# This is		 a custom variable, used below
#USE_SOURCE_DIR:=files

MAKE_PATH:=src

MAKE_KMOD := $(MAKE) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		PATH="$(TARGET_PATH)" \
		SUBDIRS="$(PKG_BUILD_DIR)/kmod" \


# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
#define Build/Prepare
#	echo 'Prepare $(PKG_NAME) to $(PKG_BUILD_DIR) ...'
#	mkdir -p $(PKG_BUILD_DIR)
#	$(CP) ./files/* $(PKG_BUILD_DIR)
#	$(call Build/Prepare/Default)
#	$(CP) ./src/glue $(PKG_BUILD_DIR)/glue
#endef

#define Build/Configure
#	echo 'Configure $(PKG_NAME) ...'
#endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile
	@echo Compile $(PKG_NAME) to $(PKG_BUILD_DIR) ...
#	$(MAKE) -C $(PKG_BUILD_DIR) \
#		CC="$(TARGET_CC)" \
#		CFLAGS="$(TARGET_CFLAGS)" \
#		LDFLAGS="$(TARGET_LDFLAGS)"
#	$(MAKE) $(KERNEL_MAKEOPTS) SUBDIRS="$(PKG_BUILD_DIR)" modules
#	# Compile glue driver
#	$(MAKE_KMOD) -C "$(LINUX_DIR)" \
#		SUBDIRS="$(PKG_BUILD_DIR)/glue" \
#		modules
#	$(TARGET_CC) -o $(PKG_BUILD_DIR)/abba-dir320-test \
#		-I$(PKG_BUILD_DIR)/shared -I$(PKG_BUILD_DIR)/driver/include \
#		./src/dir320-test.c $(PKG_BUILD_DIR)/shared/libshared.a
endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
#define Package/abba-dir320/install
#	$(INSTALL_DIR) $(1)/usr/bin
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld $(1)/usr/bin
#endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call KernelPackage,abba-dir320-detect))
$(eval $(call BuildPackage,abba-dir320-test))

