#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::internal::bitwarden::install {
    message_info "Installing ${BITWARDEN_PACKAGE_NAME}"
    if ! core::exists yarn; then
        message_warning "${BITWARDEN_MESSAGE_BREW}"
        return
    fi
    yarn global add bw
}

function bitwarden::internal::load::env {
    local name_env
    name_env=$(echo "${BITWARDEN_VARS_LIST}" | tr ' ' '\n' | fzf | awk -F: '{print $1}')
    if [ -z "${name_env}" ]; then
        return
    fi
    eval env-secrets bw "${name_env}"
}