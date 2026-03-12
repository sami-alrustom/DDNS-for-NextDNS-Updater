#!/bin/bash

LOGFILE="/var/log/nextdns-ddns.log"
URL="https://link-ip.nextdns.io/YOUR_TOKEN"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
RESPONSE=$(curl -fsS $URL 2>&1)
STATUS=$?

if [ $STATUS -eq 0 ]; then
    echo "$TIMESTAMP [SUCCESS] IP Updated: $RESPONSE" >> $LOGFILE
else
    echo "$TIMESTAMP [ERROR] Curl failed: $RESPONSE" >> $LOGFILE
fi