#!/usr/bin/env bash

pdebug() {
    # shellcheck disable=SC2059
    if [[ ${DEBUG} =~ (on|1) ]] ; then
        printf "\r[ \033[00;34mDBUG\033[0m ] $1\n"
    fi
}

pinfo() {
    # shellcheck disable=SC2059
    printf "\r[ \033[00;34mINFO\033[0m ] $1\n"
}

puser() {
    # shellcheck disable=SC2059
    printf "\r[ \033[0;33mUSER\033[0m ] $1\n"
}

psuccess() {
    # shellcheck disable=SC2059
    printf "\r\033[2K[ \033[00;32m  OK\033[0m ] $1\n"
}

pwarn() {
    # shellcheck disable=SC2059
    printf "\r\033[2K[ \033[00;33mWARN\033[0m ] $1\n"
}

pfail() {
    # shellcheck disable=SC2059
    printf "\r\033[2K[ \033[0;31mFAIL\033[0m ] $1\n"
    echo ''
    exit
}

is_mac() {
    if [[ $(uname) == "Darwin" ]]; then
        return 0  # true
    else
        return 1  # false
    fi
}

is_ubuntu() {
    if [[ $(uname) == "Linux" ]] && [[ -n $(command -v apt-get) ]]; then
        return 0  # true
    else
        return 1  # false
    fi
}
