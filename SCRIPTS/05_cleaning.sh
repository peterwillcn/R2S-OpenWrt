#!/bin/bash
rm -rf `ls | grep -v "squashfs"`
gzip -d *.gz
gzip --best --keep *.img
sha256sum * | tee hashes_${{ env.DATETIME }}.sha256
rm -f *.img
exit 0
