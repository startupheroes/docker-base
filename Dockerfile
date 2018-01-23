FROM frolvlad/alpine-oraclejdk8:slim

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN apk add --no-cache tzdata imagemagick ttf-dejavu && \
 cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
 echo "Europe/Moscow" > /etc/timezone && \
 apk del tzdata
