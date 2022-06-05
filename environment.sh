
# common
export PATH="/usr/local/opt/openjdk/bin:/usr/local/sbin:$PATH"

if [ -e "$HOME/.emacs.d/bin" ]
then
    export PATH=$PATH:$HOME/.emacs.d/bin
fi

if [ -e "$HOME/.roswell/bin" ]
then
    export PATH="$HOME/.roswell/bin:$PATH"
fi

# homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# cpanm
export PERL_CPANM_OPT="--mirror http://mirrors.163.com/cpan/"

# luaver
if which luaver > /dev/null; then . $(which luaver); fi

# nodenv
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# plenv
export PERL_BUILD_CPAN_MIRROR=http://mirrors.163.com/cpan/
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

# pyenv
if which pyenv > /dev/null
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)";
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# electron
export ELECTRON_MIRROR="https://npm.taobao.org/mirrors/electron/"

# dotnet
export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"
export PATH="$PATH:$HOME/.dotnet/tools"

# charset to utf8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

TERM=xterm-256color

export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
