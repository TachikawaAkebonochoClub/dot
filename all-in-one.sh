#!/bin/bash

LOCAL_BIN=${LOCAL_BIN:=~/.local/bin}

isExist(){ 
    type $1 &> /dev/null 
}

_kubernetes(){

    if ( ! isExist kubectl ) ; then
        curl -sL "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
            -o ${LOCAL_BIN}/kubectl
        chmod a+x ${LOCAL_BIN}/kubectl
    fi
    if ( ! isExist kubecolor ) ; then
        curl -sL https://github.com/dty1er/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz | tar xzv -C "$LOCAL_BIN" -f - kubecolor 
    fi

    if ( ! isExist kubectl-krew ) ; then
        (
          set -x; cd "$(mktemp -d)" &&
          OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
          ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
          KREW="krew-${OS}_${ARCH}" &&
          curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
          tar zxvf "${KREW}.tar.gz" &&
          ./"${KREW}" install krew
        )
    fi
}






_vim(){
    cd ~

     sed -i -e '/{{{VIM_START/,/VIM_END}}}/d' ~/.vimrc
    cat >> ~/.vimrc <<EOF
"{{{VIM_START
if filereadable(expand('~/.vimrc_std'))
    source ~/.vimrc_std
endif
"VIM_END}}}
EOF
    curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/vimrc_std -sLo ~/.vimrc_std
}

_bashrc(){
	cd ~
	curl -sL https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashup.sh | bash -
}
_powerline(){
    if ( ! isExist powerline-go )  ; then
        mkdir $DST -p
        curl -Lo $DST/powerline-go  https://github.com/justjanne/powerline-go/releases/latest/download/powerline-go-linux-amd64
        chmod +x  $DST/powerline-go
    fi
}   
_docker(){
        echo "comming soon"
}

_azure(){
        echo "comming soon"
}
_aws(){
        echo "comming soon"
}

usage (){
    cat <<EOF
usage: $0 funcs...

    funcs : 
        bashrc      -- update bashrc.(include .bashrc_std)
        vim         -- update vimrc.(include .vimrc_std)
        kubernetes  -- install k8s CLIs and alias, completions. (kubectl, kubecolor, krew)
        docker      -- CommingSooooon.
        azure       -- CommingSooooon.
        aws         -- CommingSooooon.

EOF
}

if [ $# -lt 1 ] ; then
    usage
    exit 1
fi

for a in $*
do
    case $a in 
    docker) _docker ;;
    kubernetes) _kubernetes;; 
    azure) _azure;;
    aws) _aws;;
    vim) _vim;;
    bashrc) _bashrc;;
    *) usage;;
    esac

done

