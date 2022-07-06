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
source $BASE_DIR/install/welcome.sh

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
                 PHP_VER="php-5.6.40.tar.gz"
                ;;
                2)
                 PHP_VER="php-7.0.33.tar.gz"
                 ;;
		3)
		 PHP_VER="php-7.1.30.tar.gz"
		 ;;
                4)
                 PHP_VER="php-7.2.19.tar.gz"
                 ;;
		5)
  		 PHP_VER="php-7.3.6.tar.gz"
  		 ;;
        esac

        case "$MySQL_VER" in           
                1)
                MySQL_VER="mysql-5.5.54.tar.gz"
                VER="5.5"
                ;;
                2)
                 MySQL_VER="mysql-5.6.37.tar.gz"
                 VER="5.6"
                 ;;
         #       3)
         #      MySQL_VER="mysql-5.7.17.tar.gz"
         #      VER="5.7"
         #      ;;
        esac
#	YUM_COUNT=`rpm -aq| grep -e cmake  -e libpng-devel -e ncurses-devel -e openssl-devel|wc -l`
 #       [[ $YUM_COUNT -lt 4 ]] &&  Yum_Install
        Install_Nginx $NGINX_VER
        Install_Mysql $MySQL_VER $VER
        Install_Php  $PHP_VER
	welcome $NGINX_VER  $MySQL_VER $PHP_VER
}

function Init_Install(){
#check OS 

if [ "$2" != CentOS ]
then
        clear
        echo -e " `Print_Color '31' 'NOW ONLY SUPPORT CentOS6 AND 7'`"
        exit 1
fi

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
        echo -e "1)  `Print_Color '32' 'php-5.6.40'`"
        echo -e "2)  `Print_Color '32' 'php-7.0.33'`"
        echo -e "3)  `Print_Color '32' 'php-7.1.30'`"
        echo -e "4)  `Print_Color '32' 'php-7.2.19'`"
	echo -e "5)  `Print_Color '32' 'php-7.3.6'`"
        read -p "Please Enter Your PHP Choice(1-7) Default(2):" PHP_VER
        [[ $PHP_VER -lt 1 ]] || [[ $PHP_VER -ge 6 ]] && PHP_VER=2
#End Select PHP Ver
clear
#Start Select MySQL Ver
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Select MySQL Version '`"
        echo -e "================================================="
        MySQL_VER=2
        echo -e "1)  `Print_Color '32' 'mysql-5.5.54'`"
        echo -e "2)  `Print_Color '32' 'mysql-5.6.37'`"
        #echo -e "3)  `Print_Color '32' 'mysql-5.7.17'`"
        read -p "Please Enter Your MySQL Choice(1-3) Default(2):" MySQL_VER
        [[ $MySQL_VER -lt 1 ]] || [[ $MySQL_VER -ge 4 ]] && MySQL_VER=2
#End Select MySQL Ver

# yum install
Yum_Install_Tool
YUM_COUNT=`rpm -aq| grep -e cmake  -e libpng-devel -e ncurses-devel -e openssl-devel|wc -l`
[[ $YUM_COUNT -lt 4 ]] &&  Yum_Install $1
#install
 Start_Install $NGINX_VER  $PHP_VER $MySQL_VER
}
