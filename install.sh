#! /bin/sh

# ============================================================
# FileName          install.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 09:13
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
BASE_DIR=`pwd`
source $BASE_DIR/common/vars.sh
source $BASE_DIR/common/common.sh
source $BASE_DIR/install/main.sh


#Check User root
if [ `id -u` -ne 0 ]
then
	echo  -e "\033[31m Your Current User is `whoami` Please install by root \033[0m"
	exit 1
fi
#print welcome info
clear
echo "+------------------------------------------------------------------------+"
Print_Color "32" "This is auto install lnmp script"         
echo "+------------------------------------------------------------------------+"
#
cat << EOF
***********Are You Ready To Install Lnmp?*********
	1) `Print_Color "32" "Install Lnmp Right Now"`
	2) `Print_Color "32" "Exit"`
EOF

read -p "Please Enter Your Choice(1/2):" input

case "$input" in
	1)
	  Init_Install $RELEASE $OS 
	;;
	*)
	   Print_Color "32" "You Have Exit Install Welcome Install Again"
	   exit 1
esac
