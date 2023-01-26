# below cammand will help to manage the stress test and will run it for 10 seconds 
# we have to first install package - stress to test the server health.

stress -c 2 -i 1 -m 1 --vm-bytes 128M -t 10s

# it will specify CPU-bound proccess -c
# it will I/O-bound process -i 
# it will memory allocate process as  -m 
# in above directly put the number of resource you want 