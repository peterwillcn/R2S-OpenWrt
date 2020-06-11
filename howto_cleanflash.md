## 清盘刷机脚本使用说明
### 1. 获取脚本
```bash
mkdir /tmp/uploads
cd /tmp/uploads
curl --proto '=https' --tlsv1.2 -sSf -o clean_flash.sh \
     https://raw.githubusercontent.com/KaneGreen/R2S-OpenWrt/master/clean_flash.sh
```
### 2. 上传固件
使用sftp工具或scp命令将固件上传到`/tmp/uploads`目录下。  
支持IMG镜像文件或GZ压缩包格式。  
文件名以`openwrt`开头，以`.img`或`.img.gz`结尾（注意：大小写敏感）。
### 3. 执行刷机
#### 3.1 不执行清盘
若不打算对储存卡进行“写零”处理，请允许下面的命令。
```bash
/bin/bash /tmp/uploads/clean_flash.sh
```
#### 3.2 执行清盘
“写零”清盘适合于固件变动内容比较大的情况下使用，这种方法可能解决跨版本刷机时由于磁盘储存残留导致的奇特BUG。  
但是，此过程通常需要消耗较长时间。
```bash
CLEANDISK=2 /bin/bash /tmp/uploads/clean_flash.sh
```
注意`CLEANDISK`环境变量的值，上面的例子中是`2`，即只对储存卡上前2GB的空间做“写零”处理。  
同理若为`1`，则前1GB；若为`3`，则前3GB；若为`4`，则前4GB；以此类推。  
但是，若为`0`或其他非数字值，则对整个储存卡上的所有空间做“写零”处理。但这可能需要消耗很长时间。  
例如下面的命令将全清整个储存卡。
```bash
CLEANDISK=true /bin/bash /tmp/uploads/clean_flash.sh
```
