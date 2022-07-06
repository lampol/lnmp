#! /bin/sh

# ============================================================
# FileName          mysql.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
function Mk_Cp_Php_Redis(){
        REDIS_SO=`find $SOFT_DIR/php/  -name "redis.so"`
        sed -i '/redis.so/d' $SOFT_DIR/php/etc/php.ini
        sed -i "/Dynamic Extensions/aextension=$REDIS_SO"   $SOFT_DIR/php/etc/php.ini
        /etc/init.d/php-fpm  restart
        php  -m 
}


function Install_Php_Redis(){
        REDIS_NAME=${1:0:(${#1}-4)}.tar.gz
         [[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
        wget -c  https://pecl.php.net/get/$1  -O  $SRC_DIR/$REDIS_NAME
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_MEMCACHE_PHP
        Tar_Phpize $REDIS_NAME  && Install $CONFIGURE
        Mk_Cp_Php_Redis

}
