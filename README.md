vim-croz-utils
==============

Some miscellaneous utilities for Vim

Date Utils
----------

This plugin provides an interface to the `date` program via three commands:

-   DateCopy: Copies the given date string in YYYY-MM-DD format to
    the clipboard. Accepts the date string in any format `date`
    understands, such as `today`, `Jun 16`, `2 Monday` and so forth.
-   DatePasteBefore: Like DateCopy, but also pastes the date into the
    document via `p`.
-   DatePasteAfter: Like DateCopy, but also pastes the date into the
    document via `P`.

The plugin uses the system `date` command by default, and expects it to
behave like the unix command of the same name. If your date command lives
somewhere else (for example if you're running on Windows), you can tell
these commands to use a different date executable by setting the
`g:date_prog` variable, like so:

``` {.vimscript}
let g:date_prog = 'C:\MinGW\msys\1.0\bin\date.exe'
```
