FROM eclipse-temurin:17-alpine

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf 

RUN apk update && \
    apk add --no-cache groff \
                       tzdata \
                       imagemagick \
                       ttf-dejavu \
                       gettext && \
    cp /usr/share/zoneinfo/Etc/GMT-3 /etc/localtime && \
    echo "Etc/GMT-3" > /etc/timezone && \
    apk --purge del tzdata py-pip


RUN apk add --no-cache jattach --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
