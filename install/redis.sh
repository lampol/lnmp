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
	cp $INIT_DIR/memcached  /etc/init.d/
	chmod +x /etc/init.d/memcached
	/etc/init.d/memcached start
}


function Install_Redis(){
	[[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
        wget -c http://download.redis.io/releases/$1  -P  $SRC_DIR
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_REDIS
        [[ -d $SOFT_DIR/redis ]] && rm -rf $SOFT_DIR/redis
        Tar $1 && Install $CONFIGURE
       # Mk_Cp_Redis

}
