# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# share history across sessions
export PROMPT_COMMAND="history -a; history -c; history -r"
# export PROMPT_COMMAND="history -a; history -n"

# custom prompt
PS1="\n\u | \w\n> "

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=99999
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# xterm-256 color
# export TERM=xterm-256color

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# source fzf bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# tab auto complete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# advanced change directory
function d() {
  local hnum=16
  local new_dir index dir cnt

  # $# is showing how many arguments are there
  if ! [ $# -eq 0 ]; then
    if [[ $# -eq 2 && ($1 = "--" || $1 = "-c") ]]; then
      shift
    else
      if ! {
        [ $# -eq 1 ] && [[ $1 =~ ^(-[0-9]{,2}|-|--|-c|[^-].*)$ ]]
      }; then
        builtin cd "$@"
        return
      fi
    fi
  fi

  case "$1" in
  --)
    dirs -v
    return
    ;;
  -c)
    echo "cleaning dirs stack"
    dirs -c
    return
    ;;
  esac

  new_dir=${1:-$HOME}
  if [[ "$new_dir" =~ ^-[0-9]{,2}$ ]]; then
    index=${new_dir:1}
    if [ -z "$index" ]; then
      new_dir=$OLDPWD
    else
      new_dir=$(dirs -l +$index) || return
    fi
  fi
  pushd -- "$new_dir" >/dev/null || return
  popd -n +$hnum &>/dev/null || true
  new_dir=$PWD cnt=1
  while dir=$(dirs -l +$cnt 2>/dev/null); do
    if [ "$dir" = "$new_dir" ]; then
      popd -n +$cnt >/dev/null
      continue
    fi
    let cnt++
  done
}

# load additional ssh
eval "$(ssh-agent -s)" >> /dev/null
ssh-add ~/.ssh/id_rsa_github &> /dev/null
ssh-add ~/.ssh/id_rsa_gteam &> /dev/null

# print out settings directory
# ds() {
#   echo '/mnt/c/Users/Hilmi/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
#   echo '/mnt/c/Users/Hilmi/AppData/Local/SumatraPDF/SumatraPDF-settings.txt'
# }

# directory aliases
dh () {
  d /mnt/c/Users/Hilmi/$@
}

d1 () {
  d /mnt/c/Users/Hilmi/dev-projects/$@
}

d2 () {
  d /mnt/c/Users/Hilmi/Documents/Skripsi/$@
}

d3() {
  d /mnt/c/Users/Hilmi/code/$@
}

dx() {
  d /mnt/c/xampp/htdocs/$@
}
