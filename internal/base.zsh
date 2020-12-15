#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::internal::bitwarden::install {
    message_info "Installing ${BITWARDEN_PACKAGE_NAME}"
    if ! type -p yarn > /dev/null; then
        message_warning "${BITWARDEN_MESSAGE_BREW}"
        return
    fi
    yarn global add bw
}

function bitwarden::internal::rsync::install {
    if ! type -p brew > /dev/null; then
        message_warning "${BITWARDEN_MESSAGE_BREW}"
        return
    fi
    message_info "Installing rsync for ${BITWARDEN_PACKAGE_NAME}"
    brew install rsync
    message_success "Installed rsync ${BITWARDEN_PACKAGE_NAME}"
}

function bitwarden::internal::fzf::install {
    # shellcheck disable=SC2154
    message_info "Installing fzf for ${BITWARDEN_PACKAGE_NAME}"
    if ! type -p brew > /dev/null; then
        message_warning "${BITWARDEN_MESSAGE_BREW}"
        return
    fi
    brew install fzf
    message_success "Installed fzf for ${BITWARDEN_PACKAGE_NAME}"
}

function bitwarden::internal::yarn::install {
    message_info "Installing yarn for ${BITWARDEN_PACKAGE_NAME}"
    curl -o- -L https://yarnpkg.com/install.sh | bash
    message_success "Installed yarn ${BITWARDEN_PACKAGE_NAME}"
}

function bitwarden::internal::node::install {
    if ! type nvm > /dev/null; then
        message_warning "${BITWARDEN_MESSAGE_NVM}"
        return
    fi
    message_info "Installing version node ${BITWARDEN_PACKAGE_NAME}"
    nvm install --lts
    nvm use --lts --default
    message_success "Installed version node ${BITWARDEN_PACKAGE_NAME}"
}
