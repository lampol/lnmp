#! /bin/sh

# ============================================================
# FileName          memcached.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
function Mk_Cp_Redis(){
	 REDIS_NAME=$1
        REDIS_NAME_DIR=${REDIS_NAME:0:(${#REDIS_NAME}-7) }
        mkdir -p  $SOFT_DIR/redis/etc/   $SOFT_DIR/redis/data  $SOFT_DIR/redis/log
        touch  $SOFT_DIR/redis/log/redis.log
        cp $SRC_DIR/$REDIS_NAME_DIR/redis.conf  $SOFT_DIR/redis/etc/
        cp $INIT_DIR/redis  /etc/init.d/
        chmod +x /etc/init.d/redis
        sed -i 's#^logfile .*$#logfile '"$SOFT_DIR"'/redis/log/redis.log#g'  $SOFT_DIR/redis/etc/redis.conf
        sed -i 's#^dir .*$#dir '"$SOFT_DIR"'/redis/data#g'  $SOFT_DIR/redis/etc/redis.conf
        sed -i 's#^pidfile .*$#pidfile /var/run/redis.pid#g'  $SOFT_DIR/redis/etc/redis.conf
        sed -i 's#^daemonize no#daemonize yes#g'  $SOFT_DIR/redis/etc/redis.conf
}


function Install_Redis(){
	[[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
        wget -c http://download.redis.io/releases/$1  -P  $SRC_DIR
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_REDIS
        [[ -d $SOFT_DIR/redis ]] && rm -rf $SOFT_DIR/redis
        Tar $1 && Install $CONFIGURE
        Mk_Cp_Redis $1

}
