" 不使用兼容vi的模式
set nocompatible

if has("unix")
    lang en_US.UTF-8
endif
language mes en_US.UTF-8
set langmenu=en_US.UTF-8

"set iskeyword=@,48-57,_,-,192-255,#
set iskeyword=@,48-57,_,192-255

filetype off
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
if has("unix")
    call pathogen#runtime_append_all_bundles()
endif

" 自动检测文件类型
filetype plugin indent on


" 新建文件时使用的编码
set fileencoding=utf-8

" 打开文件时使用的编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5


" 开启语法高亮
syntax on



set pastetoggle=<F2>

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
"set smartindent


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

nnoremap <leader><space> :noh<cr>

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

nnoremap <tab> %
vnoremap <tab> %

" 选中刚刚粘贴的行
nnoremap <leader>v V`]

"inoremap <Esc> <nop>
" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

au BufRead,BufNewFile *.mk		set ft=markdown

" 调用php 检查当前文件的语法
map <F5> :call Execute_Script()<CR>
map <leader>r :call Execute_Script()<CR>


function! Execute_Script()
    if &filetype == 'php'
        :w
        execute '!php %'
    elseif &filetype == 'python'
        :w
        execute '!python %'
    elseif &filetype == 'sh'
        :w
        execute '!bash -ex %'
    elseif &filetype == 'make'
        :w
        :make
    elseif &filetype == 'markdown'
        :w
        execute '!pandoc -f markdown -t html % > /tmp/markdown.html'
        execute '!open -a "Google Chrome.app" file:///tmp/markdown.html'
        "execute '!x-www-browser file:///tmp/markdown.html'
    endif
endfunction

map <F4> :Ack <C-R><C-W> .
map <F3> :grep <C-R><C-W> .

" 在新tab打开当前文件所在的目录
map <F6> :tabnew %:h<CR>
map <leader>o :tabnew %:h<CR>

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
map <C-H> gT
map <C-L> gt


map <left> gT
map <right> gt


autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"autocmd BufNewFile,Bufread *.php call Set_php_options()
autocmd filetype php call Set_php_options()
"syntax enable
"let g:php_folding=2
"set foldmethod=syntax
function! Set_php_options() 
    set keywordprg="help"
    map <leader>t :!phpunit %<cr>
    map <leader>T :!phpunit --filter <C-R><C-W> %<cr>
    map <leader>c :!php -l %<CR>
endfunction
let g:debuggerPort = 9001
map <S-Insert> "+p
inoremap <S-Insert> <esc>"+pa

nnoremap <leader><space> :noh<cr>

let g:html_indent_inctags = "html,body,head,tbody"

 
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')


set clipboard=unnamed
if &diff
    set background=dark
    colorscheme peaksea
else
    "set background=dark
    "colorscheme desert
endif

cmap w!! w !sudo tee % >/dev/null

au BufEnter /private/tmp/crontab.* setl backupcopy=yes
