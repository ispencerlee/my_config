# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
# make fish as vim 
fish_vi_key_bindings

# alias bind 
alias c='clear'
alias l='ls -a'
alias n='neofetch'
alias ra='ranger'
alias vim='nvim'

