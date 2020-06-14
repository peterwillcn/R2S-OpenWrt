## 变更历史
### 2020/06/14 build 18
* 来自[上游](https://github.com/QiuSimons/R2S-OpenWrt/tree/3954f46c35331b0b6837c073961281a728187ed8)的重要变更：取消irqbalance，改为手动绑定软中断的CPU亲和力，以提升高负载情况下的性能表现。
### 2020/06/14 build 17
* 移除未生效的OPENSSL_ENGINE_BUILTIN。
### 2020/06/13 build 16
* SSRP更新为`178-7`，trojan更新至`1.16.0`，v2ray-core更新至`4.24.2`。
### 2020/06/10 build 15
* 内核更新至`5.4.45`。
* SSRP更新为`178-6`。
### 2020/06/07 build 14
* 为Node.js添加npm包管理器。
* Node.js更新为`v12.16.1`版本。
### 2020/06/07 build 13
* 移除subversion-client。
* 添加openssh-client（标准的SSH客户端；服务端仍保持为dropbear不变）及相关工具。
* 添加dropbearconvert用于将SSH格式密钥转换为dropbear的格式。
* 为git添加http(s)协议支持。
* 添加Node.js语言支持。
### 2020/06/07 build 12
* 添加badblocks坏道扫描工具。
* 扩大ROOTFS分区大小。
* git依赖于perl，所以perl解释器不能移除。
### 2020/06/06 build 11
空间不足导致编译失败。但变更并未撤销，下一次编译将包含此版内容。
* 添加git和subversion-client两个版本控制工具。
* 添加perl解释器。
### 2020/06/06 build 10
* 更新[上游](https://github.com/QiuSimons/R2S-OpenWrt/tree/57eeb22a07104f5537faa3b4764b8bd5811956ef)。
* 为dnsmasq添加filter AAAA功能。
* 添加sha1sum、sha512sum、shred、rsync等命令行工具。
### 2020/06/04 build 09
* 更新[上游](https://github.com/QiuSimons/R2S-OpenWrt/tree/3c6cc906d322ed6608c0cf83e1319f9f74356f31)。
* 添加主题luci-theme-argo。
* 内核更新至`5.4.43`。
### 2020/06/01 build 08
* v2ray-core更新至`4.23.2`，修复[tls相关问题](https://github.com/v2ray/discussion/issues/704)。
* 出于兼容性考虑，移除luci-theme-openwrt主题。现在默认主题是luci-theme-material。
### 2020/05/31 build 07
* AdGuard Home改为Adbyby-plus。
* 移除beardropper。
* 添加asix USB网卡支持。
### 2020/05/28 build 06
* SSRP更新为`178-5`。
### 2020/05/27 build 05
* 添加主题luci-theme-openwrt。
### 2020/05/27 build 04
已取消。但变更并未撤销，下一次编译将包含此版内容。
* 再次调整ROOTFS分区大小。
### 2020/05/27 build 03
* 重新编译build 02。
### 2020/05/27 build 02
由于分配的空间不足，编译失败。但变更并未撤销，下一次编译将包含此版内容。
* 出于安全考虑，移除ttyd以及dockerman的ttyd部分。
### 2020/05/26 build 01
* 首次编译。
