#! /bin/sh

# ============================================================
# FileName          mysql.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
function Mk_Cp_Mysql(){
	chown -R mysql.mysql $SOFT_DIR/mysql
	\cp $SOFT_DIR/mysql/bin/mysql  /usr/bin
	cp $INIT_DIR/mysqld  /etc/init.d/mysqld
	mkdir $SOFT_DIR/mysql/etc
	cp $CONF_DIR/my.cnf   $SOFT_DIR/mysql/etc/
	chmod +x /etc/init.d/mysqld
	rm -f /etc/my.cnf
	$SOFT_DIR/mysql/scripts/mysql_install_db  --datadir=/usr/local/mysql/data  --basedir=/usr/local/mysql  --user=mysql
}


function Install_Mysql(){
	 [[ -f $SRC_DIR/$1 ]] && rm -rf $SRC_DIR/${1%%.*}*
	wget -c  https://dev.mysql.com/get/Downloads/MySQL-$2/$1 --no-check-certificate  -P  $SRC_DIR
	[[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "download $1 failed please try again"`" && exit 1
        CONFIGURE=CONF_MYSQL
	[[ -d $SOFT_DIR/mysql ]] && rm -rf $SOFT_DIR/mysql
	Add_User $MYSQL_USER $MYSQL_GROUP
        Tar $1 && Install $CONFIGURE
        Mk_Cp_Mysql

}
