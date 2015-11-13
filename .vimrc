" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'AndrewRadev/switch.vim'
Plugin 'bling/vim-airline'

" fuzzy finder like your are used to use in text editors like Atom or Sublime
Plugin 'wincent/Command-T'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle end

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamedplus
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
set nolist " hide hidden character because this seems to make the code less readable
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
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
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3


set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
" allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
"    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
"    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

" this line enables loading plugins and settings based on file types
filetype plugin indent on

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
endif

" This makes sure the themes work like they should when using vim
" in a terminal
if $TERM == "xterm-256color"
  	set t_Co=256
endif

colorscheme molokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch
let g:switch_custom_definitions =
    \ [
    \   ['foo', 'bar', 'baz'],
    \	['true', 'false'],
    \	['TRUE', 'FALSE'],
    \	['on', 'off'],
    \	['enable', 'disable'],
    \	['print_r', 'var_dump'],
    \	['private', 'protected', 'public'],
    \ ]

nnoremap - :Switch<cr>

call pathogen#runtime_append_all_bundles()

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
imap jj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
map <C-l> :NERDTreeToggle<CR>

" Command T
map <C-t> :CommandT<CR>
map <C-b> :CommandTBuffer<CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


let g:Powerline_symbols = 'fancy'

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


" this is from vimrc_example.vim
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Indent stuff
" http://www.jonlee.ca/hacking-vim-the-ultimate-vimrc/
" http://www.cs.swarthmore.edu/help/vim/indenting.html
set autoindent
" Generally, 'smartindent' or 'cindent' should only be set manually if you're
" not satisfied with how file type based indentation works.
" looks like smartindent was deprecated for cindent, and should be activated
" in specific filetypes, not generally
" http://vim.wikia.com/wiki/Indenting_source_code
"set smartindent
set tabstop=4 " set tab character to N characters
set softtabstop=2 " let backspace delete indent
set expandtab " turn tabs into whitespace
set shiftwidth=2 " indent width for autoindent
set backspace=indent,eol,start
" configure filetype specific stuff in ftplugin/filetype.vim


let g:airline_powerline_fonts = 1
