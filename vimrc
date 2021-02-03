let mapleader = " "

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'benmills/vimux'
Plug 'fatih/vim-go'
Plug 'gmarik/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user', { 'for': 'ruby' }
Plug 'kassio/neoterm'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser.vim'
Plug 'vim-airline/vim-airline'

call plug#end()

set number
set expandtab
set smartcase
set laststatus=2
set showtabline=2
set guioptions-=e
set textwidth=100
set colorcolumn=+1
set cursorline
highlight ColorColumn ctermbg=lightgrey
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

set backupdir=/tmp
set undodir=/tmp

au BufRead,BufNewFile *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql', 'ruby']

" pretty print selected sql
vnoremap <Leader>sq :!python -c "import sys;import sqlparse; sys.stdout.write(sqlparse.format(sys.stdin.read(), reindent=True, keyword_case='upper'))"<CR>

" Convert a Ruby hash to JSON
vnoremap <Leader>hj :!ruby -rjson -e "puts JSON.pretty_generate(instance_eval(STDIN.read))"<CR>
vnoremap <Leader>jh :!ruby -rjson -rap -e "ap JSON.parse(STDIN.read, symbolize_names: true), index: false, indent: 2"<CR>

nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

if !has('nvim')
  set macligatures
endif

" set guifont=Fira\ Code:h12

autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal spell
set complete+=kspell

" fzf config
let g:fzf_tags_command = 'ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extra=+f'

map <silent> <leader>ff :Files<CR>
map <silent> <leader>fg :GFiles<CR>
map <silent> <leader>fb :Buffers<CR>
map <silent> <leader>ft :Tags<CR>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" eval current line as ruby and print result on following line
nmap <Leader>rb yyp!!ruby -e 'puts "\# => \#{eval(STDIN.read)}"'<CR>

"" seeing is believing https://github.com/JoshCheek/seeing_is_believing/wiki/Editor-Integration
" Annotate marked lines
nmap <Leader>n :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
" RemoLe annotations
nmap <Leader>c :%.!seeing_is_believing --clean<CR>;
" MarkLthe current line for annotation
nmap <Leader>m A # => <Esc>
" MarkLthe highlighted lines for annotation
vmap <Leader>m :norm A # => <Esc>

" use ripgrep (`rg`) instead of built-in grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
endif

" neoterm
let g:neoterm_repl_ruby = "./bin/console"
let g:neoterm_keep_term_open = 1
let g:neoterm_mod = "botright"
" let g:neoterm_size = 10
" let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1

" Use gx{text-object} in normal mode
nmap gx <Plug>(neoterm-repl-send)

" Send selected contents in visual mode.
xmap gx <Plug>(neoterm-repl-send)

" Send current line in visual mode.
nmap gxx <Plug>(neoterm-repl-send-line)

" colors
set termguicolors
let g:onedark_terminal_italics = 1
colorscheme onedark
let g:airline_theme='onedark'

" go
autocmd FileType go setlocal tabstop=2 shiftwidth=2 softtabstop=2
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']

" stolen from https://github.com/snoe/dotfiles/blob/master/home/.vimrc
" COC
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <leader>u <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" command! -nargs=0 Format :call CocAction('format')

" let g:coc_enable_locationlist = 0
" autocmd User CocLocationsChange CocList --normal location

" inoremap <silent><expr> <c-space> coc#refresh()
" nmap <silent> [l <Plug>(coc-diagnostic-prev)
" nmap <silent> ]l <Plug>(coc-diagnostic-next)
" nmap <silent> [k :CocPrev<cr>
" nmap <silent> ]k :CocNext<cr>
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" function! Expand(exp) abort
"     let l:result = expand(a:exp)
"     return l:result ==# '' ? '' : "file://" . l:result
" endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" vmap <leader>f <Plug>(coc-format-selected)
" nmap <leader>f <Plug>(coc-format-selected)

" nnoremap <silent> crcc :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'cycle-coll', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crth :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crtt :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crtf :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-first-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crtl :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'thread-last-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> cruw :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-thread', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crua :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'unwind-all', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crml :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'move-to-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
" nnoremap <silent> cril :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'introduce-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Binding name: ')]})<CR>
" nnoremap <silent> crel :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'expand-let', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> cram :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'add-missing-libspec', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> crcn :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'clean-ns', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1]})<CR>
" nnoremap <silent> cref :call CocRequest('clojure-lsp', 'workspace/executeCommand', {'command': 'extract-function', 'arguments': [Expand('%:p'), line('.') - 1, col('.') - 1, input('Function name: ')]})<CR>

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" autocmd BufReadCmd,FileReadCmd,SourceCmd jar:file://* call s:LoadClojureContent(expand("<amatch>"))
" function! s:LoadClojureContent(uri)
"   setfiletype clojure
"   let content = CocRequest('clojure-lsp', 'clojure/dependencyContents', {'uri': a:uri})
"   call setline(1, split(content, "\n"))
"   setl nomodified
"   setl readonly
" endfunction
