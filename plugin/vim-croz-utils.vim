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
