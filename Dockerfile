FROM openjdk:14-alpine3.10

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf 

RUN apk update && \
    apk add --no-cache python \
                       py-pip \
                       groff \
                       gcompat \
                       tzdata \
                       imagemagick \
                       ttf-dejavu \
                       curl && \
    pip install --upgrade awscli==1.18.51  && \
    cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && \
    echo "Europe/Moscow" > /etc/timezone && \
    apk --purge del tzdata py-pip
