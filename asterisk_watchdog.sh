#!/bin/bash
#asterisk watchdog
#/usr/local/bin/asterisk-watchdog.sh
#crontab:
# * * * * * /usr/local/bin/asterisk-watchdog.sh

#set -x

/usr/sbin/asterisk -rx 'core show version' >> /dev/null
errcode=$?

if [ "$errcode" != "0" ] ;then
#/etc/init.d/asterisk stop
#sleep 3
/etc/init.d/asterisk restart
echo "[$(date)]Started Asterisk Service at $(date)" >> /var/log/asterisk/asterisk-check.log
fi


#set +x
exit


