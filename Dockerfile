FROM alpine:3.11.2
MAINTAINER jack960330 <jack9603301@163.com>

RUN apk add --update --virtual .build-deps alpine-sdk linux-headers \
 && apk add iptables libstdc++ \
 && mkdir /app \
 && git clone https://github.com/wangyu-/udp2raw-tunnel.git /build \
 && cd /build && make dynamic \
 && mv udp2raw_dynamic /app/udp2raw \
 && cd - && rm -rf /build \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/*

COPY docker_entrypoint.sh .

ENTRYPOINT [ "./docker_entrypoint.sh" ]
