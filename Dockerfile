FROM debian
MAINTAINER jack960330 <jack9603301@163.com>


COPY bin /usr/bin

ENTRYPOINT [ "udp2raw_arm_asm_aes", '-c', '-l', $LOCAL_LISTEN, '-r', $REMOTE_LISTEN, '--raw-mode', 'faketcp', '-a', '-k', $KEY, '--fix-gro']
