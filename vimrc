let mapleader = ","

set nocompatible
filetype off

set number
set expandtab
set ignorecase
set laststatus=2
set colorcolumn=80

syntax on
filetype plugin indent on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" clipboard on os x
set clipboard=unnamed

" tabs
set shiftwidth=2

set splitbelow
set nowrap

Bundle "gmarik/vundle"
Bundle "tpope/vim-fugitive"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-dispatch"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-repeat"

Bundle "scrooloose/nerdtree"
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

Bundle "kchmck/vim-coffee-script"
Bundle "mustache/vim-mode"
Bundle "kien/ctrlp.vim"
Bundle "tpope/vim-surround"

" clojure
Bundle "tpope/vim-classpath"
Bundle "tpope/vim-fireplace"
Bundle "guns/vim-clojure-static"
Bundle "guns/vim-slamhound"
Bundle "luochen1990/rainbow"
let g:rainbow_active = 1

Bundle "altercation/vim-colors-solarized"
set t_Co=256
set background=light
colorscheme solarized

Bundle "mustache/vim-mustache-handlebars"
Bundle "rking/ag.vim"
Bundle "bronson/vim-trailing-whitespace"
Bundle "tpope/vim-endwise"
Bundle "jgdavey/tslime.vim"
Bundle "editorconfig/editorconfig-vim"
Bundle "leafgarland/typescript-vim"

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.pde set filetype=java

" pretty print selected json
map <Leader>j :!python -mjson.tool<CR>
