#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

_get_type () {
    local bw_type
    bw_type="${1}"
    echo "${bw_type}" \
        | awk '{
            split($0, array, "|")
            print array[1]
        }'
}

_get_id () {
    local bw_id
    bw_id=${1}
    echo "$bw_id" \
        | awk '{
            split($0, array, "|")
            print array[2]
        }'
}

_get_type_field () {
    local bw_type
    bw_type=$(_get_type "${1}")
    if [ "${bw_type}" -eq "1" ]
    then
        echo ".login.password"
    elif [ "${bw_type}" -eq "2" ]
    then
        echo ".notes";
    fi
}

_get_item_by_type() {
    local bw_id
    local bw_type_field
    bw_type_field=$(_get_type_field "${1}")
    bw_id=$(_get_id "${1}")
    bw get item "${bw_id}"  \
        | jq "${bw_type_field}" \
        | sed 's/\"//g' \
        | perl -pe 'chomp' \
        | pbcopy
}

function bw::value::notes {
    local payload response
    payload="${1}"
    response=$(echo  "${payload}" \
                   | jq -r '.notes' \
                   | sed 's/\"//g' \
                   | perl -pe 'chomp'
            )
    echo "${response}"
}

function bw::value::cards {
    local payload response
    payload="${1}"
    response=$(echo "${payload}" | jq -r '.card')
    echo "${response}"
}

function bw::value::login {
    local payload response
    payload="${1}"
    response=$(echo "${payload}" | jq -r '.login.password')
    echo "${response}"
}

function bw::value::factory {
    local uuid payload type response
    uuid="${1}"
    payload=$(bw get item "${uuid}")
    type=$(echo -n "${payload}" | jq -r '.type')
    if [ "${type}" -eq 1 ]; then
        response="$(bw::value::login "${payload}")"
    elif [ "${type}" -eq 2 ]; then
        response="$(bw::value::notes "${payload}")"
    elif [ "${type}" -eq 3 ]; then
        response="$(bw::value::cards "${payload}")"
    fi
    echo -e "$response" | ghead -c -1 | pbcopy
}

function bw::search::notes {
    bw list items  | jq -r '.[] | select(.type == 2) | [.id, .type, .name, .login.username] | @csv' \
        | awk 'BEGIN{FS=","; OFS="\t"} {print $1,$2,$3,$4}'
}

function bw::search::login {
    bw list items  | jq -r '.[] | select(.type == 1) | [.id, .type, .name, .login.username] | @csv' \
        | awk 'BEGIN{FS=","; OFS="\t"} {print $1,$2,$3,$4}'
}

function bw::search::cards {
    bw list items  | jq -r '.[] | select(.type == 3) | [.id, .type, .name, .login.username] | @csv' \
        | awk 'BEGIN{FS=","; OFS="\t"} {print $1,$2,$3,$4}'
}

function bw::search::all {
    bw list items  | jq -r '.[] | [.id, .type, .name, .login.username] | @csv' \
        | sed 's/"//g' \
        | awk 'BEGIN{FS=","; OFS="\t"} {print $1,$2,$3,$4}'
}

function bw::search {
    local uuid
    if [ "$(bw::exist)" -eq 0 ]; then
        message_warning "Please review install bitwarden"
        return
    fi
    uuid=$(bw::search::all \
               | fzf \
               | awk '{print $1}' \
               | perl -pe 'chomp' \
            )
    bw::value::factory "${uuid}"
}