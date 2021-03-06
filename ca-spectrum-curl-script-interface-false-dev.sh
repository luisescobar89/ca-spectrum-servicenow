#!/bin/bash
# cURL script that triggers from CA Spectrum SAMN notification to build an HTTP POST request and create an event on ServiceNow em_event table
# # Arguments/variables added are for when USE_NEW_INTERFACE Set to False
#
# Version History
# ---------------------------------------------------
# 1.0      initial release       HM\LE      5/23/2019


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
        \"node\" : \"$MNAME\",
        \"type\" : \"$ALARM_TITLE\",
        \"metric_name\" : \"$ALARM_TITLE\",
        \"resource\" : \"\",
        \"severity\" : \"\",
        \"description\" : \"$EVTMSG\",
        \"message_key\" : \"\",
        \"resolution_state\" : \"\",
        \"additional_info\":\"{\'u_date\':\'$DATE\', \'u_time\':\'$TIME\', \'u_model_type\':\'$MTYPE\', \'u_severity\':\'$SEV\', \'u_cause\':\'$ALARM_TITLE\', \'u_repair_screen\':\'$REPAIRPERSON\', \'u_landscape\':\'$LANDSCAPE\', \'u_model_name\':\'$MNAME\', \'u_model_handle\':\'$MHANDLE\', \'u_model_type_handle\':\'$MTHANDLE\', \'u_ip_address\':\'$IPADDRESS\', \'u_security_string\':\'$SECSTR\', \'u_alarm_state\':\'$ALARMSTATE\', \'u_acknowledged\':\'$ACKD\', \'u_clearable\':\'$CLEARABLE\', \'u_flash_green\':\'$FLASH_GREEN\', \'u_location\':\'$LOCATION\', \'u_age\':\'$AGE\', \'u_notifdata\':\'$EVTMSG\', \'u_alarm_id\':\'$AID\', \'u_global_alarm_id\':\'$GLOBAL_ALARM_ID\', \'u_server\':\'$SERVER\'}\"
    }]
}" -u $USER:$PASSWORD https://[instance_url].service-now.com/api/global/em/jsonv2
