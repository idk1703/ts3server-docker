#!/bin/bash

if [ -z $TS3_INI_FILE ]; then
    exec box64 ts3server voice_ip=${TS3_VOICE_IP} default_voice_port=${TS3_VOICE_PORT} query_port=${TS3_QUERY_PORT} filetransfer_port=${TS3_FILETRANSFER_PORT} license_accepted=${TS3_LICENSE_ACCEPTED} licensepath=${TS3_LICENSE_PATH}
else
    exec box64 ts3server inifile=${TS3_INI_FILE} license_accepted=${TS3_LICENSE_ACCEPTED}
fi