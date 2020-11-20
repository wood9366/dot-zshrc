# proxy
PROXY_VARS=('http_proxy' 'https_proxy')

function setproxy() {
	PROXY_PROTOCOL=${1:='socks5'}

    DEFAULT_PORT=1080

    if [ "$PROXY_PROTOCOL" = "socks5" ]; then
        DEFAULT_PORT=1086
    elif [ "$PROXY_PROTOCOL" = "http" ]; then
        DEFAULT_PORT=1087
    fi

    PROXY_PORT=${2:=$DEFAULT_PORT}

	for VAR in ${PROXY_VARS[@]}; do
		export $VAR=$PROXY_PROTOCOL://127.0.0.1:$PROXY_PORT
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

# unity
function unity() {
    op=$1
    op_create=0
    op_open=1

    case $op in
	create | open) ;;
	*) echo "E> invalid operation (create|open)"; return; ;;
    esac

    proj_dir=$2

    if [ -z $proj_dir ]; then
        echo "E> No Project $proj_dir";
        return
    fi

    echo "-> Unity Project: $proj_dir"

    proj_ver_file="$proj_dir/ProjectSettings/Projectversion.txt"
    ver="2019.1.14f1"

    if [ -e $proj_ver_file ]; then
        ver=$(cat $proj_ver_file | head -1 | cut -d ' ' -f 2)
        echo "-> Unity Version: $ver";
    else
        echo "-> Not Found Unity Version, Default: $ver"
    fi

    ver=${3:-"$ver"}

    unity_path="/Applications/Unity/Hub/Editor/$ver"

    if [ ! -e "$unity_path" ]; then
        unity_path="/Applications/Unity_$ver"

        if [ ! -e "$unity_path" ]; then
            unity_path=""
        fi
    fi

    if [ -z "$unity_path" ]; then
        echo "E> No Unity Version $unity_path"
        return 1
    fi

    target=${TARGET:-iOS}

    echo "-> Build Target: $target"

    TEMP="$HOME/temp"

    if [ ! -e "$TEMP" ]; then
        mkdir -p $TEMP
    fi

    case $op in
	open) nohup $unity_path/Unity.app/Contents/MacOS/Unity -buildTarget $target -projectPath $proj_dir > $TEMP/unity_$ver.log ;;
	create) nohup $unity_path/Unity.app/Contents/MacOS/Unity -buildTarget $target -createproject $proj_dir > $TEMP/unity_$ver.log ;;
    esac
}

function docker-machine-env() {
    if [ ! -z $DOCKER_MACHINE_NAME ]; then
        echo Docker Environment under $DOCKER_MACHINE_NAME
    fi
}

function docker-machine-env-reset() {
    unset DOCKER_TLS_VERIFY
    unset DOCKER_HOST
    unset DOCKER_CERT_PATH
    unset DOCKER_MACHINE_NAME
}
