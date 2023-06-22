# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# append to the history file, don't overwrite it
# shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) also HISTFILE
export HISTSIZE=99999
export HISTFILESIZE=100000
export HISTFILE=~/.bash_history

# removes duplicate entries from history
removeHistoryDuplicate() {
  tac $HISTFILE | awk '!x[$0]++' | tac > /tmp/bash_history
  mv /tmp/bash_history $HISTFILE
}

# export the function so it can be used in PROMPT_COMMAND
export -f removeHistoryDuplicate

# share history across sessions
# for now it's not working
# removeHistoryDuplicate runs on the next command
export PROMPT_COMMAND="history -a; history -c; history -r && removeHistoryDuplicate"

# custom prompt
PS1='\n\u | \s | \w | $(__git_ps1 "(%s)") \n\$ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
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

# print out settings directory
# ds() {
#   echo '/mnt/c/Users/Hilmi/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json'
#   echo '/mnt/c/Users/Hilmi/AppData/Local/SumatraPDF/SumatraPDF-settings.txt'
# }

# directory aliases
dh() {
  d /mnt/c/Users/Hilmi/$@
}

d1() {
  d /mnt/c/Users/Hilmi/dev-projects/$@
}

d2() {
  d /mnt/c/Users/Hilmi/Documents/Skripsi/$@
}

d3() {
  d /mnt/c/Users/Hilmi/code/$@
}

dx() {
  d /mnt/c/xampp/htdocs/$@
}

# custom for git completion
if [ -f "$HOME/.config/git/git-completion.bash" ]; then
  source "$HOME/.config/git/git-completion.bash"
fi

export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,alt-w:backward-kill-word'

# source keybind only if there is .fzf dir
if [ -d "$HOME/.config/fzf" ]; then
  if [ -f "$HOME/.config/fzf/keybind.bash" ]; then
    # export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --no-ignore-vcs --color=never -g "!{node_modules,vendor,.git}"'
    export FZF_CTRL_T_COMMAND='fd --type file --type directory --hidden --no-ignore --follow --exclude .git'
    export FZF_ALT_C_COMMAND='fd --type directory --hidden --no-ignore --follow --exclude .git'

    source "$HOME/.config/fzf/keybind.bash" 
  fi

  if [ -f "$HOME/.config/fzf/completion.bash" ]; then
    export FZF_COMPLETION_TRIGGER='@'

    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }

    # Advanced customization of fzf options via _fzf_comprun function
    # - The first argument to the function is the name of the command.
    # - You should make sure to pass the rest of the arguments to fzf.
    _fzf_comprun() {
      local command=$1
      shift

      case "$command" in
      d) fzf --preview 'tree -C {} | head -200' "$@" ;;
      export | unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
      ssh) fzf --preview 'dig {}' "$@" ;;
      *) fzf --preview 'bat -n --color=always {}' "$@" ;;
      esac
    }

    source "$HOME/.config/fzf/completion.bash" 

    _fzf_setup_completion dir d
    _fzf_setup_completion path pdfgrep rg trash-put tp trash-restore te trash-list tl trash-rm tr trash-empty td
  fi
fi

if ! [ -n "$TMUX" ]; then
  tmux new-session -A -s main
fi
