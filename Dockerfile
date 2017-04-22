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

COPY docker-entrypoint.sh /entrypoint.sh

WORKDIR /root
VOLUME /root

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
