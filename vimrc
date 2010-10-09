set nocompatible

set fenc=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5
filetype on
filetype plugin indent on
syntax on
if ! has("gui_running")
    set t_Co=256
endif
set bg=dark
colorscheme peaksea

set ruler
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nobackup
set hlsearch
"set iskeyword+=33-47,58-64,91-96,123-128 
set guifont=Yahei_Mono:h12:cGB2312
set directory=$TEMP,$TMP,.
set backspace=2

set ignorecase

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <F5> : !php -l % <CR>
map <F6> :tabnew %:h<CR>

let mapleader=","
map <leader>f :tabnew<cr>:FufFile<cr>
"map <leader>c :cd %:h<cr><leader>f
map <leader>q :q<cr>
map <left> gT
map <right> gt
map <space> :
nmap <leader>w :w!<cr>
nmap <leader>n :tabnew<space>
vmap <leader>c "+y
vmap <leader>x "+x

" No sound on errors
set noerrorbells
"set novisualbell
set t_vb=

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd! bufwritepost .vimrc source %
