#/bin/bash
## author: Jerry
## email:  xumingyu528@gmail.com
##



while :;do

  sleep 2;
  mysql  -e 'show engine innodb status\G' >> show_engine_innodb_status.log


done
