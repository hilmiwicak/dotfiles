shopt -s expand_aliases

alias d..='d ..'
alias d--='d --'
alias d-='d -'
alias d-c='d -c'
alias d-1='d -1'
alias d-2='d -2'
alias d-3='d -3'
alias d-4='d -4'
alias d-5='d -5'
alias d-6='d -6'
alias d-7='d -7'
alias d-8='d -8'
alias d-9='d -9'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='rg -p'

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias ld='ls -d */ .*/ --color=auto'

alias g='git'
alias gs='git status'
alias gl='git lg'

alias tm='tmux'
alias tmn='tmux new -s prog'
alias tma='tmux a'
alias tmc='clear && tmux clear-history'
alias tmcc='d -c && clear && tmux clear-history'

# open selected file / directory in default windows file explorer
alias see='/mnt/c/Windows/explorer.exe'
alias wyi='win32yank.exe -i --crlf'
alias wyo='win32yank.exe -o --lf'

function __nvimvenv {
  if [[ -e "$VIRTUAL_ENV" && -f "$VIRTUAL_ENV/bin/activate" ]]; then
    source "$VIRTUAL_ENV/bin/activate"
    command nvim "$@"
    deactivate
  else
    command nvim "$@"
  fi
}

alias nvim='__nvimvenv'
alias nv='nvim'
alias vi='nvim -u NONE -i NONE -n'
alias subl='/mnt/c/Program\ Files/Sublime\ Text/subl.exe'
