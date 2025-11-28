#/bin/bash
PASSWD=" "

while :;do

  sleep 1;
  echo `date +%Y%m%d%H%M%S` >>  show_full_processlist.log
  mysql $PASSWD -e 'SHOW FULL PROCESSLIST\G' | grep State: | sort | uniq -c  | sort -rn  >> show_full_processlist.log 2>/dev/null
  echo ' ' >> show_full_processlist.log

  echo `date +%Y%m%d%H%M%S` >>  detail_show_full_processlist.log
  mysql $PASSWD -e 'SHOW FULL PROCESSLIST\G' >> detail_show_full_processlist.log 2>/dev/null
  echo ' ' >> detail_show_full_processlist.log



done
