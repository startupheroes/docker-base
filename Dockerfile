FROM eclipse-temurin:18-alpine

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf 

RUN apk update && \
    apk add --no-cache python3 \
                       py3-pip \
                       groff \
                       tzdata \
                       imagemagick \
                       gcompat \
                       ttf-dejavu \
                       gettext \
                       curl && \
    pip install --upgrade awscli==1.18.51  && \
    cp /usr/share/zoneinfo/Etc/GMT-3 /etc/localtime && \
    echo "Etc/GMT-3" > /etc/timezone && \
    apk --purge del tzdata py-pip

ENV LD_PRELOAD=/lib/libgcompat.so.0

RUN apk add --no-cache jattach --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/