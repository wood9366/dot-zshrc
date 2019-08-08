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

# docker tag
docker () {
    if [[ "${1}" = "tags" ]]; then
        docker_tag_search $2
    else
        command docker $@
    fi
}

docker_tag_search () {
    # Display help
    if [[ "${1}" == "" ]]; then
        echo "Usage: docker tags repo/image"
        echo "       docker tags image"
        return
    fi

    # Full repo/image was supplied
    if [[ $1 == *"/"* ]]; then
        name=$1

        # Only image was supplied, default to library/image
    else
        name=library/${1}
    fi
    printf "Searching tags for ${name}"

    # Fetch all pages, because the only endpoint supporting pagination params
    # appears to be tags/lists, but that needs authorization
    results=""
    i=0
    has_more=0
    while [ $has_more -eq 0 ]  
    do  
        i=$((i+1))
        result=$(curl "https://registry.docker-cn.com/v2/repositories/${name}/tags/?page=${i}" 2>/dev/null | docker run -i jannis/jq -r '."results"[]["name"]' 2>/dev/null)
        has_more=$?
        if [[ ! -z "${result// }" ]]; then results="${results}\n${result}"; fi
        printf "."
    done  
    printf "\n"

    # Sort all tags
    sorted=$(
        for tag in "${results}"; do
            echo $tag
        done | sort
          )

    # Print all tags
    for tag in "${sorted[@]}"; do
        echo $tag
    done
}

# generate password
genpasswd() {
    pwgen -Bs $1 ${2:-1} | pbcopy;
    pbpaste > ~/pass/${3:-prev};
    pbpaste;
}
