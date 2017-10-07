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

	cp  $INIT_DIR/nginx  /etc/init.d/
	chmod +x /etc/init.d/nginx 
}

function Install_Nginx(){
	[[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
	wget  http://nginx.org/download/$1  -P $SRC_DIR
	CONFIGURE=CONF_NGINX
        Add_User $NGINX_USER $NGINX_GROUP	
	Tar $1 && Install $CONFIGURE
	Mk_Cp
}
