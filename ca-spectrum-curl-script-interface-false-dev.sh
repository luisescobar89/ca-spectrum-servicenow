#!/bin/bash

CREDS="$(realpath "credentials")"
. $CREDS

DATE=${1}
TIME=${2}
MODEL_TYPE=${3}
MODEL_NAME=${4}
ALARM_ID=${5}
SEVERITY=${6}
CAUSE=${7}
REPAIR_SCREEN=${8}
STATUS=${9}
SERVER=${10}
LANDSCAPE=${11}
MODEL_HANDLE=${12}
MODEL_TYPE_HANDLE=${13}
IP_ADDRESS=${14}
SECURITY_STRING=${15}
ALARM_STATE=${16}
ACKNOWLEDGED=${17}
CLEARABLE=${18}
FLASH_GREEN=${19}
PCAUSE=${20}
LOCATION=${21}
AGE=${22}
NOTIFDATA=${23}
EVENTMSG=${24}
SOURCE="CA Spectrum"

curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d "{
    \"records\":[{
        \"source\" : \"$SOURCE\",
        \"node\" : \"$SERVER\",
        \"type\" : \"\",
        \"resource\" : \"\",
        \"severity\" : \"\",
        \"description\" : \"$EVENTMSG\",
        \"message_key\" : \"$ALARM_ID\",
        \"resolution_state\" : \"\",
        \"additional_info\":\"{\'u_date\':\'$DATE\', \'u_time\':\'$TIME\', \'u_model_type\':\'$MODEL_TYPE\', \'u_model_name\':\'$MODEL_NAME\', \'u_severity\':\'$SEVERITY\', \'u_cause\':\'$CAUSE\', \'u_repair_screen\':\'$REPAIR_SCREEN\', \'u_status\':\'$STATUS\', \'u_landscape\':\'$LANDSCAPE\', \'u_model_handle\':\'$MODEL_HANDLE\', \'u_model_type_handle\':\'$MODEL_TYPE_HANDLE\', \'u_ip_address\':\'$IP_ADDRESS\', \'u_security_string\':\'$SECURITY_STRING\', \'u_alarm_state\':\'$ALARM_STATE\', \'u_acknowledged\':\'$ACKNOWLEDGED\', \'u_clearable\':\'$CLEARABLE\', \'u_flash_green\':\'$FLASH_GREEN\', \'u_pcause\':\'$PCAUSE\', \'u_location\':\'$LOCATION\', \'u_age\':\'$AGE\', \'u_notifdata\':\'$NOTIFDATA\'}\"
    }]
}" -u $USER:$PASSWORD https://itservicenow-dev.harris.com/api/global/em/jsonv2