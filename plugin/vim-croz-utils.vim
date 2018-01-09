" Lookup date
" Set date prog if it's something other than 'date'
" let g:date_prog = 'C:\MinGW\msys\1.0\bin\date.exe'
" Should move this to a vim plugin
function! s:get_date(...)
    if a:0 > 0
        let date_string = a:1
    else
        let date_string = input("Enter date: ")
    endif
    if exists("g:date_prog")
        let date_prog = g:date_prog
    else
        let date_prog = 'date'
    endif
    return substitute(system(date_prog . ' --date="' . date_string . '" +%Y-%m-%d'), '\n\+$', '', '')
endfunction
command! -nargs=* DateCopy        let @" = s:get_date(<args>)
command! -nargs=* DatePasteAfter  let @" = s:get_date(<args>) . ' ' | normal! ""p
command! -nargs=* DatePasteBefore let @" = s:get_date(<args>) . ' ' | normal! ""P

" Map dates if requested
if exists("g:croz_utils_date_mappings") && g:croz_utils_date_mappings == 1

    " insert mappings
    inoremap <Leader>ddd <C-o>:DatePasteAfter<CR>
    inoremap <Leader>dd0 <C-o>:DatePasteAfter 'today'<CR>
    inoremap <Leader>dd1 <C-o>:DatePasteAfter 'tomorrow'<CR>
    inoremap <Leader>dd- <C-o>:DatePasteAfter 'tomorrow'<CR>
    inoremap <Leader>dd2 <C-o>:DatePasteAfter '2 day'<CR>
    inoremap <Leader>dd= <C-o>:DatePasteAfter '2 day'<CR>
    inoremap <Leader>dd3 <C-o>:DatePasteAfter '3 day'<CR>
    inoremap <Leader>dd4 <C-o>:DatePasteAfter '4 day'<CR>
    inoremap <Leader>ddm <C-o>:DatePasteAfter 'monday'<CR>
    inoremap <Leader>ddt <C-o>:DatePasteAfter 'tuesday'<CR>
    inoremap <Leader>ddw <C-o>:DatePasteAfter 'wednesday'<CR>
    inoremap <Leader>ddr <C-o>:DatePasteAfter 'thursday'<CR>
    inoremap <Leader>ddf <C-o>:DatePasteAfter 'friday'<CR>
    inoremap <Leader>dds <C-o>:DatePasteAfter 'saturday'<CR>
    inoremap <Leader>ddu <C-o>:DatePasteAfter 'sunday'<CR>

    " normal mappings
    nnoremap <Leader>ddd :DatePasteBefore<CR>
    nnoremap <Leader>dd0 :DatePasteBefore 'today'<CR>
    nnoremap <Leader>dd1 :DatePasteBefore 'tomorrow'<CR>
    nnoremap <Leader>dd- :DatePasteBefore 'tomorrow'<CR>
    nnoremap <Leader>dd2 :DatePasteBefore '2 day'<CR>
    nnoremap <Leader>dd= :DatePasteBefore '2 day'<CR>
    nnoremap <Leader>dd3 :DatePasteBefore '3 day'<CR>
    nnoremap <Leader>dd4 :DatePasteBefore '4 day'<CR>
    nnoremap <Leader>ddm :DatePasteBefore 'monday'<CR>
    nnoremap <Leader>ddt :DatePasteBefore 'tuesday'<CR>
    nnoremap <Leader>ddw :DatePasteBefore 'wednesday'<CR>
    nnoremap <Leader>ddr :DatePasteBefore 'thursday'<CR>
    nnoremap <Leader>ddf :DatePasteBefore 'friday'<CR>
    nnoremap <Leader>dds :DatePasteBefore 'saturday'<CR>
    nnoremap <Leader>ddu :DatePasteBefore 'sunday'<CR>

endif
