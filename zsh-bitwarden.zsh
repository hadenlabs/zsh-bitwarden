#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install bitwarden for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
bw_package_name=@bitwarden/cli

BW_ROOT_DIR=$(dirname "$0")
BW_SRC_DIR="${BW_ROOT_DIR}"/src

# shellcheck source=/dev/null
source "${BW_SRC_DIR}"/base.zsh

# shellcheck source=/dev/null
source "${BW_SRC_DIR}"/bitwarden.zsh

function bw::install {
    local has_dependences
    has_dependences="$(bw::has_dependences)"
    message_info "Installing ${bw_package_name}"
    if [ "${has_dependences}" -eq 1 ]; then
        yarn global add ${bw_package_name}
        message_success "Installed {bw_package_name}"
    fi
}

# facade for use bw::search
function fbw {
    bw::search "${@}"
}

if [ "$(bw::exist)" -eq 0  ]; then bw::install; fi
