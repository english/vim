let mapleader = ","

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-css-color'
Plugin 'dbext.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'guns/vim-clojure-highlight'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-slamhound'
Plugin 'hmarr/vim-gemfile'
Plugin 'honza/vim-snippets'
Plugin 'jgdavey/tslime.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junkblocker/patchreview-vim'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'moll/vim-node'
Plugin 'mtth/scratch.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'mxw/vim-jsx'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'ngmy/vim-rubocop'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'rizzatti/dash.vim'
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
Plugin 'venantius/vim-cljfmt'
Plugin 'vim-ruby/vim-ruby'

let g:clj_fmt_autosave = 0

" ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"

call vundle#end()

set number
set expandtab
set smartcase
set laststatus=2
set showtabline=2
set guioptions-=e
set textwidth=90
set colorcolumn=90
set splitbelow
set splitright
set hlsearch
set hidden

" clipboard on os x
" set clipboard=unnamed

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

" put swap files in one place
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//
set undodir=$HOME/.vim/undo//

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" set t_Co=256
set background=light
colorscheme solarized

" avoid Scratch.vim conflict with SplitJoin's gS
let g:scratch_no_mappings = 1

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.pde set filetype=java
" au BufNewFile,BufRead *.mustache,*.hogan,*.hulk,*.hjs,*.hbs set filetype=html.mustache syntax=mustache | runtime! ftplugin/mustache.vim ftplugin/mustache*.vim ftplugin/mustache/*.vim
au BufRead,BufNewFile *.cljx set filetype=clojure

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

" space to toggle fold
" nnoremap <Space> za

" no Ex mode
nnoremap Q <nop>

nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
let g:rspec_command = "Dispatch rspec {spec}"

nnoremap <Leader>sh :Slamhound<CR>
nnoremap <Leader>re :Require<CR>

let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop --auto-correct<CR>

" use jsx syntax highlighting on .js files
let g:jsx_ext_required = 0

" http://stackoverflow.com/questions/8890668/how-to-make-vim-detect-filetype-from-shebang-line
fun! s:DetectBabelNode()
  if getline(1) =~# '^#!.*/bin/env\s\+babel-node\>'
    set ft=javascript
  endif
endfun

autocmd BufNewFile,BufRead * call s:DetectBabelNode()

" See http://vimcasts.org/episodes/project-wide-find-and-replace/
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" connect to figwheel browser repl
command! Figwheel :Piggieback (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

" DBEXT plugin
let g:dbext_default_profile_ps = 'type=PGSQL:dbname=gc_paysvc_live'
let g:dbext_default_profile_gc = 'type=PGSQL:dbname=gc_live'
let g:dbext_default_profile_data = 'type=PGSQL:dbname=gc_global'
let g:dbext_default_profile = 'ps'
"

" experiment with speeding up vim with big ruby files
" https://github.com/vim/vim/issues/282
set re=1
set lazyredraw

nmap <Leader>ct :!ctags -R *<CR>

command! -nargs=0 RakeLogClear :silent !rake log:clear > /dev/null 2>&1 &

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

let g:tslime_always_current_session= 1
let g:tslime_always_current_window= 1

vmap <Leader>x <Plug>SendSelectionToTmux
nmap <Leader>x <Plug>NormalModeSendToTmux
nmap <Leader>v <Plug>SetTmuxVars
