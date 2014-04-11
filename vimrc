set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'vundle'
Bundle 'vim-airline'
"Bundle 'vim-gitgutter'
filetype plugin indent on

:syntax on
set laststatus=2        "always show the status line

set shiftwidth=4 tabstop=4 softtabstop=4 expandtab shiftround
set autoindent          " always set autoindenting on

" Escape clears previous search highlighting
"nnoremap <esc> :noh<return><esc>

"disable search highlighting
set hls!

" F5 toggles paste mode (disables autoindent)
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode
":set tw=79     "auto-wrap inside 80chars

" use ack for grepping inside vim
set grepprg=ack\ -a

" Make vimsplits easier to navigate
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

iab pdbg  use Data::Dumper 'Dumper'; $Data::Dumper::Maxdepth=3; warn Dumper [ ];

" Template toolkit syntax highlighting
au BufNewFile,BufRead *.{tt,ttml,html,ttm,htm} setf tt2html
au BufNewFile,BufRead *template*/* setf tt2html

" Yaml
au BufNewFile,BufRead *.yaml,*.yml    setf yaml
