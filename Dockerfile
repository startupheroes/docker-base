FROM openjdk:14-alpine3.10

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf 

RUN apk add --no-cache libc6-compat tzdata imagemagick ttf-dejavu curl && \
 cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
 echo "Europe/Moscow" > /etc/timezone && \
 apk del tzdata
