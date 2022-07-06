#! /bin/sh

# ============================================================
# FileName          common.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 09:35
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================


function Print_Color(){
	
	echo  -e "\033[$1m $2 \033[0m"
}

# 
function Tar(){
       NAME=$1
       [[ -d $SRC_DIR/$NAME ]] && rm -rf $SRC_DIR/$NAME
       tar xf  $SRC_DIR/$NAME  -C  $SRC_DIR
       NAME_DIR=${NAME:0:(${#NAME}-7) }
       cd $SRC_DIR/$NAME_DIR
       Print_Color "32" "Start Install $NAME_DIR Please Wait"      
       sleep 3
}

#tar and phpize
function Tar_Phpize(){
        NAME=$1
       [[ -d $SRC_DIR/$NAME ]] && rm -rf $SRC_DIR/$NAME
       tar xf  $SRC_DIR/$NAME  -C  $SRC_DIR
       NAME_DIR=${NAME:0:(${#NAME}-7) }
       cd $SRC_DIR/$NAME_DIR
        $SOFT_DIR/php/bin/phpize
       Print_Color "32" "Start Install $NAME_DIR Please Wait"
       sleep 3
}

#add user
function Add_User(){
	USER=$1
	GROUP=$2
	egrep "^$GROUP" /etc/group  >/dev/null
	if [ $? -ne 0 ]
	then
        	groupadd $GROUP
	fi
	egrep "^$USER" /etc/passwd  >/dev/null
	if [ $? -ne 0 -a "$USER"="www" ]
        then
                 useradd -s /sbin/nologin -g $GROUP $USER

        else
                useradd -M -s /sbin/nologin -g $GROUP $USER
        fi
}

function Install(){
	CONF_NAME=$1
	CONFIGURE=`cat $BASE_DIR/common/configure.txt | grep $CONF_NAME|awk -F ":" '{print $2}'`
	$CONFIGURE && make && make install
	Print_Color "32" "Install $NAME_DIR SUCCESS"
}

