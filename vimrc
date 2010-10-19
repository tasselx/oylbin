" 不使用兼容vi的模式
set nocompatible

" 新建文件时使用的编码
set fileencoding=utf-8

" 打开文件时使用的编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5

" 自动检测文件类型
filetype plugin indent on

" 开启语法高亮
syntax on



if ! has("gui_running")
    set t_Co=256
endif

set background=dark
colorscheme peaksea

" When I close a tab, remove the buffer
set nohidden

" Since I use linux, I want this
"let g:clipbrdDefaultReg = '+'

" 更好的命令自动提示菜单
set wildmenu


" 显示标尺
set ruler

" 自动缩进 
set autoindent
set smartindent


" <TAB> 自动转换为4个空格
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" 不创建备份文件
set nobackup

" 搜索时边键入边搜索
set incsearch

" 高亮所有搜索匹配项
set hlsearch

" 忽略大小写
set ignorecase
set smartcase

set guifont=Yahei_Mono:h12:cGB2312
set backspace=2

set foldmethod=indent


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

" vimrc被修改时自动重新加载
autocmd! bufwritepost .vimrc source %

"ugly hack
let MyName=system("whoami | tr -d '\r\n'")
if MyName != 'hotel'
    map <left> gT
    map <right> gt
endif

let MyHost=system("hostname | tr -d '\r\n'")
if MyHost == 'oylbin-laptop'
    map <left> gT
    map <right> gt
endif



let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
   if g:paste_mode == 0
      set paste
      let g:paste_mode = 1
   else
      set nopaste
      let g:paste_mode = 0
   endif
   return
endfunc

" Paste Mode!  Dang! <F10>
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>



" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <tab> %
vnoremap <tab> %
nnoremap ; :

" 选中刚刚粘贴的行
nnoremap <leader>v V`]

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" 调用php 检查当前文件的语法
map <F5> : !php -l % <CR>

" 在新tab打开当前文件所在的目录
map <F6> :tabnew %:h<CR>
map <left> gT
map <right> gt

let mapleader=","
map <leader>f :tabnew<cr>:FufFile<cr>



map <leader>q :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>n :tabnew<space>
vmap <leader>c "+y
vmap <leader>x "+x
nnoremap <space> za
