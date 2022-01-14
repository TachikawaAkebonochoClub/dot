#!/bin/bash

LOCAL_BIN=${LOCAL_BIN:=~/.local/bin}

_kubernetes(){
    curl -sL "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
        -o ${LOCAL_BIN}/kubectl
    chmod a+x ${LOCAL_BIN}/kubectl

    curl -sL https://github.com/dty1er/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz | tar xzv -C "$LOCAL_BIN" -f - kubecolor 
}





for a in $*
do

    case $a in 
    docker) _docker ;;
    kubernetes) _kubernetes;; 
    azure) _azure;;
    aws) _aws;;

done
