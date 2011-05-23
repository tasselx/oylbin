filetype off
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
if has("unix")
    call pathogen#runtime_append_all_bundles()
endif

" 自动检测文件类型
filetype plugin indent on

" 不使用兼容vi的模式
set nocompatible

" 新建文件时使用的编码
set fileencoding=utf-8

" 打开文件时使用的编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5


" 开启语法高亮
syntax on





" When I close a tab, remove the buffer
set nohidden

" Since I use linux, I want this
let g:clipbrdDefaultReg = '+'

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
"set smartcase

"set guifont=Yahei_Mono:h12:cGB2312
set backspace=2

"set foldmethod=indent


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




let mapleader=","

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <tab> %
vnoremap <tab> %

" 选中刚刚粘贴的行
nnoremap <leader>v V`]

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" 调用php 检查当前文件的语法
map <F5> :call Execute_Script()<CR>
function! Execute_Script()
    if &filetype == 'php'
        :w
        execute '!php %'
    elseif &filetype == 'python'
        :w
        execute '!python %'
    elseif &filetype == 'sh'
        :w
        execute '!bash -x %'
    endif
endfunction

map <F4> :Ack <C-R><C-W> .
map <F3> :grep <C-R><C-W> .

" 在新tab打开当前文件所在的目录
map <F6> :tabnew %:h<CR>

"map <leader>f :tabnew<cr>:FufFile<cr>
map <leader>f :FufFile<cr>



map <leader>q :q<cr>
nmap <leader>w :w!<cr>
nmap <leader>n :tabnew<space>
"vmap <leader>c "+y
"vmap <leader>x "+x
"map <leader>d :!screen bash -c "cd \"`pwd`\" && exec $SHELL --login"<cr>
nnoremap <space> :cn<cr>





map <leader>it O<CR><C-R>=strftime("%Y-%m-%d %H:%M")<CR><CR>
map <leader>id a<C-R>=strftime("%Y-%m-%d")<CR><Esc>


if has("unix")
    "ugly hack
    let MyName=system("whoami | tr -d '\r\n'")
    if MyName != 'hotel'
        map <left> gT
        map <right> gt
    endif

    let MyHost=system("hostname | tr -d '\r\n'")
    if MyHost == 'owen-laptop'
        map <left> gT
        map <right> gt
        if has("gui_running")
            set guifont=Monaco\ 10
        else
            set t_Co=256
        endif
        if &diff
            set background=dark
            colorscheme peaksea
        else
            set background=dark
            colorscheme peaksea
            "colorscheme desert
        endif
    endif
endif
if has("gui_running")
    colorscheme desert
    set go-=T
    set go-=m
endif



"autocmd BufNewFile,Bufread *.php call Set_php_options()
autocmd filetype php call Set_php_options()
"syntax enable
"let g:php_folding=2
"set foldmethod=syntax
function! Set_php_options() 
    set keywordprg="help"
    map <leader>t :!phpunit %<cr>
    map <leader>T :!phpunit --filter <C-R><C-W> %<cr>
    map <F7> :!php -l %<CR>
endfunction
