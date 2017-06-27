#!/bin/sh

cd /root/.ssh

if [ -d keys ] then
    cat keys/*.pub > authorized_keys
fi

if [ -f keys/client.pri ] then
    cat keys/client.pri > id_rsa
    chmod 600 id_rsa
else
    ssh-keygen -A
fi

exec /usr/sbin/sshd -D "$@"
#exec /usr/bin/autossh -M 5678 -NR 0.0.0.0:2222:localhost:22 zhangfeng@nat.zwise.pw
