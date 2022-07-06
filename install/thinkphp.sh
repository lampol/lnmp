#! /bin/sh

# ============================================================
# FileName          memcached.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================


function Mk_Cp_Thinkphp(){
        PROJECT_NAME=$1
        cp  $CONF_DIR/thinkphp.conf  $SOFT_DIR/nginx/conf/vhost/
        sed -i "s/lampol/$PROJECT_NAME/g"  $SOFT_DIR/nginx/conf/vhost/thinkphp.conf
        sed -i 's#include vhost/lampol.conf ;#include vhost/thinkphp.conf ;#g'  $SOFT_DIR/nginx/conf/nginx.conf
}



function Install_Thinkphp(){
	
	cd /home/www/  && composer create-project topthink/think=$1  $2  --prefer-dist
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "project name $2 already exists"`" && exit 1

	Mk_Cp_Thinkphp $2
}
