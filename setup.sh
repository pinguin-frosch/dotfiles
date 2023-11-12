#!/bin/env bash

usage() {
    echo -e "Usage: $0 [stow|unstow]\n"
    echo "stow:   create symlinks"
    echo "unstow: remove symlinks"
    exit
}

apply() {
    if [ ! -d "$HOME/.ssh" ]; then
        mkdir "$HOME/.ssh"
    fi
    stow --target=$HOME/.ssh "$1" ssh
    stow --target=${XDG_CONFIG_HOME:-$HOME/.config} "$1" . --ignore="^ssh" --ignore="^setup.sh"
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
