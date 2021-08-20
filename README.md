# 目的
- 新しいホストに　 vimrc とか bashrc　とかをコピペするのがメンドい
- 基本的な設定は、みんなで共有したほうがいいかな

## お願い
- 普遍的な設定とかはここを更新してください

# dotファイルたち
## Vim
```bash
cd ~
cat >> ~/.vimrc <<EOF
if filereadable(expand('~/.vimrc_std'))
  source ~/.vimrc_std
endif
EOF
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/vimrc_std -sLo ~/.vimrc_std
```
- 自分固有・環境固有の設定は`~/.vimrc` に書きます
- fileType 毎の設定は追加してください


## Bash

```bash
cd ~
curl https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashrc_std -sLo ~/.bashrc_std
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
- .bashrc を編集し使いたい関数のコメントアウトを開放してください。
- 設定は次回ログイン以降から有効
― せっかちな人は
    ```bash
    exec bash
    ```


