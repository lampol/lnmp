#! /bin/sh

# ============================================================
# FileName          nginx.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:48
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================


function Install_Cmake(){
        [[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
        wget -c https://cmake.org/files/v3.20/$1  -P $SRC_DIR
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_CMAKE
        Tar $1 && Install $CONFIGURE
        cp bin/cmake  /usr/bin/cmake
}
