# editor
VIM="/Applications/MacVim.app/Contents/MacOS/Vim"
EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"

if [ -e "$VIM" ]
then
    alias vim=$VIM
    alias vi=$VIM
fi

if [ -e "$EMACS" ]
then
    alias emacs="$EMACS -nw"
    alias gemacs=$EMACS
fi
