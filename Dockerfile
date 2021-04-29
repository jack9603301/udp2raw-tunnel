FROM debian
MAINTAINER sunteya <sunteya@gmail.com>

# RUN mkdir /app \
#  && cd /app \
#  && wget https://github.com/wangyu-/udp2raw-tunnel/releases/download/20180225.0/udp2raw_binaries.tar.gz \
#  && tar xvfz udp2raw_binaries.tar.gz \
#  && mv udp2raw_amd64_hw_aes udp2raw \
#  && ls | grep -v ^udp2raw$ | xargs rm


RUN apt update && apt install alpine-sdk linux-headers \
 && apt install iptables libstdc++ \
 && mkdir /app \
 && git clone https://github.com/wangyu-/udp2raw-tunnel.git /build \
 && cd /build && git checkout -b build 20190716.test.0 \
 && cd /build && make dynamic \
 && mv udp2raw_dynamic /app/udp2raw \
 && cd - && rm -rf /build \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/*

ENTRYPOINT [ "/app/udp2raw_arm_asm_aes", '-c', '-l', $LOCAL_LISTEN, '-r', $REMOTE_LISTEN, '--raw-mode', 'faketcp', '-a', '-k', $KEY, '--fix-gro']
