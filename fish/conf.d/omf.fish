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

#proxy 
export https_proxy="http://127.0.0.1:8889"

# path to ruby
set PATH /home/ispencer/.local/share/gem/ruby/3.0.0/bin $PATH
# path to bin
set PATH /home/ispencer/.local/bin $PATH

