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
curl -sL https://raw.githubusercontent.com/TachikawaAkebonochoClub/dot/main/bashup.sh | bash -
```

- 自分固有・環境固有の設定は`~/.bashrc` に直接書きます。
- .bashrc を編集し、使いたい関数のコメントアウトを開放してください。
    ```
    # 使いたい関数のコメントアウトを開放してください。
    # _misc
    #_docker
    #_aws
    #_kubernetes
    #_openshift
    #_azure
    #_powerline
    ```
- 設定は次回ログイン以降から有効
― せっかちな人は
    ```bash
    exec bash
    ```

# Other CLI
## Terminal
### Powerline
- [justjanne/powerline-go: A beautiful and useful low-latency prompt for your shell, written in go](https://github.com/justjanne/powerline-go)

    ```bash
    LOCAL_BIN_DIR=~/.local/bin
    mkdir $DST -p
    curl -Lo $DST/powerline-go  https://github.com/justjanne/powerline-go/releases/latest/download/powerline-go-linux-amd64
    chmod +x  $DST/powerline-go
    ```

## Container
### docker
- docker engine => [Install Docker Engine | Docker Documentation](https://docs.docker.com/engine/install/)
- docker compose => [Install Docker Compose | Docker Documentation](https://docs.docker.com/compose/install/)

### kubernetes
- kubectl => [Install and Set Up kubectl on Linux | Kubernetes](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
    ```
    LOCAL_BIN_DIR=~/.local/bin
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    # move to => $ mv kubectl  $LOCAL_BIN_DIR/.

    ```

- kubecolor => [Colorize kubectl output by kubecolor | by Hidetatsu YAGINUMA | Medium](https://dty1er.medium.com/colorize-kubectl-output-by-kubecolor-2c222af3163a)
    ```console
    LOCAL_BIN_DIR=~/.local/bin
    curl -sL https://github.com/dty1er/kubecolor/releases/download/v0.0.20/kubecolor_0.0.20_Linux_x86_64.tar.gz | tar xzvf - kubecolor
    mv kubecolor  $LOCAL_BIN_DIR/.

    ```
- kubectx & kubens 
    - [ahmetb/kubectx: Faster way to switch between clusters and namespaces in kubectl > kubectx ](https://github.com/ahmetb/kubectx#installation)
    - Go Binary => [Releases · ahmetb/kubectx](https://github.com/ahmetb/kubectx/releases)


- kind => [kind – Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/#installing-from-release-binaries)
    ```console
    LOCAL_BIN_DIR=~/.local/bin
    curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
    chmod +x ./kind
    mv ./kind $LOCAL_BIN_DIR/kind

    ```
    
## Cloud
### AWS
### Azure
### Google Cloud 
