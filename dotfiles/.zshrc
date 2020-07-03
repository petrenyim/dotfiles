# Load Antigen
source /usr/bin/antigen.zsh

# # Load Antigen configurations
antigen init ~/.antigenrc

. /usr/bin/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.dotfiles/include ] && source ~/.dotfiles/include
