#! /bin/sh

# ============================================================
# FileName          nginx.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:48
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================

function Mk_Cp(){
	mkdir -p $SERVER_DIR && chown -R $NGINX_USER.$NGINX_GROUP $SERVER_DIR
#	rm -f  /usr/local/nginx/conf/nginx.conf

	cp  $CONF_DIR/nginx.conf  $SOFT_DIR/nginx/conf

	cp -r $CONF_DIR/vhost   $SOFT_DIR/nginx/conf

	cp   $CONF_DIR/index.html   /home/www/

	cp  $INIT_DIR/nginx  /etc/init.d/
	chmod +x /etc/init.d/nginx 
}

function Install_Nginx(){
	[[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
	wget -c http://nginx.org/download/$1  -P $SRC_DIR
	[[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
	CONFIGURE=CONF_NGINX
	[[ -d $SOFT_DIR/nginx ]] && rm -rf $SOFT_DIR/nginx
        Add_User $NGINX_USER $NGINX_GROUP	
	Tar $1 && Install $CONFIGURE
	Mk_Cp
}
