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

if ! type -p rsync > /dev/null; then bitwarden::internal::rync::install; fi
if ! type -p bw > /dev/null; then bitwarden::internal::bitwarden::install; fi
if ! type -p fzf > /dev/null; then bitwarden::internal::fzf::install; fi
if ! type -p yarn > /dev/null; then bitwarden::internal::yarn::install; fi
if ! type -p node > /dev/null; then bitwarden::internal::node::install; fi
