#!/bin/bash
#########################################################################################
# Created by DjRaPmAn                                                                   #
#                                                                                       #
# This Script will download and install needed packages for a working desktop           #
# environment Due to bugs in centos 6 XFCE doesn't work correctly over VNC, so          #
# the script will jest install the "Desktop" group package.                             #
#                                                                                       #
#                                                                                       #
# Also since this is a server I recomend securing it even do it is only used for bot's  #
# it still is a server. Here a good read up / tutorial on how to do so                  #
# http://wiki.centos.org/HowTos/OS_Protection                                           #
#                                                                                       #
# You may edit or modify or redistribute this script.                                   #
# Version 2.01                                                                          #
# 10 November, 2012                                                                     #
#########################################################################################

###############
# centos 6 x64#
###############
#
yum install wget -y
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31-linux-x64.rpm -O jdk-8u31-linux-x64.rpm
rpm -Uvh jdk-8u31-linux-x64.rpm
yum groupinstall "Xfce" "Desktop" -y
yum install -y nano unzip xkill firefox tigervnc-server xorg-x11-server-Xorg gdm xorg-x11-fonts-* libXtst-devel-*
clear
echo ""
echo "Enter a password for VNC"
vncserver && vncserver -kill :1
sed -i 's/twm/startxfce4/g' ~/.vnc/xstartup
clear
vncserver
echo ""
echo "you may now connect to the vncserver at  $IP:1 or $IP:5901"
mkdir -p ~/jagexcache/runescape/LIVE
rm -rf *.rpm
