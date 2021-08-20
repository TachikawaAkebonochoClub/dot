## Vim
```bash
cd ~
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/.vimrc -sLO ~/.vimrc
```

## Bash
工事中。使わないで。
```
cd ~
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/.bashrc_personal -sLO ~/.bashrc_personal
cat >> ~/.bashrc <<EOF
if [ -f ~/.bashrc_personal ] ; then
    . ~/.bashrc_personal

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




