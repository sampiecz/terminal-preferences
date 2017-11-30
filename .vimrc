"               ,
"              / \,,_  .'|
"           ,{{| /}}}}/_.'
"          }}}}` '{{'  '.
"        {{{{{    _   ;, \
"     ,}}}}}}    /o`\  ` ;)
"    {{{{{{   /           (
"    }}}}}}   |            \
"   {{{{{{{{   \            \          ,-------------------------------.
"   }}}}}}}}}   '.__      _  |        /       HI                        \
"   {{{{{{{{       /`._  (_\ /       /      /   \                        |
"    }}}}}}'      |    //___/   --= <   VVVI     HI-HI-HI                |
"    `{{{{`       |     '--'         \                   \               |
"     }}}`                            \                  HIM-HIM-HIM!!!  /
"                                      '--------------------------------'
"
"    Duplicate File in Netrw
"    =======================
"    Set cursor on ./ (or directory in which you want to copy) , press mt
"    Set cursor on file you want copy, press mf, then mc, type a name of new file, enter
"    
"    Open last edited file
"    =====================
"    e(space).(enter)
"


syntax on
set number
"let g:solarized_termcolors=16
colorscheme solarized
set background=dark
"
filetype plugin indent on
"" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

let g:netrw_banner = 0
let g:netrw_winsize = 15

" setting split to 3 opens in new tab
" setting split to 0 opens in current tab
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3

" hides those pesky .swp in netrw file explorer
" let g:netrw_list_hide= '.*\.swp$'

" try to get indent guides
set listchars=tab:\|\
set list

" having trouble with backspaces
set backspace=indent,eol,start

" stop swp files  
set noswapfile

" make iterm like scrolling in vim
set mouse=nicr

" try these bad larrys out
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Open vertical split window on the right rather than the left
set splitright
