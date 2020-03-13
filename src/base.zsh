#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bw::has_bw_session {
    if [ -z "${BW_SESSION}" ]; then
        echo 0
        return
    fi
    echo 1
}

function bw::has_fzf {
    if ! type -p fzf > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function bw::has_node {
    if ! type -p node > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function bw::has_yarn {
    if ! type -p yarn > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function bw::has_dependences {
    if [ "$(bw::has_fzf)" -eq 1 ] && [ "$(bw::has_node)" -eq 1 ] && [ "$(bw::has_yarn)" -eq 1 ]; then
        echo 1
        return
    fi
    return
}

function bw::exist {
    if ! type -p bw > /dev/null; then
        echo 0
        return
    fi
    echo 1
}

function bw::node::install {
    if ! type nvm > /dev/null; then
        message_warning "${BW_MESSAGE_NVM}"
        return
    fi
    message_info "Install version of node"
    nvm install --lts
    nvm use --lts --default
    message_success "Install version of node"
}

function bw::yarn::install {
    message_info "Installing yarn"
    curl -o- -L https://yarnpkg.com/install.sh | bash
    message_success "Installed yarn"
}

function bw::fzf::install {
    if ! type -p brew > /dev/null; then
        message_warning "${BW_MESSAGE_BREW}"
        return
    fi
    message_info "Installing fzf"
    brew install fzf
    message_success "Installed fzf"
}
