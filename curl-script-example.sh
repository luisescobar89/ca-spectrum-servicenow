#!/bin/bash

DATE=$1
TIME=$2

echo $SOURCE

curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d "{
    \"records\":[{
        \"source\":\"Simulated\",
        \"node\" : \"SERVER01\",
        \"type\" : \"Low Disk Space\",
        \"resource\" : \"C:\",
        \"severity\":\"5\",
        \"description\" : \"Disk Usage 98%\",
        \"additional_info\":\"{\'u_key\':\'core01\'}\"
    }]
}" -u midserverle:midserver https://highmetricdemo2.service-now.com/api/global/em/jsonv2
