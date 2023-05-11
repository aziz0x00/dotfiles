function mkcd --description='Make a directory and cd to it'
    mkdir -p "$argv[1]" && \
    cd "$argv[1]" || return
    pwd
end

function cdt --description='Make a temp directory and cd to it'
    cd "$(mktemp -d)"
    pwd
end
