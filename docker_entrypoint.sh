:! /usr/bin/bash
/app/udp2raw -c -l $LOCAL_LISTEN -r $REMOTE_LISTEN --raw-mode faketcp -a -k $KEY --fix-gro
