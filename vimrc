set nocompatible
filetype off
set noshowmode

" map Ctrl-K to Esc
imap <C-K> <Esc>

" allow system clipboard
set clipboard=unnamed

filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" The bundles you install will be listed here
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-sort-motion'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-system-copy'
Plugin 'kana/vim-textobj-user'
Plugin 'rbonvall/vim-textobj-latex'
Plugin 'kana/vim-textobj-entire'
Plugin 'lervag/vimtex'
Plugin 'cypok/vim-sml'
Plugin 'rstacruz/sparkup'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'flrnprz/plastic.vim'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'kristijanhusak/vim-hybrid-material'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" _______________________________________________________________________
" The rest of your config follows here

" make backspace work like most other apps
set backspace=2

"shows horizontal and vertical line where the cursor is in the file
set cursorline cursorcolumn

"linebreaks after long line are indented correctly
set wrap
set breakindent

"sets character encoding
set encoding=utf8

" set linenumbers
set relativenumber
set number

"show syntax
syntax enable

"enable filetype detection
filetype on
filetype plugin on
filetype indent on

"enable mouse usage in GUI
if has("gui_running")
    set mouse=a
    else
        set mouse=
        endif

set t_Co=256

" disable creating of all sort of swapfiles
set nobackup
set nowb
set noswapfile

" This enables automatic indentation as you type.
set tabstop=4

" i want to see at least x lines above/below the cursor
set scrolloff=10

set history=999
set hlsearch
set showmatch

"shows number of columns and lines in powerbar
set ruler

"sets width for shifting with >> or << and tablength and converts tab to
"spaces
set shiftwidth=4
set tabstop=4
set expandtab

"set colourscheme
set background=dark
set t_Co=16
"colorscheme molokai_dark
"colorscheme plastic
colorscheme material-monokai

" __________________________________ PLUGIN SETTINGS ______________________________________
"=> Airline setup 
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
" "let g:airline#extensions#tabline#enabled = 1
" fancy powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='angr' "angr
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"disableing showing of trailing in current file
let g:airline#extensions#whitespace#show_message = 0

" => NERDTree setup
"""""""""""""""""""""""""""""
" toggle NerdTree
map <F2> :NERDTreeToggle<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator
" modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" [M            Jump on previous class or method (normal, visual, operator
"modes)
" ]M            Jump on next class or method (normal, visual, operator
"modes)
"let g:pymode_rope = 1

" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

"Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
"let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
"let g:pymode_folding = 0
