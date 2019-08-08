DOTZSH=$HOME/.dot-zshrc

source $DOTZSH/antigen.sh
source $DOTZSH/alias.sh
source $DOTZSH/environment.sh

LOCAL_ZSHRC=$HOME/local.zsh
[ -f "$LOCAL_ZSHRC" ] && source "$LOCAL_ZSHRC"