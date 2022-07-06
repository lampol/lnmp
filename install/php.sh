#! /bin/sh

# ============================================================
# FileName          php.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================

function Mk_Cp_Php(){
	cp php.ini-production          $SOFT_DIR/php/etc/php.ini
	cp $CONF_DIR/php-fpm.conf      $SOFT_DIR/php/etc/php-fpm.conf
	cp $INIT_DIR/php-fpm           /etc/init.d/
	\cp $SOFT_DIR/php/bin/php       /usr/bin/
	chmod +x /etc/init.d/php-fpm
}


function Install_Php(){
	[[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
	#wget -c http://am1.php.net/get/$1/from/this/mirror -O $SRC_DIR/$1
        #wget -c http://cn2.php.net/get/$1/from/this/mirror -O $SRC_DIR/$1
	wget -c https://www.php.net/distributions/$1  -O  $SRC_DIR/$1
	[[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
	CONFIGURE=CONF_PHP
	[[ -d $SOFT_DIR/php ]] && rm -rf $SOFT_DIR/php
        Tar $1 && Install $CONFIGURE
        Mk_Cp_Php

}
#yum install libxml2-devel libcurl-devel libjpeg-devel libpng-devel freetype-devel libicu-devel libmcrypt-devel openssl-devel -y
