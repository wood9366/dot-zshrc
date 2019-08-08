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

# theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}'
    local user_symbol='%{$fg[red]%}#%{$reset_color%}'
else
    local user_host='%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}'
    local user_symbol='%{$fg[green]%}$%{$reset_color%}'
fi

local current_dir='%{$fg_bold[cyan]%}%~%{$reset_color%}'
local git_info='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${git_info}
╰─%B${user_symbol}%b "

RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
