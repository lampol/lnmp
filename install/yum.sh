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

        yum install -y http://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm  gcc gcc-c++ wget  pcre-devel openssl openssl-devel libxml2-devel libcurl-devel libjpeg-devel libpng-devel freetype-devel libicu-devel libmcrypt-devel openssl-devel libxslt-devel cmake ncurses-devel perl  bison
}
