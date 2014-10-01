let mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv.git'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
" Plugin 'derekwyatt/vim-scala'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'tmhedberg/matchit'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
" Plugin 'dgrnbrg/vim-redl'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-slamhound'
" Plugin 'vim-scripts/paredit.vim'
Plugin 'luochen1990/rainbow'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rking/ag.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-endwise'
Plugin 'jgdavey/tslime.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'godlygeek/tabular'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'rizzatti/dash.vim'
Plugin 'AndrewRadev/splitjoin.vim'
" Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

set number
set expandtab
set ignorecase
set laststatus=2
set colorcolumn=80
set scrolloff=5

syntax on
filetype plugin indent on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" clipboard on os x
set clipboard=unnamed

" tabs
set shiftwidth=2

set splitbelow
set diffopt+=vertical
set nowrap

" have NERDTree and CTRLP ignore directories
set wildignore+=*/node_modules/*,*/tmp/*,*/vendor/*

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"
" let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

map <Leader>sh :Slamhound<CR>
" let g:rainbow_active = 1

set t_Co=256
set background=dark
colorscheme solarized

" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.pde set filetype=java
" au BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs,*.hbs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim

" pretty print selected json
map <Leader>js :!python -mjson.tool<CR>
map <Leader>sp :s/    /  /g<CR>

" pretty print selected sql
map <Leader>sq :!python -c "import sys;import sqlparse;print sqlparse.format(sys.stdin.read(),  reindent=True, keyword_case='upper')"<CR>

" map <Leader>so :source ~/.vimrc<CR>
map <Leader>dp :diffput<CR>
map <Leader>dg :diffget<CR>
map <Leader>dt :diffthis<CR>
map <Leader>do :diffoff<CR>
map <Leader>du :diffupdate<CR>
map <Leader>rc :Dispatch rubocop %<CR>
" map <Leader>rs :Dispatch rspec %<CR>
map <Leader>bi :Dispatch bundle install<CR>
map <Leader>mi :Rake db:migrate db:test:prepare<CR>
map <Leader>ra :Rake<CR>
map <Leader>gp :Git push<CR>
" space to toggle fold
map <Space> za

" no Ex mode
nnoremap Q <nop>

set mouse=a

" Backup and swap files
set backupdir=~/.vim/
set directory=~/.vim/
