## R2S 基于原生OpenWRT 的固件

### 发布地址：
（可能会翻车，风险自担）  
https://github.com/KaneGreen/R2S-OpenWrt/actions  ![OpenWrt for R2S](https://github.com/KaneGreen/R2S-OpenWrt/workflows/OpenWrt%20for%20R2S/badge.svg?branch=master)

### 本地一键编译命令（注意装好依赖）：
```sh
git clone https://github.com/KaneGreen/R2S-OpenWrt.git && cd R2S-OpenWrt && bash onekeyr2s.sh
```
### 注意事项：
1. 登陆IP：`192.168.1.1`，密码：无

2. LAN WAN 已交换

3. LAN 和 WAN 的灯可能不亮

4. OP内置升级可用

### 版本信息：
其他模块版本：SNAPSHOT（当日最新）

LUCI版本：19.07（当日最新）

### 特性及功能：
1. O3编译

2. 内置两款主题，包含SSRP，OpenClash，adbyby-plus，SQM，SmartDNS，网络唤醒，DDNS，UPNP，FullCone，流量分载（offload），BBR（默认开启）

### 其他信息
由于添加了`shadow-utils`组件，管理页面上的`更改密码`功能失效。  
请使用SSH空密码登陆后，执行`passwd`命令并根据提示设置密码。

### 感谢
[QiuSimons](https://github.com/QiuSimons/R2S-OpenWrt)
