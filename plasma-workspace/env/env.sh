# Variables XDG
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Variables para ordenar un poco $HOME
export ANDROID_HOME=$XDG_DATA_HOME/android
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export GOPATH=$XDG_DATA_HOME/go
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export R_ENVIRON_USER=$XDG_CONFIG_HOME/R/Renviron
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# Variables de entorno
export EDITOR=nvim
export PATH=$PYENV_ROOT/bin:$HOME/.local/bin:$GOPATH/bin:$CARGO_HOME/bin:$PATH
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
