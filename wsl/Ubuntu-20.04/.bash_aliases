shopt -s expand_aliases
alias v='nvim'
alias tmxu='tmux'
alias tmu='tmux'

# open selected file / directory in default windows file explorer
alias see='/mnt/c/Windows/explorer.exe'

# cd to next
alias ncd='pushd +1 > /dev/null ;'

# cd to previous
alias pcd='pushd -0 > /dev/null ;'

# `cd -` equivalent when there is stack
alias bcd='{ pushd ${DIRSTACK[1]} ; popd -n +2 ; } > /dev/null ;'
