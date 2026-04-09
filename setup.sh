#!/usr/bin/env bash

usage() {
    echo -e "Usage: $0 [stow|unstow]\n"
    echo "stow:   create symlinks (adopts conflicts safely)"
    echo "unstow: remove symlinks"
    exit
}

apply() {
    stow --target=${XDG_CONFIG_HOME:-$HOME/.config} "$1" $2 . --ignore="^setup.sh" --ignore="^env.sh"
}

if [ $# -ne 1 ]; then
    usage
fi

if [[ $1 == "stow" ]]; then
    if ! git diff --quiet || ! git diff --cached --quiet; then
        echo -e "\033[1;31m[ERROR] Uncommitted changes detected in dotfiles repo!\033[0m"
        echo "stow --adopt combined with git restore will delete your uncommitted work."
        echo "Please commit or stash your changes before running this script."
        exit 1
    fi

    echo "==> Stowing and adopting conflicts..."
    apply --stow --adopt

    echo "==> Restoring repo state to discard adopted defaults..."
    git restore .
elif [[ $1 == "unstow" ]]; then
    echo "==> Removing symlinks..."
    apply --delete
else
    usage
fi
