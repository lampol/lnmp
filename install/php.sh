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
}


function Install_Php(){
	CONFIGURE=CONF_PHP
        Tar $1 && Install $CONFIGURE
        Mk_Cp_Php

}
#yum install libxml2-devel libcurl-devel libjpeg-devel libpng-devel freetype-devel libicu-devel libmcrypt-devel openssl-devel -y
