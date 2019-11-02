
# common
export PATH=$HOME/scripts:$HOME/bin:$PATH

# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles

# nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# plenv
export PERL_BUILD_CPAN_MIRROR=http://mirrors.163.com/cpan/
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# charset to utf8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

TERM=xterm-256color
