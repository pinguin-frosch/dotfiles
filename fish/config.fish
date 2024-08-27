export $(envsubst < /home/gabriel/Programming/dotfiles/env.sh)
set -g fish_greeting
fish_vi_key_bindings
abbr --add g 'git status'
pyenv init - | source
