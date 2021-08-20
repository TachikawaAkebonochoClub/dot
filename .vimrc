"
" castle.test generic vimrc
" 
syntax enable
set autoindent
set expandtab
set nowrapscan
set nu
set shiftwidth=4
set showmatch
set showmode
set smartindent
set softtabstop=4
set tabstop=4
set incsearch

augroup fileTypeIndent
autocmd!
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.yml,*.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

syntax enable


if filereadable(expand('~/.vimrc_personal'))
  source ~/.vimrc_personal
endif

set background=dark
