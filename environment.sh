# common
export PATH=$HOME/scripts:$PATH

# home brew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# plenv
export PERL_BUILD_CPAN_MIRROR=http://mirrors.163.com/cpan/
export PATH="$HOME/.plenv/bin:$PATH"
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi

# cpanm
alias cpanm="cpanm --mirror http://mirrors.shu.edu.cn/CPAN/"

# proxy
proxy_vars=('ALL_PROXY' 'all_proxy')

function setproxy() {
	for var in ${proxy_vars[@]}; do
		export $var=socks5://127.0.0.1:1080
	done
}

function noproxy() {
	for var in ${proxy_vars[@]}; do
		unset $var
	done
}
