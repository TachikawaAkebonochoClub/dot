#!/bin/bash

LOCAL_BIN=${LOCAL_BIN:=~/.local/bin}

isExist(){ 
    type $1 &> /dev/null 
}

standigBy(){
    echo "=============================================================="
    echo "Setup $*"
}
_kubernetes(){
    standigBy kubernetes
    
　　mkdir ${LOCAL_BIN} -p &> /dev/null
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
    if ( ! isExist kustomize ) ; then
        ( 
            cd $LOCAL_BIN ; 
            curl -sL "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  -o /tmp/wk.sh ;
	    bash /tmp/wk.sh $LOCAL_BIN;
	    rm -f /tmp/wk.sh
        )

    fi

}

_vim(){
    standigBy vim
    cd ~
    [ -f  ~/.vimrc ] && touch ~/.vimrc
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
    standigBy bashrc
	cd ~
	curl -sL https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashup.sh | bash -
}
_powerline(){
    standigBy powerline

    if ( ! isExist powerline-go )  ; then
        mkdir $LOCAL_BIN -p &> /dev/null

        curl -sLo $LOCAL_BIN/powerline-go  https://github.com/justjanne/powerline-go/releases/latest/download/powerline-go-linux-amd64
        chmod +x  $LOCAL_BIN/powerline-go
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
        powerline   -- install and setup powerline-go.
        docker      -- CommingSooooon.
        azure       -- CommingSooooon.
        aws         -- CommingSooooon.

EOF
}

ARGS="${ARGS:=$@}"
if [[ -z $ARGS ]] ; then
    usage
    exit 1
fi
echo "LOCAL_BIN=${LOCAL_BIN}" 

[[ -d $LOCAL_BIN ]]  || mkdir $LOCAL_BIN &> /dev/null
for a in $ARGS
do
    case $a in 
    docker) _docker ;;
    kubernetes) _kubernetes;; 
    azure) _azure;;
    aws) _aws;;
    vim) _vim;;
    bashrc) _bashrc;;
    powerline) _powerline;;
    *) usage;;
    esac

done

exec bash

