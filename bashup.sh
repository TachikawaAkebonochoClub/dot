#!/bin/bash

sed -i -e '/{{{BASHUP_START/,/BASHUP_END}}}/d' ~/.bashrc
cat >> ~/.bashrc <<EOF
#{{{BASHUP_START
echo >&2 "=== ご連絡 ===　（このメッセージは削除してしまってかまいません）"
echo >&2 "この ~/.bashrc は $(date) にBASHUP SCRIPT に更新されました.  ~/.bashrc の BASHUP_START/END の中を構成してください。"
echo >&2 ""

if [ -f ~/.bashrc_std ] ; then
    . ~/.bashrc_std
    # 使いたいモジュールのコメントアウトを開放してください。 このブロックを BASHUP のカッコの外に移動すれば、上書きされなくなります。
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
