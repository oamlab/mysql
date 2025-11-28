#/bin/bash



while :;do

  sleep 2;
  mysql  -e 'show engine innodb status\G' >> show_engine_innodb_status.log


done
