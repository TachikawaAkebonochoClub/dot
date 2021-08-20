## Vim
```bash
cd ~
cat >> ~/.vimrc <<EOF
if filereadable(expand('~/.vimrc_std'))
  source ~/.vimrc_std
endif
EOF
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/vimrc_std -sLO ~/.vimrc_std
```
- 自分固有・環境固有の設定は`~/.vimrc` に書きます


## Bash
工事中。使わないで。
```bash
cd ~
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashrc_std -sLO ~/.bashrc_std
cat >> ~/.bashrc <<EOF
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
EOF
```
- 自分固有・環境固有の設定は`~/.bashrc` に直接書きます。




