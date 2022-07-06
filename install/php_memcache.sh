#! /bin/sh

# ============================================================
# FileName          mysql.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
function Mk_Cp_Php_Memcache(){
	MEMCACHE_SO=`find $SOFT_DIR/php/  -name "memcache.so"`
        sed -i '/memcache.so/d' $SOFT_DIR/php/etc/php.ini
        sed -i "/Dynamic Extensions/aextension=$MEMCACHE_SO"   $SOFT_DIR/php/etc/php.ini
        /etc/init.d/php-fpm  restart
        php  -m 
}


function Install_Php_Memcached(){
        PHP_MEM=memcache-2.2.7.tar.gz
         [[ -f $SRC_DIR/$PHP_MEM ]] && rm -rf $SRC_DIR/${1%%.*}*
        wget -c  https://pecl.php.net/get/$1  -O  $SRC_DIR/$PHP_MEM
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_MEMCACHE_PHP
        Tar_Phpize $PHP_MEM  && Install $CONFIGURE
        Mk_Cp_Php_Memcache

}
