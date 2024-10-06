shopt -s expand_aliases

alias thop='htop'

alias d..='d ..'
alias d--='d --'
alias d-='d -'
alias d-c='d -c'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='rg -p'
alias rgu='rg --color never --no-heading -N'

alias less='less -i'

alias batu='bat -p'
alias batp='bat --paging=never'
alias batpu='bat -pp'

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias ld='ls -d */ .*/ --color=auto'

alias g='git'
alias gs='git status'
alias gl='git lg'

# alias tmc='clear && tmux clear-history'
alias tmc='d -c && clear && tmux clear-history'

# open selected file / directory in default windows file explorer
alias see='/mnt/c/Windows/explorer.exe'
# alias wyi='win32yank.exe -i --crlf'
# alias wyo='win32yank.exe -o --lf'

function __nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim "$@"
  else
    command nvim "$@"
  fi
}
alias nvim='__nvimvenv'
alias nv='nvim'
alias vi='nvim -u NONE -i NONE -n --cmd "source ~/.config/nvim/lua/core/options.lua" --cmd "source ~/.config/nvim/lua/core/keymap.lua"'

alias k='kubectl'

alias subl='/mnt/c/Program\ Files/Sublime\ Text/subl.exe'
alias minikube='/mnt/c/Program\ Files/Kubernetes/Minikube/minikube.exe'
