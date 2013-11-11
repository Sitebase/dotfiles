" http://portablegvim.sourceforge.net/configuration.html
" http://stackoverflow.com/questions/3111351/gvim-portable-plugins
" https://github.com/spf13/spf13-vim
"
"
" stuff I always forget: g:, l:, s: variables definitions :help internal-variables

call pathogen#infect()
call pathogen#helptags()
call env#setup()

set nocompatible

" http://stackoverflow.com/questions/7178964/how-to-turn-off-auto-insert-when-selecting-text-with-gvim?rq=1
behave xterm

" tells Vim to look in the directory containing the current file (.), then the current
" directory (empty text between two commas), then each directory under the current directory ('**')
set path=.,,**

set showmode
:set virtualedit=onemore

" http://vim.wikia.com/wiki/Working_with_Unicode
" http://vim.1045645.n5.nabble.com/what-s-a-quot-conversion-error-quot-and-how-do-I-correct-it-td4416508.html
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" this is from vimrc_example.vim
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" mess with the status bar
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" line numbering
" nu or rnu turn linenumbering (nu - traditional numbering, rnu - relative
" numbering) on, you should use one or the other but not both
" http://jeffkreeftmeijer.com/2013/vims-new-hybrid-line-number-mode/
set number
set relativenumber
" for normal numbering, something like 5 is appropriate to easily handle files
" up to 99999 lines long, but for relative numbering, I think 2-3 is
" sufficient
set numberwidth=4 " Set line numbering to take up N spaces
set cursorline
set scrolloff=3 " N lines above/below cursor when scrolling

" turn on go stuff if it is available
if empty($GOROOT) && (!empty($GOPATH) || executable('go'))
  let $GOROOT = fnamemodify(system('which go'), ':p:h:h')
endif
if !empty($GOROOT)
  set rtp+=$GOROOT/misc/vim
endif

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
set tabstop=2 " set tab character to N characters
set softtabstop=2 " let backspace delete indent
set expandtab " turn tabs into whitespace
set shiftwidth=2 " indent width for autoindent
set backspace=indent,eol,start
" configure filetype specific stuff in ftplugin/filetype.vim

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Enable indent folding
" http://vimdoc.sourceforge.net/htmldoc/options.html#%27foldclose%27
set foldenable " toggle with zi
set foldmethod=indent
set foldnestmax=2
set foldlevelstart=2

" turn on syntax highlighting
filetype plugin indent on " indent depends on filetype
syntax on
colorscheme jaymon_light

" backup stuff
set history=1000
set backupcopy=yes
set backup
set writebackup
set undofile
set undolevels=1000
set undoreload=10000
" save ~ files somewhere where I don't have to bother with them
" http://stackoverflow.com/questions/2823608/
set backupdir-=.
set backupdir^=$VIMTEMP//
" sadly, backupdir doesn't respect the //, but this hack using the 'backupext' will make unique backup files
" The path is appended on the end of the file: '/home/docwhat/.vimrc' becomes '.vimrc%home%docwhat~'
" http://stackoverflow.com/a/9528517
au BufWritePre * let &backupext ='@'.substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'),  ':', '', 'g').'~'
" this is for the .swp files
" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set directory-=.
set directory^=$VIMTEMP//
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
set undodir-=.
set undodir^=$VIMTEMP//
" vim will save view state so the same view gets reloaded on file reopen
" http://vim.wikia.com/wiki/Make_views_automatic
set viewoptions-=options " preserving option state was annoying me, cursor and folding good, options bad
set viewdir=$VIMTEMP//
au BufWinLeave * silent! mkview "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

" http://stackoverflow.com/questions/594838/is-it-possible-to-get-gvim-to-remember-window-size
set sessionoptions+=resize

" Allow us to save a file as root, if we have sudo privileges,
" when we're not currently using vim as root
" http://vimingwithbuttar.googlecode.com/hg/.vimrc
cmap w!! %!sudo tee > /dev/null %

" make Y behave like D and C
nmap Y y$

" make it easy to select recently pasted stuff (similar to gv for recently selected)
" http://stackoverflow.com/questions/4312664/is-there-a-vim-command-to-select-pasted-text
" http://stackoverflow.com/questions/4775088/vim-how-to-select-pasted-block
nmap gp `[v`]

" reformat paste
" http://www.slideshare.net/ZendCon/vim-for-php-programmers-presentation
" (slide 27)
nnoremap <esc>P P'[v' ]=
nnoremap <esc>p p'[v' ]=

