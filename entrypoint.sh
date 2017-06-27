#!/bin/sh

cd /root/.ssh

ssh-keygen -A

if [ -d keys ];then
    mv keys/* .
    chmod 600 id_rsa
fi

#exec /usr/sbin/sshd -D "$@"
exec /usr/bin/autossh -M 5678 -NR 0.0.0.0:2222:localhost:22 zhangfeng@nat.zwise.pw
