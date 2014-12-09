execute pathogen#infect()

set nocompatible 	" Make Vim more useful "
syntax on
filetype plugin indent on

set history=1000 	" remember more commands "
set wildmenu  		" Enhance command-line completion"
set shell=bash
set nu 	 			" Enable line numbers"

set autoindent
set ruler 			" Show cursor position at all times"
set showcmd			" Display incomplete commands"
set numberwidth=4
set wrap
set showmatch
set incsearch
set showtabline=2

let mapleader=","

" Color theme setup"
" set background=dark
:color github
" let g:solarized_termtrans=1

if has("autocmd")
  autocmd BufRead,BufNewFile *.go set filetype=go sts=2 sw=2 ts=2 autoread
  autocmd BufRead,BufNewFile *.md,*.markdown set filetype=md autoread
  autocmd BufRead,BufNewFile *.html,*.hb,*.us,*.erb set filetype=html autoread
  autocmd BufRead,BufNewFile *.feature set filetype=gherkin autoread
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
  autocmd BufNewFile,BufRead *.js set filetype=javascript

  au! Syntax gherkin source ~/.vim/syntax/cucumber.vim

  autocmd FileType go au BufWritePre <buffer> Fmt
  let g:gofmt_command = "goimports"

  autocmd FileType text setlocal spell textwidth=78
  autocmd FileType ruby,yaml,javascript,erb,html,gherkin,coffee set autoindent expandtab sts=2 sw=2 ts=2
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd Filetype css setlocal autoindent expandtab sts=2 sw=2 ts=2 autoread
  autocmd Filetype java setlocal autoindent expandtab sts=4 sw=4 ts=4 autoread
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif
