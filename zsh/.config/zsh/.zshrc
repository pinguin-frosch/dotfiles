# Opciones básicas
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob
zstyle :compinstall filename '${ZDOTDIR:-$HOME}/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit

# Prompt de la terminal
autoload -U colors && colors
PROMPT=" %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}\$vcs_info_msg_0_ "

# Integración git
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[magenta]%}%b%{$fg[blue]%})"

# Modo vim
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Exports
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin:$HOME/Programación/scripts
export EDITOR=nvim

# Aliases
alias ls="ls --color=auto"
alias g="git status"
alias inacapg="node $HOME/Programación/inacapi/index.js 'Gabriel Barrientos'"
alias inacapc="node $HOME/Programación/inacapi/index.js 'Charlotte Rodriguez'"
alias zshupdate="find ${ZDOTDIR:-$HOME}/.zsh_plugins -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull"

# Plugins
github_plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  hlissner/zsh-autopair
)
for plugin in $github_plugins; do
  if [[ ! -d ${ZDOTDIR:-$HOME}/.zsh_plugins/$plugin ]]; then
    mkdir -p ${ZDOTDIR:-$HOME}/.zsh_plugins/${plugin%/*}
    git clone --depth 1 --recursive https://github.com/$plugin.git ${ZDOTDIR:-$HOME}/.zsh_plugins/$plugin
  fi
  for initscript in ${plugin#*/}.zsh ${plugin#*/}.plugin.zsh ${plugin#*/}.sh; do
    if [[ -f ${ZDOTDIR:-$HOME}/.zsh_plugins/$plugin/$initscript ]]; then
      source ${ZDOTDIR:-$HOME}/.zsh_plugins/$plugin/$initscript
      break
    fi
  done
done
unset github_plugins
unset plugin
unset initscript

