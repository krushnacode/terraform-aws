#! /bin/bash

printf "Memory\t\tDisk\tCPU\t\t\tTIME\n"
end=$((SECONDS+30))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
TIME=$(date)
echo "$MEMORY$DISK$CPU$TIME"
sleep 3
done
# make sure to give the permission of +x to the file otherwise it will not run on the server.
# command for changing the permission is  chmod +x filename.sh 
# here we are not only checking the cpu but also memory disk size utilization and time to check the total health of the system.


# For running the task in background - nohup command to run it after the terminal is terminated.