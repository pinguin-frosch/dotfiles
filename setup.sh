#!/bin/env bash

usage() {
    echo -e "Usage: $0 [stow|unstow]\n"
    echo "stow:   create symlinks"
    echo "unstow: remove symlinks"
}

apply() {
    stow --target=$HOME "$1" x
    stow --target=$HOME/.ssh "$1" ssh
    stow --target=$XDG_CONFIG_HOME "$1" . --ignore="^ssh" --ignore="^x" --ignore="^setup.sh"
}

if [ $# -ne 1 ]; then
    usage
fi

if [[ $1 == "stow" ]]; then
    apply --stow
elif [[ $1 == "unstow" ]]; then
    apply --delete
else
    usage
fi
