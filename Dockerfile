#
# Dockerfile for openssh
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache openssh autossh \
    && mkdir -p 700 /root/.ssh \
    && mv /etc/ssh /root/.ssh/ssh \
    && ln -s /root/.ssh/ssh /etc/ssh

ADD https://raw.githubusercontent.com/zf724/ssh/master/docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV hostname "root"

WORKDIR /root
VOLUME /root

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
