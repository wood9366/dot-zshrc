DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/antigen-config.sh
$DIR/environment-config.sh

LOCAL_ZSHRC=$HOME/local.zsh
[ -f "$LOCAL_ZSHRC" ] && source "$LOCAL_ZSHRC"
