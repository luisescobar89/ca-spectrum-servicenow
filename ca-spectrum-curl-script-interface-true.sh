#!/bin/bash

DATE=$1
TIME=$2
MODEL_TYPE=$3
MODEL_NAME=$4
ALARM_ID=$5
SEVERITY=$6
CAUSE=$7
REPAIR_SCREEN=$8
SERVER=$9
LANDSCAPE=$10
MODEL_HANDLE=$11
MODEL_TYPE_HANDLE=$12
IP_ADDRESS=$13
SECURITY_STRING=$14
ALARM_STATE=$15
ACKNOWLEDGED=$16
CLEARABLE=$17
FLASH_GREEN=$18
LOCATION=$19
AGE=$20
NOTIFDATA=$21
SOURCE="CA Spectrum"

curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d "{
    \"records\":[{
        \"source\":\"$SOURCE\",
        \"node\" : \"$SERVER\",
        \"type\" : \"Low Disk Space\",
        \"resource\" : \"C:\",
        \"severity\":\"5\",
        \"description\" : \"Disk Usage 98%\",
        \"additional_info\":\"{\'u_key\':\'core01\'}\"
    }]
}" -u midserverle:midserver https://highmetricdemo2.service-now.com/api/global/em/jsonv2
