#!/usr/bin/env ksh

function get_path {
    path::remove_duplicate
}

function path::remove_duplicate {
    # Remove duplicate entries from PATH:
    echo -n "${PATH}" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}'
}

function path::append {
    [ -e "${1}" ] && export PATH="${PATH}:$1"
    PATH="$(path::remove_duplicate)"
}

function path::prepend {
    [ -e "${1}" ] && export PATH="${1}:${PATH}"
    PATH="$(path::remove_duplicate)"
}
