#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bw::has_bw_session {
    if [ -z "${BW_SESSION}" ]; then
        echo 0
        return
    fi
    echo 1
}

function bw::node::install {
    if ! type nvm > /dev/null; then
        message_warning "is Neccesary install nvm, please install antibody bundle luismayta/zsh-nvm branch:develop"
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
    if [ "$(bw::has_yarn)" -eq 1 ] && [ "$(bw::has_node)" -eq 1 ]; then
        echo 1
        return
    fi
    return
}


if [ "$(bw::has_bw_session)" -eq 0 ]; then
    message_warning "PLease add the value of BW_SESSION"
fi
if [ "$(bw::has_node)" -eq 0 ]; then bw::node::install; fi
if [ "$(bw::has_yarn)" -eq 0 ]; then bw::yarn::install; fi
