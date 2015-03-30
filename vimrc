let mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rbenv.git'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-markdown'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
" Plugin 'derekwyatt/vim-scala'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'tmhedberg/matchit'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'venantius/vim-cljfmt'
" Plugin 'venantius/vim-eastwood'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-slamhound'
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
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-commentary'
Plugin 'derekwyatt/vim-scala'
Plugin 'junkblocker/patchreview-vim'
Plugin 'calebsmith/vim-lambdify'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-vinegar'

" ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"

call vundle#end()
filetype plugin indent on

set number
set expandtab
set ignorecase
set laststatus=2
set textwidth=90
set colorcolumn=90
set scrolloff=3
set splitbelow
set splitright

syntax on

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" clipboard on os x
" set clipboard=unnamed

" tabs
set shiftwidth=2

" set splitbelow
set diffopt+=vertical
set nowrap

set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*/node_modules/*,*/tmp/*,*/vendor/*,*.swp

" allow mouse use. just in case...
set mouse=a

" peristent undo
set undofile

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" set t_Co=256
set background=light
colorscheme solarized

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.pde set filetype=java
" au BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs,*.hbs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
au BufRead,BufNewFile *.cljx set filetype=clojure

" pretty print selected json
vnoremap <Leader>js :!python -mjson.tool \| sed "s/    /  /g"<CR>

" pretty print selected sql
vnoremap <Leader>sq :!python -c "import sys;import sqlparse;print sqlparse.format(sys.stdin.read(),  reindent=True, keyword_case='upper')"<CR>

" Convert a Ruby hash to JSON
vnoremap <Leader>hj :!ruby -e "require 'json'; puts JSON.pretty_generate(instance_eval(STDIN.read))"<CR>

" map <Leader>so :source ~/.vimrc<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dt :diffthis<CR>
nnoremap <Leader>do :diffoff<CR>
nnoremap <Leader>du :diffupdate<CR>
nnoremap <Leader>rc :Dispatch rubocop %<CR>
nnoremap <Leader>bi :Dispatch bundle install<CR>
nnoremap <Leader>mi :Rake db:migrate db:test:prepare<CR>
nnoremap <Leader>ra :Rake<CR>

" space to toggle fold
nnoremap <Space> za

" no Ex mode
nnoremap Q <nop>

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

nnoremap <Leader>sh :Slamhound<CR>
nnoremap <Leader>re :Require<CR>

" Connect to ClojureScript browser repl
command! Biggie :Piggieback 9000

" don't run clojure formatting on file save
" let g:clj_fmt_autosave = 0
