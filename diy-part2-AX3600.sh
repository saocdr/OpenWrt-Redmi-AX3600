#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP and password
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# 修改连接数
# sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
# 修正连接数（by ベ七秒鱼ベ）
# sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=65535' package/base-files/files/etc/sysctl.conf

#开启MU-MIMO
#sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#-------------------------------------------------------------------------------------------------------------------------------

# 修改默认wifi名称ssid为MIWIFI_2022
#sed -i 's/ssid=OpenWrt/ssid=MIWIFI_2022/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi密码key为123456789
#sed -i 's/encryption=none/encryption=sae-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
#使用sed 在第四行后添加新字
#sed -i '/set wireless.default_radio${devidx}.encryption=sae-mixed/a\set wireless.default_radio${devidx}.key=123456789' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# themes添加（svn co 命令意思：指定版本如https://github）
# git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/luci-theme-opentomcat
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial.git package/luci-theme-atmaterial
# git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

# git clone https://github.com/sirpdboy/luci-app-netdata.git package/luci-app-netdata

# 添加额外软件包
# git clone https://github.com/panther706/luci-app-adguardhome package/luci-app-adguardhome
# git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/luci-app-unblockneteasemusic
# git clone https://github.com/sbwml/luci-app-adguardhome.git package/luci-app-adguardhome
# git clone https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-passwall.git package/luci-app-passwall
# git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone https://github.com/Boos4721/luci/tree/master/applications/luci-app-turboacc.git package/luci-app-turboacc


#修改插件位置
# sed -i '/sed -i "s\/services\/system\/g" \/usr\/lib\/lua\/luci\/controller\/cpufreq.lua/d'  package/lean/default-settings/files/zzz-default-settings
# sed -i '/exit 0/i sed -i "s/services/system/g" /usr/lib/lua/luci/controller/cpufreq.lua'  package/lean/default-settings/files/zzz-default-settings

# 添加核心温度的显示
# sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

# Modify NTP Server
sed -i "s/0.openwrt.pool.ntp.org/ntp.aliyun.com/g" package/base-files/files/bin/config_generate
sed -i "s/1.openwrt.pool.ntp.org/cn.ntp.org.cn/g" package/base-files/files/bin/config_generate
sed -i "s/2.openwrt.pool.ntp.org/cn.pool.ntp.org/g" package/base-files/files/bin/config_generate
