let mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mode'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'rking/ag.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Valloric/YouCompleteMe'

set number
set expandtab
set ignorecase

syntax on
filetype plugin indent on

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" clipboard on os x
set clipboard=unnamed

" tabs
set shiftwidth=2

" rainbow parenthesis config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set t_Co=256
set background=light
colorscheme default

set splitbelow
set nowrap
