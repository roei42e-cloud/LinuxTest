#!/bin/bash

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $DISK_USAGE -lt 90 ]; then
    echo "Disk space is OK ($DISK_USAGE% used). Starting backup..."
    cp -r /etc ~/backup/
    echo "Backup completed successfully!"
else
    echo "Error: Insufficient disk space ($DISK_USAGE% used). Backup aborted!"
fi
