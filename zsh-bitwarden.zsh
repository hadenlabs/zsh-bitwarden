#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install bitwarden for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
bw_package_name=@bitwarden/cli
export BW_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export BW_MESSAGE_YAY="Please install Go or use antibody bundle luismayta/zsh-goenv branch:develop"
export BW_MESSAGE_NVM="Please install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"

BW_ROOT_DIR=$(dirname "$0")
BW_SRC_DIR="${BW_ROOT_DIR}"/src

# shellcheck source=/dev/null
source "${BW_SRC_DIR}"/base.zsh

# shellcheck source=/dev/null
source "${BW_SRC_DIR}"/helpers.zsh

# shellcheck source=/dev/null
source "${BW_SRC_DIR}"/bitwarden.zsh

# bw::cross::os functions for osx and linux
function bw::cross::os {

    case "${OSTYPE}" in
        linux*)
            # shellcheck source=/dev/null
            source "${BW_SRC_DIR}"/linux.zsh
            ;;
        darwin*)
            # shellcheck source=/dev/null
            source "${BW_SRC_DIR}"/osx.zsh
            ;;
    esac

}

bw::cross::os

if [ "$(bw::has_fzf)" -eq 0 ]; then bw::fzf::install; fi
if [ "$(bw::has_node)" -eq 0 ]; then bw::node::install; fi
if [ "$(bw::has_yarn)" -eq 0 ]; then bw::yarn::install; fi

if [ "$(bw::has_bw_session)" -eq 0 ]; then
    message_warning "PLease add the value of BW_SESSION"
fi

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

zle -N fbw
bindkey '^Xk' fbw
