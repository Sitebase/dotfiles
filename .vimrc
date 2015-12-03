" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'wincent/Command-T'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'msanders/snipmate.vim'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
Plugin 'edkolev/tmuxline.vim'
Plugin 'pthk/vim-luna'
" Plugin 'tpope/vim-surround'
" Plugin 'AndrewRadev/switch.vim'
" Plugin 'terryma/vim-multiple-cursors'
" Plugin 'terryma/vim-multiple-cursors'

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

" open config
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

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

set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,js,php let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch
let g:switch_custom_definitions =
    \ [
    \	['true', 'false'],
    \	['TRUE', 'FALSE'],
    \	['on', 'off'],
    \	['enable', 'disable'],
    \	['print_r', 'var_dump'],
    \	['private', 'protected', 'public'],
    \ ]

nnoremap - :Switch<cr>

" CommandT
set wildignore=.o,.obj,.git,node_modules/**,custom_modules/**,converage/**

call pathogen#runtime_append_all_bundles()

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?
imap jj <Esc>

" ctrl+s to save file
" qq to quit file
map ss :w<cr>
map qq :q<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
map <C-l> :NERDTreeToggle<CR>

" Command T
map <C-t> :CommandT<CR>
map <C-b> :CommandTBuffer<CR>

" Emmet
let g:user_emmet_mode='a' " enable in all modes

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2



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

" auto source .vimrc when changed
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" this is from vimrc_example.vim
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='luna'
let g:airline#extensions#tabline#enabled = 1
set timeoutlen=50

" search google for the item under the cursor
nmap <leader>g :call Google()<CR>
fun! Google()
    let keyword = expand("<cword>")
    let url = "http://www.google.com/search?q=" . keyword
    silent exec "!open '".url."'"
	redraw!
endfun
