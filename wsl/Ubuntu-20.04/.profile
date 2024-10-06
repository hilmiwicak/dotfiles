# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# launch tmux immediately before running other things
if [ -z "$TMUX" ]; then
  tmux new-session -A -s main
  exit 0
fi

# sudo edit to neovim
export SUDO_EDITOR="nvim"
# alias "sudoedit"='function _sudoedit(){ sudo -e "$1"; };_sudoedit'

# detaspace
export PATH="/home/wicak/.detaspace/bin:$PATH"

# aws
export PATH="$HOME/.local/bin/aws:$PATH"

# export UNCRUSTIFY_CONFIG="$HOME/.local/bin/mybin/formatter/uncrustify/build/config"
export UNCRUSTIFY_CONFIG="$HOME/.local/lib/formatter/uncrustify/build/config/uncrustify.cfg"

# laravel sail alias
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Flutter
export PATH="$HOME/.local/bin/flutter":$PATH
export PUB_CACHE="$HOME/.pub-cache"
# export PUB_CACHE="/mnt/c/Users/Hilmi/AppData/Local/Pub/Cache"

# jdk
export PATH="$HOME/.local/bin/jdk":$PATH

# android
export PATH="$HOME/.local/bin/android/platform-tools":$PATH
export PATH="$HOME/.local/bin/android/emulator/bin64":$PATH
export PATH="$HOME/.local/bin/android/emulator":$PATH
export PATH="$HOME/.local/bin/android/build-tools/30.0.3":$PATH
export PATH="$HOME/.local/bin/android/cmdline-tools":$PATH
export ANDROID_HOME="$HOME/.local/lib/android"
export WSL_HOST_IP="$(tail -1 /etc/resolv.conf | cut -d' ' -f2)"
export ADB_SERVER_SOCKET="tcp:$WSL_HOST_IP:5037"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# phpenv
export PHPENV_ROOT="$HOME/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
  export PATH="${PHPENV_ROOT}/bin:${PATH}"
  eval "$(phpenv init -)"
fi

# CARGO / RUST
source "$HOME/.cargo/env"

# NIM
export PATH="$HOME/.nimble/bin":$PATH

# GO
export PATH=/usr/local/go/bin:$PATH
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin":$PATH

# kubernetes stuffs (helm, istio)
export PATH="$HOME/.local/bin/kubernetes:$PATH"
export PATH="$HOME/.local/bin/kubernetes/istio/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# lsp bin ~ lsp local
export PATH="$HOME/.local/bin/mybin":$PATH
export PATH="$HOME/.local/bin/mybin/lsp":$PATH
export PATH="$HOME/.local/bin/mybin/formatter":$PATH

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi
