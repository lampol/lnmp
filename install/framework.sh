#! /bin/sh

# ============================================================
# FileName          main.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-10-11 10:07
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
source $BASE_DIR/install/thinkphp.sh
source $BASE_DIR/install/yum.sh

function Start_Install_Framework(){
        THINKPHP_VER=$1
        PROJECT_NAME=$2
	case "$THINKPHP_VER" in
		1)
		THINKPHP_VER=v5.0.24 
		;;
		2)
                THINKPHP_VER=v5.1.29
                ;;
		3)
		THINKPHP_VER=N
		;;
	esac	

	[[ $THINKPHP_VER != N ]] && Install_Thinkphp $THINKPHP_VER $PROJECT_NAME
}

function Install_Framework(){

clear
#Start Select ThinkPHP Version
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Select ThinkPHP Version'`"
        echo -e "================================================="
        THINKPHP_VER=1
        echo -e "1)  `Print_Color '32' '5.0.24'`"
        echo -e "2)  `Print_Color '32' '5.1.29'`"
        echo -e "3)  `Print_Color '32' 'I Don not Want To Install ThinkPHP'`"
        read -p "Please Enter Your  Choice(1/2) Default(1):" THINKPHP_VER
        [[ $THINKPHP_VER -lt 1 ]] || [[ $THINKPHP_VER -ge 3 ]] && THINKPHP_VER=1
#End Select Thinkphp Ver
clear
#Start Select project name 
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Insert Your Project Name  '`"
        echo -e "================================================="
	read -p "Please Enter Your Project Name (Ex:shop/blog) Default(lampol):" PROJECT_NAME
        [[ -z $PROJECT_NAME ]]  && PROJECT_NAME=lampol
#End Select php-memcache Ver

clear

echo -e "================================================="
echo -e "`Print_Color '32' 'Start Install Composer Please Hold On  '`"
echo -e "================================================="
 Install_Composer	

 Start_Install_Framework $THINKPHP_VER $PROJECT_NAME
}
