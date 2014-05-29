#!/bin/bash
#asterisk watchdog
#place to /usr/local/bin/asterisk-watchdog.sh ( or whatever you can imagine )
#do not forget set chmod +x
#crontab line:
# * * * * * /usr/local/bin/asterisk-watchdog.sh
/usr/sbin/asterisk -rx 'core show version' >> /dev/null
errcode=$?

if [ "$errcode" != "0" ] ;then
#/etc/init.d/asterisk stop
#sleep 3
/etc/init.d/asterisk restart
echo "[$(date)]Started Asterisk Service at $(date)" >> /var/log/asterisk/asterisk-check.log
fi

exit


