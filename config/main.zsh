#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/config/linux.zsh
      ;;
    esac
}

bitwarden::config::main::factory
