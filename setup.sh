#!/bin/env bash

usage() {
    echo -e "Usage: $0 [stow|unstow]\n"
    echo "stow:   create symlinks"
    echo "unstow: remove symlinks"
    exit
}

apply() {
    stow --target=${XDG_CONFIG_HOME:-$HOME/.config} "$1" . --ignore="^setup.sh" --ignore="^env.sh"
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
