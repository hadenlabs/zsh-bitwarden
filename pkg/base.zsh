#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::dependences {
    message_info "Installing dependences for ${BITWARDEN_PACKAGE_NAME}"
    message_success "Installed dependences for ${BITWARDEN_PACKAGE_NAME}"
}

function bitwarden::post_install {
    message_info "Post Install ${BITWARDEN_PACKAGE_NAME}"
    message_success "Success Install ${BITWARDEN_PACKAGE_NAME}"
}

function bw::value::notes {
    local payload response
    payload="${1}"
    response=$(jq -r '.notes' <<<"$payload")
    echo "${response}"
}

function bw::value::cards {
    local payload response
    payload="${1}"
    response=$(jq -r '.card' <<<"$payload")
    echo "${response}"
}

function bw::value::login {
    local payload response
    payload="${1}"
    response=$(jq -r '.login.password' <<<"$payload")
    echo "${response}"
}

function bw::value::factory {
    local uuid payload type response
    uuid="${1}"
    payload=$(bw --raw get item "${uuid}")
    type=$(jq -r '.type' <<<"${payload}")
    if [ "${type}" -eq 1 ]; then
        response="$(bw::value::login "${payload}")"
    elif [ "${type}" -eq 2 ]; then
        response="$(bw::value::notes "${payload}")"
    elif [ "${type}" -eq 3 ]; then
        response="$(bw::value::cards "${payload}")"
    fi
    echo "${response}"
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
    bw list items  | jq -r '.[] | [.id, .type, .name, .login.username] | @tsv' \
        | sed 's/"//g'
}

function bw::search {
    local uuid
    uuid=$(bw::search::all \
               | fzf \
               | awk '{print $1}' \
               | perl -pe 'chomp' \
            )
    bw::value::factory "${uuid}" | ghead -c -1 | pbcopy
}

function bw::load::vars {
    local path_name
    if [ -z "${BITWARDEN_VARS_LIST}" ]; then
        message_warning "please implement var BITWARDEN_VARS_LIST"
        return
    fi

    path_name=$(echo "${BITWARDEN_VARS_LIST[@]}" | tr " " "\n" | fzf)
    if [ -z "${path_name}" ]; then
        message_warning "not select bitwarden"
        return
    fi
    eval "$(env-secrets bw "${path_name}")"
}