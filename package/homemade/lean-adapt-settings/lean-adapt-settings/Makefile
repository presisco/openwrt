#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=lean-adapt-settings
PKG_VERSION:=1.0
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/lean-adapt-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=adjusted lean settins - LuCI support for Default Settings
  PKGARCH:=all
  DEPENDS:=+luci-base +@LUCI_LANG_zh-cn
endef

define Package/lean-adapt-settings/description
	Language Support Packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/lean-adapt-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-default-settings $(1)/etc/uci-defaults/99-default-settings
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./i18n/default.zh-cn.po $(1)/usr/lib/lua/luci/i18n/default.zh-cn.lmo
	po2lmo ./i18n/more.zh-cn.po $(1)/usr/lib/lua/luci/i18n/more.zh-cn.lmo
	po2lmo ./i18n/sqm.zh-cn.po $(1)/usr/lib/lua/luci/i18n/sqm.zh-cn.lmo
endef

$(eval $(call BuildPackage,lean-adapt-settings))
