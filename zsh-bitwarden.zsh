#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install bitwarde for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

plugin_dir="$(dirname ${0}:A)"
source "${plugin_dir}"/src/helpers/messages.zsh

PACKAGE_NAME='@bitwarden/cli'

die(){
    message_error "$1";
}

function bw::validation {
    if [ ! -x "$(command which node)" ]; then
        message_error "is Neccesary Node"
    else
        bw::dependences
    fi
}

function bw::dependences {
    if [ ! -x "$(command which yarn)" ]; then
        message_info "Installing yarn"
        curl -o- -L https://yarnpkg.com/install.sh | bash
    fi
}

function bw::install {
    message_info "Installing ${PACKAGE_NAME}"
    bw::validation
    yarn global add ${PACKAGE_NAME}
    bw::post_install
}

function bw::search {
    if hash bw 2>/dev/null; then
        bw get item \
           "$(bw list items \
              | jq '.[] | "\(.name) | username: \(.login.username) | id: \(.id)" ' \
              | fzf \
              | awk '{print $(NF -0)}' \
              | sed 's/\"//g'
            )" \
                | jq '.login.password' \
                | sed 's/\"//g' \
                | perl -pe 'chomp' \
                | pbcopy
    fi
}

if [ ! -x "$(command which bw)" ]; then
    bw::install
fi
