#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::pkg::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/pkg/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/pkg/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/pkg/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/pkg/helper.zsh

    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/pkg/alias.zsh
}

bitwarden::pkg::main::factory
