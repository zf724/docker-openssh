#!/bin/sh

ssh-keygen -A

#exec /usr/sbin/sshd -D "$@"
exec /usr/bin/autossh -M 5678 -NR 0.0.0.0:2222:localhost:22 zhangfeng@119.29.185.237
