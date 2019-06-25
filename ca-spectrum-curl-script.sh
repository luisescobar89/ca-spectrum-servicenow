#!/bin/bash
# cURL script that triggers from CA Spectrum SAMN notification to build an HTTP POST request and create an event on ServiceNow em_event table
# Arguments/variables added are for when USE_NEW_INTERFACE Set to False
# 
# Version History
# ---------------------------------------------------
# 1.0      initial release       HM\LE      5/23/2019

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