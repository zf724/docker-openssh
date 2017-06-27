ROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache openssh autossh \
    && mkdir -p 700 /root/.ssh \
    && mv /etc/ssh /root/.ssh/ssh \
    && ln -s /root/.ssh/ssh /etc/ssh

ADD ./keys/known_hosts /root/.ssh/keys/known_hosts
ADD ./keys/id_rsa /root/.ssh/keys/id_rsa
ADD ./keys/authorized_keys /root/.ssh/keys/authorized_keys

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /root
VOLUME /root
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
