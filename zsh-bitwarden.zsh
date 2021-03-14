#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install bitwarden for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
ZSH_BITWARDEN_PATH=$(dirname "${0}")

# shellcheck source=/dev/null
source "${ZSH_BITWARDEN_PATH}"/config/main.zsh

# shellcheck source=/dev/null
source "${ZSH_BITWARDEN_PATH}"/internal/main.zsh

# shellcheck source=/dev/null
source "${ZSH_BITWARDEN_PATH}"/pkg/main.zsh

zle -N fbw
bindkey '^Xk' fbw
