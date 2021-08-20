#!/bin/bash

sed -i -e '/{{{BASHUP_START/,/BASHUP_END}}}/d' ~/.bashrc
cat >> ~/.bashrc <<EOF
#{{{BASHUP_START
if [ -f ~/.bashrc_std ] ; then
    . ~/.bashrc_std

    # 使いたい関数のコメントアウトを開放してください。
    # _misc
    #_docker
    #_aws
    #_kubernetes
    #_openshift
    #_azure
fi
#BASHUP_END}}}
EOF

curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashrc_std -sLo ~/.bashrc_std
