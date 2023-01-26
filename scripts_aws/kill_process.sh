for p in $(ps -ef|grep defunct|grep -v grep|awk '{print $3}'|sort -u); do 
    sudo kill -9 $p; 
done

# here the script will find the zombie process running in the background and will ve terminated by using -9 user case of the process list.
