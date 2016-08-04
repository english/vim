let mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'benmills/vimux'
Plugin 'dbext.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'hmarr/vim-gemfile'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ngmy/vim-rubocop'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'rking/ag.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-flagship'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rbenv.git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'tyru/open-browser-github.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'vim-ruby/vim-ruby'

call vundle#end()

set number
set expandtab
set smartcase
set laststatus=2
set showtabline=2
set guioptions-=e
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=lightgrey
set splitbelow
set splitright
set hlsearch
set hidden

" tabs
set shiftwidth=2

" set splitbelow
set diffopt+=vertical
set nowrap

set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*/node_modules/*,*/tmp/*,*/vendor/*,*.swp

" allow mouse use. just in case...
set mouse=a

" peristent undo
set undofile

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql', 'ruby']

" pretty print selected sql
vnoremap <Leader>sq :!python -c "import sys;import sqlparse; sys.stdout.write(sqlparse.format(sys.stdin.read(), reindent=True, keyword_case='upper'))"<CR>

" Convert a Ruby hash to JSON
vnoremap <Leader>hj :!ruby -rjson -e "puts JSON.pretty_generate(instance_eval(STDIN.read))"<CR>
vnoremap <Leader>jh :!ruby -rjson -rap -e "ap JSON.parse(STDIN.read, symbolize_names: true), index: false, indent: 2"<CR>

" map <Leader>so :source ~/.vimrc<CR>
nnoremap <Leader>dp :diffput<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dt :diffthis<CR>
nnoremap <Leader>do :diffoff<CR>
nnoremap <Leader>du :diffupdate<CR>
nnoremap <Leader>di :Dispatch 
nnoremap <Leader>bi :Dispatch bundle install<CR>
nnoremap <Leader>mi :Rake db:migrate db:test:prepare<CR>
nnoremap <Leader>ra :Rake<CR>

" no Ex mode
nnoremap Q <nop>

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop --auto-correct<CR>

" connect to figwheel browser repl
command! Figwheel :Piggieback (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -Q -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Vimux config
function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Select current paragraph and send it to tmux
nmap <Leader>vs vip<Leader>vs<CR>

" Open vimux runner. Will use existing Tmux pane if one is already open
nmap <Leader>vo :call VimuxOpenRunner()<CR>

" Have `cpp` work for scheme like in fireplace.vim, except via vimux
autocmd BufNewFile,BufRead *.scm nmap cpp vaf<Leader>vs<CR>(