""" comments.vim
"A more elaborate comment set up. Use Ctr-C to comment and Ctr-x to uncomment
" This will detect file types and use oneline comments accordingle. Cool
" because you visually select regions and comment/uncomment the whole region.
" works with marked regions to.
" to activate, just place it in your plugins dir
" https://github.com/vim-scripts/comments.vim
" http://www.vim.org/scripts/script.php?script_id=1528

" this maps the "* register to the unnamed register so you can copy/paste between instances
" http://superuser.com/a/296308
set clipboard+=unnamed

" http://vim.wikia.com/wiki/VimTip1066
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
" deletes blank line below
nnoremap <silent><S-BS> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" deletes blank line above
nnoremap <silent><C-BS> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
" adds a blank line below
nnoremap <silent><S-CR> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" adds a blank line above
nnoremap <silent><C-CR> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" for switching buffers, no more Ctrl-w j, now you can just do ctrl-j
nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>10>
nnoremap <C-,> <C-w>10<
nnoremap <C-+> <C-w>+
nnoremap <C--> <C-w>-
" http://vim.wikia.com/wiki/Fast_window_resizing_with_plus/minus_keys
nnoremap <S-Up> <C-w>10+
nnoremap <S-Down> <C-w>10-
nnoremap <S-Right> <C-w>10>
nnoremap <S-Left> <C-w>10<


" re-parse the file to fix syntax errors
nmap <leader>rs :syn sync fromstart<CR>
nmap <leader>parse :syn sync fromstart<CR>

" configure tab buffers
" http://stackoverflow.com/questions/2468939/
" http://stackoverflow.com/questions/11595301/controlling-tab-names-in-vim
au bufEnter * set guitablabel=\[%N\]\ %t\ %M
" I also thought about using <C-<> :tabprev and <c->> :tabnext
nnoremap <A-.> :tabn<CR>
nnoremap <A-,> :tabp<CR>
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://vim.wikia.com/wiki/Using_tab_pages

" go back to the previous tab, sadly, tabp just goes to tab to the
" left, and :tabl goes to the very last tab, so :tabt will have to do
" http://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
nmap <leader>t :exe "tabn ".g:lasttab<CR>
nmap <leader>1 1gt<CR>
nmap <leader>2 2gt<CR>
nmap <leader>3 3gt<CR>
nmap <leader>4 4gt<CR>
nmap <leader>5 5gt<CR>
nmap <leader>6 6gt<CR>
nmap <leader>7 7gt<CR>
nmap <leader>8 8gt<CR>
nmap <leader>9 9gt<CR>

" put the opened tab at the end of the list, I prefer that to opening next to
" the tab in which it was opened
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()

" configure NERDTree
" https://github.com/scrooloose/nerdtree
autocmd bufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"nnoremap RN :NERDTreeToggle<CR>
nnoremap RN :NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$[[file]]']
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_new_tab = 0

" move tabs to the end for new, single buffers (exclude splits)
" http://stackoverflow.com/questions/3998752/nerdtree-open-in-a-new-tab-as-last-tab-in-gvim
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

" configure Tagbar
" http://majutsushi.github.com/tagbar/
nnoremap RR :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_sort = 1
let g:tagbar_expand = 0
let g:tagbar_foldlevel = 0
let g:tagbar_autoshowtag = 1
if has("win32")
  " for some reason, tagbar won't work if there are quotes around the path
  let g:tagbar_ctags_bin = $VIMHOME . '\bin\ctags.exe'
  let g:tagbar_phpctags_bin = $VIMHOME . '\bin\phpctags.bat'
else
  " ctags should be on the PATH for everything else
  let g:tagbar_phpctags_bin = $VIMHOME . '/bundle/phpctags/phpctags'
endif

" configure camel case motion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" helpful for syntax highlighting, show what highlight group is under cursor
" once again, I can never remember what I map this to
map  <leader>sg :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
map  <leader>hl :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>

" map omnicompletion to PSPad's ctrl-space
" http://stackoverflow.com/questions/7722177/how-do-i-map-ctrl-x-ctrl-o-to-ctrl-space-in-terminal-vim
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

" allows * and # to search current selection just like it searchs for current word under cursor
" http://vimingwithbuttar.googlecode.com/hg/.vimrc
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" this will launch the default browser window with the first url found on line
" http://waoewaoe.wordpress.com/2009/05/05/open-a-website-in-a-browser-from-commandline/
" http://vim.wikia.com/wiki/Open_a_web-browser_with_the_URL_in_the_current_line
function! LaunchBrowser()
  if has('gui')
    let l:uri = matchstr(getline("."), 'https\?:\/\/\S\+\c')
    let l:uri = shellescape(l:uri, 1)
    if l:uri != ""
      if has("win32")
        " if urls with & fail, we'll need to escape them with ^
        " https://github.com/copiousfreetime/launchy/issues/5
        " http://vim.wikia.com/wiki/Execute_external_programs_asynchronously_under_Windows
        " !start didn't work, there needs to be a space between the ! and the start
        exec ":silent ! start \"\" " . l:uri
      elseif has("mac")
        exec ":silent !open " . l:uri
      else
        echo "OS Not currently supported"
        " TODO: wrapping this in the has('gui') should keep this from firing in linux, maybe?
        " this should work, but I almost never have a gui in Linux computers
        "exec ":silent !xdg-open " . l:uri
      endif
    endif
  endif
endfunction
map <silent> <leader>b :call LaunchBrowser()<CR>:redraw!<CR>

" display what's changed since last save (uses diff command, so not cross-platform)
" http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
" http://stackoverflow.com/questions/749297/can-i-see-changes-before-i-save-my-file-in-vim
map <leader>d1 :w !diff % -
" this one is way more involved, it splits the screen and puts the original in the left buffer
" from vimrc_example 
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
map <leader>d2 :DiffOrig

