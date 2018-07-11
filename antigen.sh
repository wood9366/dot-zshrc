ANTIGEN_SCRIPT=$HOME/antigen.zsh

if [ ! -f ${ANTIGEN_SCRIPT} ]; then
    curl -L git.io/antigen > antigen.zsh
fi

source ${ANTIGEN_SCRIPT}

antigen use oh-my-zsh

antigen bundle git
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme robbyrussell

antigen apply
