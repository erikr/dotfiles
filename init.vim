let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
" "   - Vim (Linux/macOS): '~/.vim/plugged'
" "   - Vim (Windows): '~/vimfiles/plugged'
" "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" " You can specify a custom plugin directory by passing it as the argument
" "   - e.g. `call plug#begin('~/.vim/plugged')`
" "   - Avoid using standard Vim directory names like 'plugin'
"
" " Make sure you use single quotes

" vim-plug plugins
Plug 'altercation/vim-colors-solarized'
Plug 'djoshea/vim-autoread'
Plug 'ervandew/supertab'
Plug 'mtdl9/vim-log-highlighting'
Plug 'plasticboy/vim-markdown'
Plug 'ruanyl/vim-gh-line'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

syntax enable
set background=dark
colorscheme solarized

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Enable Python syntax highlighting
let g:python_highlight_all = 1

" Disable defaults from vim-ftplugin-python
let g:python_recommended_style = 0

let g:deoplete#enable_at_startup = 1

set nocompatible 

"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
"else
"    let &t_SI = "\e[5 q"
"    let &t_EI = "\e[2 q"
"endif

" Enable indentation guide by default
let g:indent_guides_enable_on_vim_startup = 1

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1 

" Let indentLine use current conceal options
let g:indentLine_conceallevel  = &conceallevel
let g:indentLine_concealcursor = &concealcursor

" Mouse
set mouse=a

" Clear highlighting on escape in normal mode
"nnoremap <esc> :noh<return><esc>

" needed so that vim still understands escape sequences
"nnoremap <esc>^[ <esc>^[

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Set linewidth
set textwidth=88

" Set column to signify length
set colorcolumn=88

" Highlight current line
set cursorline

" Automatic indentation for python code
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
"let mapleader="\"

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

" No tabs, and all tab chars become 4 space chars
set smarttab tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Highlight searches
set hlsearch

" Smart case
set ignorecase
set smartcase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

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

" Toggle paste mode
set pastetoggle=<F5>

" Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on

    " Treat dotfiles as .sh 
    autocmd BufNewFile,BufRead .aliases,.zshrc,.tmux.conf,.macos set syntax=sh

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

    "" Run Black on save.
    "autocmd BufWritePre *.py execute ':Black'
endif

" Run Black with F key
" nnoremap <F6> :Black<CR>
