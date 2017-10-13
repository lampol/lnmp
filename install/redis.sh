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
        REDIS_UTILS=$SRC_DIR/$REDIS_NAME_DIR/utils
        source  $BASE_DIR/install/conf_redis.sh
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
