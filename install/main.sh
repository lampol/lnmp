#! /bin/sh

# ============================================================
# FileName          main.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 10:07
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
source $BASE_DIR/install/yum.sh
source $BASE_DIR/install/nginx.sh
source $BASE_DIR/install/php.sh
source $BASE_DIR/install/mysql.sh

function Start_Install(){
	NGINX_VER=$1
	MySQL_VER=$3
	PHP_VER=$2
	case "$NGINX_VER" in
		1)
		NGINX_VER=nginx-1.8.1.tar.gz
		;;
		2)
		 NGINX_VER=nginx-1.10.3.tar.gz
		 ;;
		3)
		NGINX_VER=nginx-1.11.10.tar.gz
		 ;;
	esac
        case "$PHP_VER" in
                1)
                 PHP_VER="php-5.3.29.tar.gz"
                ;;
                2)
                 PHP_VER="php-5.5.38.tar.gz"
                 ;;
                3)
                 PHP_VER="php-5.6.30.tar.gz"
                 ;;
		4)
                 PHP_VER="php-7.1.1.tar.gz"
                 ;;
        esac
	
	case "$MySQL_VER" in           
                1)
                MySQL_VER="mysql-5.1.72.tar.gz"
                ;;
                2)
                 MySQL_VER="mysql-5.5.54.tar.gz"
                 ;;
                3)
                MySQL_VER="mysql-5.7.17.tar.gz"
                 ;;
        esac
	Yum_Install
	Install_Nginx $NGINX_VER
	Install_Php  $PHP_VER
	Install_Mysql $MySQL_VER
}

function Init_Install(){
clear
#Start Select Nginx Ver
	echo -e "================================================="
	echo -e "`Print_Color '32' 'Please Select Nginx Version'`"
	echo -e "================================================="
	NGINX_VER=2
	echo -e "1)  `Print_Color '32' 'nginx-1.8.1'`"
 	echo -e "2)  `Print_Color '32' 'nginx-1.10.3'`"
 	echo -e "3)  `Print_Color '32' 'nginx-1.11.10'`"
	read -p "Please Enter Your Nginx  Choice(1-3) Default(2):" NGINX_VER
	[[ $NGINX_VER -lt 1 ]] || [[ $NGINX_VER -ge 4 ]] && NGINX_VER=2
#End Select Nginx Ver
clear
#Start Select PHP Ver
	echo -e "================================================="
	echo -e "`Print_Color '32' 'Please Select PHP Version '`"
	echo -e "================================================="
        PHP_VER=2
        echo -e "1)  `Print_Color '32' 'php-5.3.29'`"
        echo -e "2)  `Print_Color '32' 'php-5.5.38'`"
        echo -e "3)  `Print_Color '32' 'php-5.6.30'`"
        echo -e "4)  `Print_Color '32' 'php-7.1.1'`"
        read -p "Please Enter Your PHP Choice(1-4) Default(2):" PHP_VER
	[[ $PHP_VER -lt 1 ]] || [[ $PHP_VER -ge 5 ]] && PHP_VER=2
#End Select PHP Ver
clear
#Start Select MySQL Ver
	echo -e "================================================="
	echo -e "`Print_Color '32' 'Please Select MySQL Version '`"
	echo -e "================================================="
        MySQL_VER=2
        echo -e "1)  `Print_Color '32' 'mysql-5.1.72'`"
        echo -e "2)  `Print_Color '32' 'mysql-5.5.54'`"
        echo -e "3)  `Print_Color '32' 'mysql-5.7.17'`"
        read -p "Please Enter Your MySQL Choice(1-3) Default(2):" MySQL_VER
	[[ $MySQL_VER -lt 1 ]] || [[ $MySQL_VER -ge 4 ]] && MySQL_VER=2
	MySQL_VER=2
#End Select MySQL Ver
 Start_Install $NGINX_VER  $PHP_VER $MySQL_VER
}

