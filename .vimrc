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
"    Duplicate file in netrw
"    =======================
"    Set cursor on ./ (or directory in which you want to copy) , press mt
"    Set cursor on file you want copy, press mf, then mc, type a name of new file, enter
"    
"
"    Open last edited file
"    =======================
"    e(space).(enter)
"
"
"    Resize netrw file explorer
"    =======================
"    :vertical resize N


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
" set listchars=tab:\|\
" set list

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

" Resize lex with mouse
set mouse=n
" Make the aforementioned feature work with TMUX
set ttymouse=xterm2

" START ATTEMPT AT SEXY POWERLINE
" Statusline (requires Powerline font) 
" Fonts clone here --> https://github.com/powerline/fonts
" Install them and set them in terminal preferences, any that have powerline
" will suffice. When on linux just place them in the ~/.fonts dir
set statusline=
set statusline+=%(%{&filetype!='help'?bufnr('%'):''}\ \ %)
set statusline+=%< " Where to truncate line
set statusline+=%f\  " Path to the file in the buffer, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ 
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G| " ------------------------ 8< ------------------------ 
" Statusline with highlight groups (requires Powerline font, using Solarized theme)
set statusline=
set statusline+=%(%{&filetype!='help'?bufnr('%'):''}\ \ %)
set statusline+=%< " Where to truncate line
set statusline+=%f\  " Path to the file in the buffer, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%1*\  " Set highlight group to User1
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ %* " Restore normal highlight
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|

" Logic for customizing the User1 highlight group is the following
" - if StatusLine colors are reverse, then User1 is not reverse and fg = StatusLine fg
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642
set laststatus=2
