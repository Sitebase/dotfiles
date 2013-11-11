" Quickly comment out chunks of code
"
" for the escaping:
" http://superuser.com/questions/320398/how-to-properly-vim-escape-a-variable-register
" http://jeetworks.org/node/86
"
" links that helped me:
" http://learnvimscriptthehardway.stevelosh.com/chapters/27.html
" http://learnvimscriptthehardway.stevelosh.com/chapters/19.html
" http://www.ibm.com/developerworks/linux/library/l-vim-script-1/
" http://stackoverflow.com/questions/1162611/vim-getting-the-current-value-of-vim-foldmarker
" http://www.mail-archive.com/vim@vim.org/msg00178.html
" http://stackoverflow.com/questions/11176159/vim-go-to-start-end-of-visual-selection
"
" Handy :help
" :help function-range-example

" Exit if already loaded
if exists("g:loaded_commentify")
  finish
endif

let g:loaded_commentify="v0.1.2"

if !exists("g:commentify_map_keys")
  let g:commentify_map_keys = 1
endif

if g:commentify_map_keys
  " key-mappings for comment/uncomment line in normal mode
  noremap  <silent> <C-C> :call commentify#Commentify()<CR>
  " key-mappings for range comment/uncomment lines in visual <Shift-V> mode
  vnoremap  <silent> <C-C> :call commentify#RangeCommentify()<CR>
endif

