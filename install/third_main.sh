#! /bin/sh

# ============================================================
# FileName          main.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-10-11 10:07
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================
source $BASE_DIR/install/memcached.sh
source $BASE_DIR/install/php_memcache.sh
source $BASE_DIR/install/redis.sh
source $BASE_DIR/install/yum.sh

function Start_Install_Third(){
        MEMCACHED_VER=$1
        PHP_MEMCACHE_VER=$2
	REDIS_VER=$3

        case "$MEMCACHED_VER" in
                1)
                MEMCACHED_VER=memcached-1.5.2.tar.gz
                ;;
                2)
                 MEMCACHED_VER=memcached-1.4.39.tar.gz
                 ;;
                3)
                MEMCACHED_VER=N
                 ;;
        esac
        case "$PHP_MEMCACHE_VER" in
                1)
                 PHP_MEMCACHE_VER=memcache-2.2.7.tgz
                ;;
                2)
                 PHP_MEMCACHE_VER=N
                 ;;
        esac
	case "$REDIS_VER" in
                1)
                REDIS_VER=redis-3.2.9.tar.gz
                ;;
                2)
                 REDIS_VER=redis-4.0.1.tar.gz
                 ;;
                3)
                REDIS_VER=N
                 ;;
        esac

	[[ $MEMCACHED_VER != N ]] && Install_Memcached $MEMCACHED_VER
	[[ $PHP_MEMCACHE_VER != N ]] && Install_Php_Memcached $PHP_MEMCACHE_VER
	[[ $REDIS_VER != N ]] && Install_Redis $REDIS_VER
}

function Install_Third(){


clear
#Start Select Memcached Ver
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Select memcached Version'`"
        echo -e "================================================="
        MEMCACHED_VER=1
        echo -e "1)  `Print_Color '32' 'memcached-1.5.2.tar.gz'`"
        echo -e "2)  `Print_Color '32' 'memcached-1.4.39.tar.gz'`"
        echo -e "3)  `Print_Color '32' 'I Don not Want To Install Memcached'`"
        read -p "Please Enter Your Memcached  Choice(1/2/3) Default(1):" MEMCACHED_VER
        [[ $MEMCACHED_VER -lt 1 ]] || [[ $MEMCACHED_VER -ge 4 ]] && MEMCACHED_VER=1
#End Select Memcached Ver
clear
#Start Select php-memcache Ver
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Select php-memcache Version '`"
        echo -e "================================================="
        PHP_MEMCACHE_VER=1
        echo -e "1)  `Print_Color '32' 'memcache-2.2.7.tgz'`"
        echo -e "2)  `Print_Color '32' 'I Don not Want To Install php-memcache'`"
        read -p "Please Enter Your PHP-memcache Choice(1/2) Default(1):" PHP_MEMCACHE_VER
        [[ $PHP_MEMCACHE_VER -lt 1 ]] || [[ $PHP_MEMCACHE_VER -ge 3 ]] && PHP_MEMCACHE_VER=1
#End Select php-memcache Ver
clear
#Start Select Redis Ver
        echo -e "================================================="
        echo -e "`Print_Color '32' 'Please Select Redis Version '`"
        echo -e "================================================="
        REDIS_VER=1
        echo -e "1)  `Print_Color '32' 'redis-3.2.9.tar.gz'`"
        echo -e "2)  `Print_Color '32' 'redis-4.0.1.tar.gz'`"
        echo -e "3)  `Print_Color '32' 'I Don not Want To Install Redis'`"
        read -p "Please Enter Your Redis Choice(1/2/3) Default(1):" REDIS_VER
        [[ $REDIS_VER -lt 1 ]] || [[ $REDIS_VER -ge 4 ]] && REDIS_VER=1
#End Select Redis Ver


 Yum_Install_Tool
 Start_Install_Third  $MEMCACHED_VER $PHP_MEMCACHE_VER $REDIS_VER
}
