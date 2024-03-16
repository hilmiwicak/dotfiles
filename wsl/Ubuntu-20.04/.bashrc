# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# append to the history file, don't overwrite it
# shopt -s histappend

# expands dir names on variables
shopt -s direxpand

# load additional ssh
eval "$(ssh-agent -s)" >> /dev/null
ssh-add "$HOME/.ssh/id_rsa_github" &> /dev/null
trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k`' 0

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth:erasedups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1) also HISTFILE
export HISTSIZE=99999
export HISTFILESIZE=100000
export HISTFILE="$HOME/.bash_history"
export HISTIGNORE="jobs:fg*:l[als]:l[als] *:see *:* -h:* --help:man *:d -*:d-*:g[ls]:tmc:__*:exit"

# removes duplicate entries from history
__remove_history_duplicate__() {
  tac $HISTFILE | awk '!x[$0]++' | tac >/tmp/bash_history
  mv /tmp/bash_history $HISTFILE
}

# share history across sessions
# for now it's not working the way I wanted
# removeHistoryDuplicate runs on the next command
export PROMPT_COMMAND="history -a; history -c; history -r && __remove_history_duplicate__"

function __virtualenv_ps1() {
  # Get Virtual Env
  if [[ -n "$VIRTUAL_ENV" ]]; then
    # Strip out the path and just leave the env name
    venv="${VIRTUAL_ENV##*/}"
  else
    # In case you don't have one activated
    venv=''
  fi
  [[ -n "$venv" ]] && echo "(venv:$venv) "
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

# custom prompt
# PS1='\n\u | \s | \w | $(__git_ps1 "(%s)") \n\$ '
PS1="\n\w \$(__git_ps1 '(%s)') \$(__virtualenv_ps1) \n\$ "

# custom bindings
export INPUTRC="$HOME/.inputrc"
if [[ -n "$TMUX" && $- =~ i ]]; then
  bind "'\C-l': '\C-e\C-u\C-y\ey\C-u clear && tmux clear-history\C-m'"
  # bind "'\C-L': '\C-e\C-u\C-y\ey\C-u d -c && clear && tmux clear-history\C-m'"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) export color_prompt=yes ;;
esac

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f $HOME/.bash_aliases ]; then
  source "$HOME/.bash_aliases"
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

if [ -f "$HOME/.config/git/git-completion.bash" ]; then
  source "$HOME/.config/git/git-completion.bash"
fi

if command -v kubectl > /dev/null 2>&1; then
  source "$HOME/.config/kubectl/kubectl-completion.sh"
fi

export FZF_DEFAULT_OPTS='--bind alt-j:down,alt-k:up,alt-w:backward-kill-word'

if [ -d "$HOME/.config/fzf" ]; then
  if [ -f "$HOME/.config/fzf/keybind.bash" ]; then
    export FZF_CTRL_T_COMMAND='fd -tf -td -H -I -L -E .git -E node_modules -E vendor -E .venv -E .win-venv'
    # export FZF_CTRL_T_COMMAND='fd -tf -td -H -I -L -E .git'

    source "$HOME/.config/fzf/keybind.bash"
  fi

  if [ -f "$HOME/.config/fzf/completion.bash" ]; then
    export FZF_COMPLETION_TRIGGER='@'

    _fzf_compgen_path() {
      # fd -H -L -E ".git" -E "node_modules" -E "vendor" . "$1"
      fd -H -L -E ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      # fd -td -H -L -E ".git" -E "node_modules" -E "vendor" . "$1"
      fd -td -H -L -E ".git" . "$1"
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

    _fzf_setup_completion dir d ll ld la
    _fzf_setup_completion path bat batp batu batpu pdfgrep rg rgu wslpath
  fi
fi

# custom commands outside of bash alias, completion, etc
source "$HOME/.bash_custom"
