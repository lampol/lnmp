#! /bin/sh

# ============================================================
# FileName          welcome.sh
# Copyright (C)     2017 root <root@lampol>
# CreateTime        2017-10-9 11:49
# Author            Lampol
# Email             807968192@qq.com
# Distributed under terms of the MIT license.
#=============================================================

IP=`ifconfig| grep Bcast:|awk  -F':' '{print $2}'|awk '{print $1}'`


function welcome(){
#启动服务
	/etc/init.d/nginx  start
	/etc/init.d/php-fpm  start
	/etc/init.d/mysqld  start
	chkconfig --add nginx
	chkconfig --add php-fpm
	chkconfig --add mysqld

	clear

	figlet  install  success


	echo -e "****"                 VERSION				     
	echo -e "*" 						 	     
	echo -e "*"     `Print_Color '32'  "$1"`			     
	echo -e "*"     `Print_Color '32'  "$2"`			     
	echo -e "*"     `Print_Color '32'  "$3"`			     
	echo -e "*" 						 	     
	echo -e "****"                 根目录				     
	echo -e "*" 						 	     
	echo -e "*"     `Print_Color '32' '/home/www'`						
	echo -e "*" 						 	     
	echo -e "****"                 启动/停止服务 						 	     
	echo -e "*" 						 	     
	echo -e "*"   `Print_Color '32' '/etc/init.d/nginx  start|stop|restart'`						
	echo -e "*"   `Print_Color '32' '/etc/init.d/php-fpm start|stop|restart'`						
	echo -e "*"   `Print_Color '32' '/etc/init.d/mysqld  start|stop|restart'`						
	echo -e "*" 					 	     
	echo -e "****"                 配置目录 						 	     
	echo -e "*"    						 	     
	echo -e "*"   `Print_Color '32' "$SOFT_DIR/nginx/conf(vhost)"`						
	echo -e "*"   `Print_Color '32' "$SOFT_DIR/php/etc"`						
	echo -e "*"   `Print_Color '32' "$SOFT_DIR/mysql/etc"`						
	echo -e "*"    						 	     
	echo -e "****"                 访问项目 						 	     
	echo -e "*"    						 	     
	echo -e "*"   `Print_Color '32' "IP($IP):8080"`						
	echo -e "*"    						 	     
        echo -e "================================================="
	echo -e "*" `Print_Color '32' '	START YOUR PROJECT'` 		   
	echo -e "================================================="
}
