set nocompatible

set fenc=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5
filetype on
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
filetype plugin indent on
syntax on
if ! has("gui_running")
    set t_Co=256
endif
set bg=dark
colorscheme peaksea

" When I close a tab, remove the buffer
set nohidden

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>

" Since I use linux, I want this
"let g:clipbrdDefaultReg = '+'



set wildmenu
set incsearch
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
nnoremap <space> za
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

