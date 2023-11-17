#!/bin/bash

service vsftpd start
adduser $ftp_user 
echo "$ftp_user:$ftp_pwd" | /usr/sbin/chpasswd
sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
usermod -d /var/www/wordpress/ $ftp_user
service vsftpd stop
vsftpd