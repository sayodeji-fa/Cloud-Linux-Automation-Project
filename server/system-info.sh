
#!/bin/bash

LOGFILE="system-info-$(date +%F).txt"

echo "System Information Log" > $LOGFILE
echo "Date: $(date)" >> $LOGFILE
echo "Hostname: $(hostname)" >> $LOGFILE
echo "Uptime: $(uptime)" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

aws s3 cp $LOGFILE s3://cloud-automation-shawn/
