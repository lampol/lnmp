# 一键安装lnmp环境的脚本
### 系统版本

>亲测 **Centos6 Centos7** 系统没有问题---


------------

### 可安装的软件版本

------------

#### nginx
>1. nginx-1.8.1
>2. nginx-1.10.3
>3. nginx-1.11.10

#### php
>1. php-5.3.29
>2. php-5.4.45
>3. php-5.5.38
>4. php-5.6.30
>5. php-7.0.27
>6. php-7.1.14
>7. php-7.2.2

#### MySQL
>1. mysql-5.5.54
>2. mysql-5.6.37

#### ThinkPHP
>  ThinkPHP 5.0.22
>  ThinkPHP 5.1.29

#### Memcached 服务端
>1. memcached-1.5.2.tar.gz 
>2. memcached-1.4.39.tar.gz

#### php-memcache 客户端
>1. memcache-2.2.7.tgz

#### Redis 服务端
>1 redis-3.2.9.tar.gz
>2 redis-4.0.1.tar.gz

#### php-redis 客户端
>1 redis-3.1.4.tgz
>2 redis-2.2.8.tgz

### 安装教程
####  下载

> git clone  https://github.com/lampol/lnmp.git

#### 开始安装

```
 cd  lnmp  //下载到本地后进到目录里面
 chmod  +x  install.sh  //给安装脚本赋执行的权限
 ./install.sh   //开始执行安装
根据提示选择软件安装的版本。（注意要联网，如果出现错误可能是网络问题） 
```
#### 使用
#### 启动服务

```
/etc/init.d/nginx    start  //注意nginx的端口改成了8080
/etc/init.d/php-fpm  start 
/etc/init.d/mysql   start
```
### 注意!!！

> 强烈建议安装完后修改MySQL的密码  默认为空

#### 修改root密码 禁止远程root登录

```
cd lnmp/shell //进入到shell文件夹 
chmod +x mysql_secure_installation  //给执行的权限
./mysql_secure_installation  //按照提示一步一步操作  设置root密码 以及禁止root的远程登录

```

#### 检测启动
```
运行这个命令   netstat  -nltp 
如果有8080  9000  3306  端口号 代表启动成功

```
#### 根目录
> 项目的根目录在  /home/www  目录下面

#### 访问
IP/域名：8080  即可访问到根目录
如果访问不到请检测网络 或者关闭防火墙重试

## 安装php 框架 暂时只支持 ThinkPHP 5.0.22/5.1.29

> 注意 安装框架前一定要先安装lnmp的环境
> 已经配置好了nginx的配置 直接ip访问即可 

#### 开始安装

```
   cd lnmp/shell
   chmod +x install_framework.sh
   ./install_framework.sh 
   //剩下的按提示操作

```

## 安装其他扩展 

### 安装memcached redis 服务端 php-memcache php-redis客户端  

> memcache的服务端和客户端可以单独安装互不影响，
> 注意php-memcache要求是要安装php,安装完前面的php才可以安装

#### 安装教程

```
cd lnmp/shell
chmod +x install_third_party.sh
./install_third_party.sh
然后选择 安装的软件和版本可以选择安装或者不安装

```

#### 启动服务


```
/etc/init.d/memcached  start|stop|restart
/etc/init.d/redis      start|stop|restart

```

## 有问题反馈
在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* QQ: 807968192 
* php/linux技术交流群：163656536
* 头条号 : (lampol)
* 个人博客: (http://www.lampol-blog.com)
* 腾讯课堂: (https://ke.qq.com/course/list/lampol)

## 常见问题及解决
* 如果出现安装错误，可以重试，特别是下载软件的时候，网络不好可能会出错误
* 如果不能访问，请关闭防火墙重试

#### 声明
> 欢迎大家提出建设性的意见或者建议。
