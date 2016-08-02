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
if g:croz_utils_date_mappings == 1

    " insert mappings
    inoremap \ddd <C-o>:DatePasteAfter<CR>
    inoremap \dd0 <C-o>:DatePasteAfter 'today'<CR>
    inoremap \dd1 <C-o>:DatePasteAfter 'tomorrow'<CR>
    inoremap \dd- <C-o>:DatePasteAfter 'tomorrow'<CR>
    inoremap \dd2 <C-o>:DatePasteAfter '2 day'<CR>
    inoremap \dd= <C-o>:DatePasteAfter '2 day'<CR>
    inoremap \dd3 <C-o>:DatePasteAfter '3 day'<CR>
    inoremap \dd4 <C-o>:DatePasteAfter '4 day'<CR>
    inoremap \ddm <C-o>:DatePasteAfter 'monday'<CR>
    inoremap \ddt <C-o>:DatePasteAfter 'tuesday'<CR>
    inoremap \ddw <C-o>:DatePasteAfter 'wednesday'<CR>
    inoremap \ddr <C-o>:DatePasteAfter 'thursday'<CR>
    inoremap \ddf <C-o>:DatePasteAfter 'friday'<CR>
    inoremap \dds <C-o>:DatePasteAfter 'saturday'<CR>
    inoremap \ddu <C-o>:DatePasteAfter 'sunday'<CR>

    " normal mappings
    nnoremap \ddd :DatePasteBefore<CR>
    nnoremap \dd0 :DatePasteBefore 'today'<CR>
    nnoremap \dd1 :DatePasteBefore 'tomorrow'<CR>
    nnoremap \dd- :DatePasteBefore 'tomorrow'<CR>
    nnoremap \dd2 :DatePasteBefore '2 day'<CR>
    nnoremap \dd= :DatePasteBefore '2 day'<CR>
    nnoremap \dd3 :DatePasteBefore '3 day'<CR>
    nnoremap \dd4 :DatePasteBefore '4 day'<CR>
    nnoremap \ddm :DatePasteBefore 'monday'<CR>
    nnoremap \ddt :DatePasteBefore 'tuesday'<CR>
    nnoremap \ddw :DatePasteBefore 'wednesday'<CR>
    nnoremap \ddr :DatePasteBefore 'thursday'<CR>
    nnoremap \ddf :DatePasteBefore 'friday'<CR>
    nnoremap \dds :DatePasteBefore 'saturday'<CR>
    nnoremap \ddu :DatePasteBefore 'sunday'<CR>

endif
