#! /bin/sh

# ============================================================
# FileName          nginx.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:48
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================


function Install_Libzip(){
        wget -c https://github.com/nih-at/libzip/releases/download/v1.10.0/libzip-1.10.0.tar.gz  -P $SRC_DIR
        cd $SRC_DIR
        tar xf libzip-1.10.0.tar.gz
        cd libzip-1.10.0
        mkdir build
        cd build
        cmake ..
        make && make install
        echo '/usr/local/lib64
              /usr/local/lib
              /usr/lib
              /usr/lib64'>>/etc/ld.so.conf

        ldconfig -v

        Install_oniguruma
}


function Install_oniguruma(){
        yum install -y  expat-devel autoconf automake libtool  sqlite-devel

        wget https://github.com/kkos/oniguruma/archive/v6.9.4.tar.gz -O  $SRC_DIR/oniguruma-6.9.4.tar.gz
        cd $SRC_DIR
        tar -zxf oniguruma-6.9.4.tar.gz
        cd oniguruma-6.9.4 
        ./autogen.sh && ./configure --prefix=/usr  --libdir=/lib64
        make && make install 
}
