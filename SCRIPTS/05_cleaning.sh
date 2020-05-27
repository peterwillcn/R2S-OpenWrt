#!/bin/bash
rm -rf `ls | grep -v "squashfs"`
gzip -d *.gz
gzip --best --keep *.img
sha256sum * | tee hashes_$(date "+%Y%m%d").sha256
md5sum * | tee hashes_$(date "+%Y%m%d").md5
rm -f *.img
exit 0
