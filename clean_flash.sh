#!/bin/bash
echo -e '\033[1;31m您确认要开始刷机吗？\033[00m'
echo -e '\033[31m此操作将清空您的MicroSD卡上的数据。\033[00m'
echo -e '\033[31m如果您打算放弃操作，请在20秒内按下Ctrl+C组合键。\033[00m'
( set -x ; sleep 20 )
echo -e '\033[32m已启动刷机流程...\n请不要操作键盘等输入设备，并保持电源接通。\033[00m'
cd /tmp
[ -d "uploads" ] || mkdir uploads && cd uploads
type shred >/dev/null 2>&1
    if [ $? -eq 0 ] ; then
        cp -f $(which shred) ./
    fi
cp -f $(which busybox) ./
if [ -f openwrt*.img ] ; then
    echo -e "\033[32m检测到IMG文件 $(ls openwrt*.img)\033[00m"
    if [ -f sha256_????????.hash ] ; then
        grep ".img$" sha256_????????.hash > sha256hash
        sha256sum -c sha256hash
        if [ $? -eq 0 ] ; then
            echo -e '\033[32mSHA256校验通过\033[00m'
            rm -f sha256hash
        else
            echo -e '\033[1;31mSHA256校验失败\033[00m'
            exit 129
        fi
    else
        echo -e '\033[33m跳过SHA256校验\033[00m'
    fi
    if [ -f md5_????????.hash ] ; then
        grep ".img$" md5_????????.hash > md5hash
        md5sum -c md5hash
        if [ $? -eq 0 ] ; then
            echo -e '\033[32mMD5校验通过\033[00m'
            rm -f md5hash
        else
            echo -e '\033[1;31mMD5校验失败\033[00m'
            exit 130
        fi
    else
        echo -e '\033[33m跳过MD5校验\033[00m'
    fi
    mv openwrt*.img firmware.img
elif [ -f openwrt*.img.gz ] ; then
    echo -e "\033[32m检测到GZ文件 $(ls openwrt*.img.gz)\033[00m"
    gzip -t openwrt*.img.gz
    if [ $? -eq 0 ] ; then
        echo -e '\033[32m压缩包测试通过\033[00m'
    else
        echo -e '\033[31m压缩包可能已经损坏\033[00m'
        exit 131
    fi
    if [ -f sha256_????????.hash ] ; then
        grep ".img.gz$" sha256_????????.hash > sha256hash
        sha256sum -c sha256hash
        if [ $? -eq 0 ] ; then
            echo -e '\033[32mSHA256校验通过\033[00m'
            rm -f sha256hash
        else
            echo -e '\033[31mSHA256校验失败\033[00m'
            exit 129
        fi
    else
        echo -e '\033[33m跳过SHA256校验\033[00m'
    fi
    if [ -f md5_????????.hash ] ; then
        grep ".img.gz$" md5_????????.hash > md5hash
        md5sum -c md5hash
        if [ $? -eq 0 ] ; then
            echo -e '\033[32mMD5校验通过\033[00m'
            rm -f md5hash
        else
            echo -e '\033[1;31mMD5校验失败\033[00m'
            exit 130
        fi
    else
        echo -e '\033[33m跳过MD5校验\033[00m'
    fi
    mv openwrt*.img.gz firmware.img.gz
else
    echo -e '\033[1;31m没有找到受支持的刷机包\033[00m'
    exit 132
fi
echo 1 > /proc/sys/kernel/sysrq
echo u > /proc/sysrq-trigger
if [ -n "$CLEANDISK" ] ; then
    echo -e '\033[32m开始擦除MicroSD卡：通常这将消耗很长时间。\033[00m'
    if [[ $CLEANDISK =~ ^[1-9][0-9]*$ ]] ; then
        DDARGU=$((256 * $CLEANDISK))
        ./busybox dd conv=fsync bs=8M count=$DDARGU if=/dev/zero of=/dev/mmcblk0
    else
        if [ -f "shred" ] ; then
            ./shred -n 0 -z -v /dev/mmcblk0
        else
            ./busybox dd conv=fsync bs=8M if=/dev/zero of=/dev/mmcblk0
        fi
    fi
    echo -e '\033[32m擦除完成\033[00m'
fi
echo -e '\033[32m开始写入数据...\033[00m'
echo -e '\033[33m请不要操作键盘等输入设备，并保持电源接通。\n切勿中断此过程。\033[00m'
if [ -f firmware.img ] ; then
    ./busybox dd conv=fsync bs=8M if=/tmp/uploads/firmware.img of=/dev/mmcblk0
elif [ -f firmware.img.gz ] ; then
    ./busybox gzip -dc firmware.img.gz | ./busybox dd conv=fsync bs=8M of=/dev/mmcblk0
fi
echo -e '\033[32m刷机完成，稍后将执行重启...\033[00m'
./busybox sleep 3
echo -e '\033[32m开始重启...\033[00m'
echo b > /proc/sysrq-trigger
