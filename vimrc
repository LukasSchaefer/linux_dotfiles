" Starts vim in non-vi mode
set nocompatible

" Disable search highlighting
set nohlsearch
" Enable incremental search
set incsearch

" Ignore casing when searching unless..
set ignorecase
" Intentionally searches for upper letters
set smartcase

" set leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "

filetype off
set noshowmode

" map Ctrl-K to Esc
imap <C-K> <Esc>

" allow system clipboard
" set clipboard=unnamedplus

" make Y yank cursor till end of line, matching D and C logic
nnoremap Y y$

" make backspace work like most other apps
set backspace=2

" shows horizontal and vertical line where the cursor is in the file
set cursorline cursorcolumn

" set linenumbers
set relativenumber
set number

" linebreaks after long line are indented correctly
set wrap
set breakindent

" sets character encoding
set encoding=utf8

" show syntax
syntax enable

" set magic regex matching
set magic

" disable creating of all sort of swapfiles
set nobackup
set nowb
set noswapfile

" i want to see at least x lines above/below the cursor
set scrolloff=10

set history=999
set showmatch

" shows number of columns and lines in powerbar
set ruler

" sets width for shifting with >> or << and tablength and converts tab to
" spaces
set smartindent
set shiftwidth=4
set tabstop=4
set expandtab

" default split below and right
set splitbelow
set splitright

" New autosuggest scroll/accept keybindings
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" todo vsplit (below)/ hsplit (riht) shortcuts
:command Vtodo 20sp todos.md
:command Htodo 30vsp todos.md
" shortcuts to open/close todos
noremap <localleader>tv :Vtodo<CR>
noremap <localleader>th :Htodo<CR>
noremap <localleader>tc :bd todos.md<CR>

filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" The bundles you install will be listed here
Plugin 'bling/vim-airline' " add improved statusbar
Plugin 'scrooloose/nerdtree' " file explorer in vim
Plugin 'ryanoasis/vim-devicons' " add icons to Nerdtree
Plugin 'christoomey/vim-sort-motion' " add sorting verb 'gs'
Plugin 'tpope/vim-commentary' " add commenting verb 'gc'
Plugin 'tpope/vim-fugitive' " Git support with ':Git (add|commit|...)'
Plugin 'tpope/vim-repeat' 
Plugin 'tpope/vim-surround' " add predicate for surrounding 's'
Plugin 'tpope/vim-markdown' " markdown support
" Plugin 'christoomey/vim-system-copy' " copy/ paste to global system clipboard
" also adds 'cp' and 'cv' copy and paste verbs + 'cP'/'cV' to copy current
" line and paste system clipboard to next line
Plugin 'kana/vim-textobj-user'
Plugin 'rbonvall/vim-textobj-latex' " add textobj for latex
Plugin 'lervag/vimtex'
Plugin 'arcticicestudio/nord-vim'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'vim-airline/vim-airline-themes'

" Writing focused plugins
Plugin 'preservim/vim-pencil'
Plugin 'preservim/vim-colors-pencil'
Plugin 'preservim/vim-lexical'
Plugin 'preservim/vim-litecorrect'
Plugin 'preservim/vim-textobj-sentence'
Plugin 'preservim/vim-textobj-quote'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" enable filetype detection
filetype on
filetype plugin on
filetype indent on


"set colourscheme
set background=dark
set t_Co=256
"colorscheme molokai_dark
"colorscheme material-monokai
"colorscheme pencil
colorscheme nord

" __________________________________ PLUGIN SETTINGS ______________________________________
"=> Airline setup 
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
" "let g:airline#extensions#tabline#enabled = 1
" fancy powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme='angr'
let g:airline_theme='nord'
"let g:airline_theme = 'pencil'
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"disableing showing of trailing in current file
let g:airline#extensions#whitespace#show_message = 0
"include PencilMode in airline status
let g:airline_section_x = '%{PencilMode()}'

set guifont=MesloLGL\ Nerd\ Font\ 10

" testing rounded separators (extra-powerline-symbols):
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])

" NERDTree setup
"""""""""""""""""""""""""""""
" toggle NerdTree
map <F2> :NERDTreeToggle<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Toggle Prose Mode
"""""""""""""""""""""""""""""
let w:ProseModeOn = 0

function EnableProseMode()
    setlocal spell spelllang=en_gb
    SoftPencil
    Goyo 60
    " Limelight
    echo "Prose Mode On"
endfu

function DisableProseMode()
    NoPencil
    Goyo!
    " Limelight!
    setlocal nospell
    echo "Prose Mode Off"
endfu

function ToggleProseMode()
    if w:ProseModeOn == 0
        call EnableProseMode()
        let w:ProseModeOn = 1
    else
        call DisableProseMode()
    endif
endfu

command Prose call EnableProseMode()
command UnProse call DisableProseMode()
command ToggleProse call ToggleProseMode()

" Pencil setup
"""""""""""""""""""""""""""""
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#textwidth = 74 " default width of textlines
let g:pencil#mode_indicators = {'hard': 'H', 'auto': 'A', 'soft': 'S', 'off': '',}
" format current paragraph
nnoremap <leader>q gqap

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  " autocmd FileType text         call pencil#init({'wrap': 'hard'})
augroup END

" Lexical setup
""""""""""""""""""""""""""""""
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  " autocmd FileType textile call lexical#init()
  " autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

let g:lexical#spelllang = ['en_gb']
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt',]
let g:lexical#spell_key = '<leader>s'
let g:lexical#thesaurus_key = '<leader>t'

" Goyo setup
"""""""""""""""""""""""""""""
function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  " Limelight
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=10
  " Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:auto_goyo()
  if &ft == 'markdown'
    Goyo 80
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

" augroup goyo_markdown
"   autocmd!
"   autocmd BufNewFile,BufRead * call s:auto_goyo()
" augroup END

" Limelight setup
"""""""""""""""""""""""""""""
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = '240'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = '#3B4252'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Vim Textobj sentence setup
"""""""""""""""""""""""""""""
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
augroup END
" go to end of current sentence: g)
" go to end of previous sentence: g(

" Vim Textobj quote setuo
"""""""""""""""""""""""""""""
augroup textobj_quote
  autocmd!
  autocmd FileType markdown call textobj#quote#init()
  autocmd FileType textile call textobj#quote#init()
  autocmd FileType text call textobj#quote#init({'educate': 0})
augroup END

let g:textobj#quote#doubleMotion = 'q'
let g:textobj#quote#singleMotion = 'Q'

" Vim litecorrect
"""""""""""""""""""""""""""""
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
augroup END
