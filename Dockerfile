FROM alpine

RUN set -xe \
    && apk add --no-cache openssh autossh \
    && mkdir -p 700 /root/.ssh \
    && sed -i -e '/StrictHostKeyChecking/s/ask/no/' \
              -e '/StrictHostKeyChecking/s/^#//' \
              /etc/ssh/ssh_config

ADD ./keys/id_rsa /root/.ssh/id_rsa
ADD ./keys/authorized_keys /root/.ssh/authorized_keys

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
