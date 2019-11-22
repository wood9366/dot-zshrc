# cpanm
alias cpanm="cpanm --mirror http://mirrors.shu.edu.cn/CPAN/"

# editor
VIM="/Applications/MacVim.app/Contents/MacOS/Vim"
EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"

alias vim=$VIM
alias vi=$VIM
alias emacs="$EMACS -nw"
alias gemacs=$EMACS

alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
