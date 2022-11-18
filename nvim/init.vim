call plug#begin('~/.vim/plugged')

" 资源管理器 Ctrl + E 开启
Plug 'scrooloose/nerdtree'
map <silent> <C-e> :NERDTreeToggle<CR>

" 语法检查
Plug 'scrooloose/syntastic'

" 彩虹括号
Plug 'kien/rainbow_parentheses.vim'

" 美化状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2

" Rust支持
Plug 'rust-lang/rust.vim'

" 自动补全
Plug 'valloric/youcompleteme'
" gruvbox theme
Plug 'morhetz/gruvbox'

" 错误提示
Plug 'w0rp/ale'

call plug#end()

" 不与vi兼容
set nocompatible
" 使用utf-8
set encoding=utf-8
" 语法高亮
syntax enable
" 文件类型检查
filetype plugin indent on
" 高亮匹配的括号
set showmatch
" 高亮搜索匹配
set hlsearch
" 搜索时跳转
set incsearch
" 忽略大小写
set ignorecase
" 拼写检查
set spell spelllang=en_us
" 禁止换行
set nowrap
" 启用256色
set t_Co=256
" 显示当前的模式
set showmode
" 设置黑色背景
set background=dark
" 启用gruvbox主题
colorscheme gruvbox

" 显示相对行号
set relativenumber
" 显示行号
set number

" 开启剪切板
set clipboard=unnamed

" 解决退格键
set backspace=2

" 插入的tab换位空格
set tabstop=2
set expandtab
set shiftwidth=2

" 自动与上一行缩进
set autoindent

" 允许使用鼠标控制
set mouse=a

" 高亮当前行
set cursorline
highlight NERDTreeFile ctermfg=14

" 高亮所有搜索结果
set hlsearch
