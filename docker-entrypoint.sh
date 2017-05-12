#!/bin/sh

cd /root/.ssh

if [ -d keys ]
then
    cat keys/*.pub > authorized_keys
fi

ssh-keygen -A

exec /usr/sbin/sshd -D "$@"
#exec /usr/bin/autossh -M 5678 -NR 7778:localhost:22 root@115.29.251.52
