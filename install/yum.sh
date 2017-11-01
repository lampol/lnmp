#! /bin/sh

# ============================================================
# FileName          yum.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-02-17 13:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================

function Yum_Install(){
	#check centos7 or 6
	if [ $1 -eq 7 ]
        then
                yum install -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        elif [ $1 -eq 6 ]
        then
               yum install -y http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
        fi
	#start install dependency
        yum install -y  pcre-devel openssl openssl-devel libxml2-devel libcurl-devel libjpeg-devel libpng-devel freetype-devel libicu-devel libmcrypt-devel libxslt-devel cmake ncurses-devel perl  bison
}


function Yum_Install_Tool(){
	yum install -y gcc gcc-c++ wget git lrzsz autoconf net-tools  telnet vim 

}

function Install_Composer(){
        curl -sS https://getcomposer.org/installer | php
        [[ $? -ne 0 ]] && clear &&  echo -e "`Print_Color '31' "composer install failed please try again"`" && exit 1
        mv composer.phar /usr/local/bin/composer
        composer config -g repo.packagist composer https://packagist.phpcomposer.com
}
