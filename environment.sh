# common
export PATH=$HOME/scripts:$PATH

# home brew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# plenv
export PERL_BUILD_CPAN_MIRROR=http://mirrors.163.com/cpan/
export PATH="$HOME/.plenv/bin:$PATH"
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi

# proxy
PROXY_VARS=('ALL_PROXY' 'all_proxy')

function setproxy() {
	PROXY_PORT=${1:=1080}
	for VAR in ${PROXY_VARS[@]}; do
		export $VAR=socks5://127.0.0.1:$PROXY_PORT
	done
}

function noproxy() {
	for VAR in ${PROXY_VARS[@]}; do
		unset $VAR
	done
}
