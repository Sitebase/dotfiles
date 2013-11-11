set guifont=Courier_New:h10:cANSI

" based off of this script:
" http://vim.wikia.com/wiki/Restore_screen_size_and_position
"
" This seems to work, the problem is it will set a certain size for the big
" monitor, and then that will be huge for the laptop screen, but it's better
" than the full size the GUIEnter was giving me on Mac

" set this for the size to be saved at all
let g:screen_size_restore = (exists("g:screen_size_restore")) ? g:screen_size_restore : 1
" set this to restore the screen position of the window, not just the size
let g:screen_size_restore_pos = (exists("g:screen_size_restore_pos")) ? g:screen_size_restore_pos : 0
" set this to restore by window name instead of one global size for all windows
let g:screen_size_by_vim_instance = (exists("g:screen_size_by_vim_instance")) ? g:screen_size_by_vim_instance : 1

function! ScreenFilename()
  let vim_instance = (g:screen_size_by_vim_instance==1) ? (v:servername) : 'GVIM'
  if has("win32")
    return $VIMTEMP . '\vimsize_' . vim_instance . '.txt'
  else
    return $VIMTEMP . '/vimsize_' . vim_instance . '.txt'
  endif
endfunction

function! ScreenRestore()
  " Restore window size (columns and lines) and position
  " from values stored in vimsize file.
  " Must set font first so columns and lines are based on font size

  " for comparison, get default values, and we will only save values if they
  " have changed
  let s:screen_size_ocolumns = &columns
  let s:screen_size_olines = &lines
  let s:screen_size_ox = getwinposx()<0?0:getwinposx()
  let s:screen_size_oy = getwinposy()<0?0:getwinposy()
  let f = ScreenFilename()
  if g:screen_size_restore || g:screen_size_restore_pos
    if filereadable(f)
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) >= 3
          if sizepos[0] == "size"
            silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          endif
          if sizepos[0] == "pos"
            silent! execute "winpos ".sizepos[1]." ".sizepos[2]
          endif
        endif
      endfor
    endif
  endif
endfunction

function! ScreenSave()
  " Save window size and position if it has changed
  let lines = []
  if g:screen_size_restore
    let s:screen_size_columns = &columns
    let s:screen_size_lines = &lines
    if (s:screen_size_columns != s:screen_size_ocolumns) || (s:screen_size_lines != s:screen_size_olines)
      let data = 'size ' . s:screen_size_columns . ' ' . s:screen_size_lines
      call add(lines, data)
    endif
  endif
  if g:screen_size_restore_pos
    let s:screen_size_x = getwinposx()<0?0:getwinposx()
    let s:screen_size_y = getwinposy()<0?0:getwinposy()
    if (s:screen_size_x != s:screen_size_ox) || (s:screen_size_y != s:screen_size_oy)
      let data = 'pos ' . s:screen_size_x . ' ' . s:screen_size_y
      call add(lines, data)
    endif
  endif
  if len(lines) > 0
    let f = ScreenFilename()
    call writefile(lines, f)
  endif
endfunction

autocmd VimEnter * if g:screen_size_restore == 1 | call ScreenRestore() | endif
autocmd VimLeavePre * if g:screen_size_restore == 1 | call ScreenSave() | endif

"set columns=160 lines=65
" we do our best to set cols to half the width and lines to about 2/3 height
" http://vim.1045645.n5.nabble.com/Setting-width-to-half-screen-size-td1172185.html
" TODO: make work in macvim
" autocmd GUIEnter * let &columns = 9999 | let &columns = &columns/3 + &columns/4
" autocmd GUIEnter * let &lines = 999 | let &lines = &lines/2 + &lines/3

if has("win32")
  " http://www.utf8-chartable.de/unicode-utf8-table.pl?start=688
  set listchars=tab:˻\ ,eol:˼,trail:˻,extends:˻,precedes:˻
else
  " http://www.utf8-chartable.de/unicode-utf8-table.pl?start=8192
  set listchars=tab:‧\ ,eol:․,trail:‧,extends:‧,precedes:‧
endif
set list
" the 2 lines work to match space, but I don't like it since it messes with
" highlight current line, I guess I just have to hope for space: support in
" listchars, see https://groups.google.com/forum/?fromgroups=#!topic/vim_dev/dIQHjW1g92s
" http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
" set conceallevel=2 concealcursor=nv
" autocmd BufWinEnter * syntax match NonText / / conceal cchar=˻

" set the status line
" http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
hi User1 guibg=#ECF7FF guifg=#A0A0A0
" hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
set laststatus=2
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%1*
set statusline+=\ \ \ \  " 4 spaces, matches up with line number width TODO: make this automatic
"set statusline+=%f\                          " file name
set statusline+=%.70F\ 
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},\  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},\  " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
" set statusline+=%b,0x%-8B\                   " current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"set statusline+=%l/%L\   "cursor line/total lines
set statusline+=%15.15(%c\ %l/%L%)\   "cursor line/total lines

