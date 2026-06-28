#!/bin/bash

DISK_USAGE=$(df -P / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ $DISK_USAGE -lt 90 ]; then
    echo "There is enough free space ($DISK_USAGE% used). Starting backup..."
    mkdir -p ~/backup/
    cp -r /etc ~/backup/
    echo "Backup completed successfully!"
else
    echo "Error: Not enough disk space ($DISK_USAGE% used). Backup cancelled!"
fi
