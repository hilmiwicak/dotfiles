# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# sudo edit to neovim
export SUDO_EDITOR="nvim"
alias "sudoedit"='function _sudoedit(){ sudo -e "$1"; };_sudoedit'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/.go"
export PATH=$PATH:"$GOPATH/bin"

# CARGO / RUST
source "$HOME/.cargo/env"

# NIM
export PATH="$HOME/.nimble/bin":$PATH

# nvm shenanigans
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# laravel sail alias
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# lsp bin ~ lsp local
export PATH=$PATH:"$HOME/.local/bin/mybin"
export PATH=$PATH:"$HOME/.local/bin/mybin/lsp"

# load additional ssh
eval "$(ssh-agent -s)" >> /dev/null
ssh-add ~/.ssh/id_rsa_github &> /dev/null
ssh-add ~/.ssh/id_rsa_gteam &> /dev/null

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi
