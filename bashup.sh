#!/bin/bash

sed -i -e '/{{{BASHUP_START/,/BASHUP_END}}}/d' ~/.bashrc
cat >> ~/.bashrc <<EOF
#{{{BASHUP_START
if [ -f ~/.bashrc_std ] ; then
    . ~/.bashrc_std

    echo >&2 "=== ご連絡 ==="
    echo >&2 "~/.bashrc は $(date) にBASHUP SCRIPT に更新されました. "
    echo >&2 "~/.bashrc の BASHUP_START/END の中を構成してください。"
    echo >&2 "このメッセージは削除してしまってかまいません"
    echo >&2 ""

    # 使いたいモジュールのコメントアウトを開放してください。
    # _misc
    #_docker
    #_aws
    #_kubernetes
    #_openshift
    #_azure
    #_powerline
fi
#BASHUP_END}}}
EOF

curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashrc_std -sLo ~/.bashrc_std
