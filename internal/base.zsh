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
