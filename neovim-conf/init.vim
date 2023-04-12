call vundle#begin('~/vim-plug')
Plugin 'rakr/vim-one'

Plugin 'rust-lang/rust.vim'
syntax enable
filetype plugin indent on

Plugin 'scrooloose/nerdtree'
map <silent> <tab> :NERDTreeToggle<cr>

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Chiel92/vim-autoformat'
map <silent> <C-A-l> :Autoformat<cr>

Plugin '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_no_updatetime = 1

call vundle#end()
"==========================================

" Press Space Search
map <space> /
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Atom One Light Theme
set background=light
try
	colorscheme one
catch
endtry

set autoindent

" Tab 4 Spaces
set shiftwidth=4
set tabstop=4
" Match Case
set ignorecase
" Show Line Number
set number
