" Disable defaults from vim-ftplugin-python
let g:python_recommended_style = 0

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ervandew/supertab'
Plugin 'itchyny/lightline.vim'
Plugin 'djoshea/vim-autoread'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'ambv/black'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set lightline theme to solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Use the Solarized Dark theme
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

set t_Co=256


if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set linewidth at 80 char
set textwidth=80

" Set column to signify length
set colorcolumn=80

" Highlight current line
set cursorline

" Automatic indentation for python code
filetype indent plugin on
set autoindent

" Remove hidden characters
set nolist
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
"set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol

" Disable swap files and backups
set nobackup
set noswapfile

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Highlight current line
set cursorline

" No tabs, and all tab chars become 4 space chars
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Highlight searches
set hlsearch
" Smart case
set ignorecase
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Enable line numbers
set number
" " Use relative line numbers
" if exists("&relativenumber")
" 	set relativenumber
" 	au BufReadPost * set relativenumber
" endif

" Start scrolling three lines before the horizontal window border
"set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

    " Run Black on save.
    autocmd BufWritePre *.py execute ':Black'
endif

" Run Black with F9
nnoremap <F9> :Black<CR>