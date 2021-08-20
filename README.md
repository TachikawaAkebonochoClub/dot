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

fi
EOF
```




