FROM alpine:latest

MAINTAINER Oanh Nguyen <oanhnn.bk@gmail.com>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk update \
 && apk add --no-cache bash ca-certificates s6 \
 && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD ["/bin/s6-svscan", "/etc/services.d"]
