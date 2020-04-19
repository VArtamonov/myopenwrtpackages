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
PKG_VERSION:=0.0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(KERNEL_BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define KernelPackage/abba-driver-test-1
  SUBMENU:=ABBA
  TITLE:=Driver for ABBA
  DESCRIPTION:=This package contains a driver for ABBA test driver.
#  AUTOLOAD:=$(call AutoLoad,50,abba-driver-test-1)
endef

$(eval $(call KernelPackage,abba-driver-test-1))
