"===Plugin======================================================

call vundle#begin('~/vim-plug')
" Theme
Plugin 'joshdick/onedark.vim'

" Autocomplete
" Ctrl + N: Next | Ctrl + P: Prev | Enter: Confirm
Plugin 'neoclide/coc.nvim'
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
let g:coc_global_extensions=[
            \'coc-rust-analyzer',
            \'coc-toml',
            \'coc-tsserver',
            \'coc-translator',
            \]

" Language Support
Plugin 'rust-lang/rust.vim'
syntax on
filetype plugin indent on

" File Directory Tree
Plugin 'scrooloose/nerdtree'
nmap <silent> <Tab> :NERDTreeToggle<CR>
nmap <silent> <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Status Bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='papercolor'

" Format
Plugin 'sbdchd/neoformat'
map <silent> <C-A-l> :Neoformat<CR>

" Auto Save With 1 Second
Plugin '907th/vim-auto-save'
let g:auto_save = 1
let g:auto_save_silent = 1
let g:auto_save_no_updatetime = 1

" Git Wrapper
Plugin 'tpope/vim-fugitive'
" Git Show Diff
Plugin 'airblade/vim-gitgutter'
set updatetime=100
" Directory Tree Git Info
Plugin 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \'Modified'  :'✹',
            \'Staged'    :'✚',
            \'Untracked' :'✭',
            \'Renamed'   :'➜',
            \'Unmerged'  :'═',
            \'Deleted'   :'✖',
            \'Dirty'     :'✗',
            \'Ignored'   :'☒',
            \'Clean'     :'✔︎',
            \'Unknown'   :'?',
            \}

" Terminal
Plugin 'voldikss/vim-floaterm'
let g:floaterm_keymap_new = '<F7>'
let g:floaterm_keymap_prev = '<F8>'
let g:floaterm_keymap_next = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_keymap_kill = '<F10>'
if has('win64') || has('win32')
    let g:floaterm_shell='powershell'
endif

" Auto Pairs
Plugin 'jiangmiao/auto-pairs'

call vundle#end()

"===KeyMap=============================

" Move Between Windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
" Ctrl + Key Move
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <Left>
imap <C-l> <Right>
" Space Search
nmap <Space> /
" Shift Q = Quit
nmap <silent> <S-q> :q<CR>
" Enter = Start New Line
nmap <CR> o<Esc>
" ; = Command
nmap ; :
" Term Esc = Exit
tnoremap <Esc> <C-\><C-n>

"===Other========================================
try
    set background=dark
    colorscheme onedark
catch
endtry

set autoindent
set nowrap
" Tab 4 Spaces
set expandtab
set shiftwidth=4
set tabstop=4
" Match Case
set ignorecase
" Show Line Number
set number
" No Cache
set nobackup
set nowritebackup
set noswapfile
" Keep Line Separator
set noeol
