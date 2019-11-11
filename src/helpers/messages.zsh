#!/usr/bin/env ksh

CLEAR='\033[0m'
LIGHT_GREEN='\033[1;32m'
RED="\033[0;31m"
GREEN="\033[0;32m"

message_success(){
    printf "${CLEAR}${GREEN}Success: %s ${CLEAR}\n" "$1";
}

message_info(){
    printf "${CLEAR}${LIGHT_GREEN}Info: %s ${CLEAR}\n" "$1";
}

message_error(){
    printf "${CLEAR}${RED}Error: %s ${CLEAR}\n" "$1" >&2; exit 1;
}