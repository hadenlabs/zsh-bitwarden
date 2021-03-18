#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function bitwarden::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_BITWARDEN_PATH}"/internal/linux.zsh
      ;;
    esac
    # shellcheck source=/dev/null
    source "${ZSH_BITWARDEN_PATH}"/internal/helper.zsh
}

bitwarden::internal::main::factory

if ! core::exists fzf; then core::install fzf; fi
if ! core::exists rsync; then core::install rsync; fi
if ! core::exists bw; then bitwarden::internal::bitwarden::install; fi
