""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dzul: Most stuff here comes from the awesome vimrc by Amir Salihefendic:
"
" http://amix.dk - amix@amix.dk
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif

if has("gui_running")
    " Disable cursor blinking in normal mode
    set guicursor+=n:blinkon0
    set lsp=3
endif

" Enable Ctrl+C & Ctrl+C in eg: GVim
if has("gui_gtk2")
    " Ctrl-C + Ctrl+V
    vmap <C-c> "+yi
    vmap <C-x> "+c
    vmap <C-v> c<ESC>"+p
    imap <C-v> <C-r><C-o>+
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
colorscheme peaksea

" Open GUI terminal & file manager with <leader>t & <leader>xo respectively
if has("osx")
    map <leader>t :!nohup open . -a Terminal &> /dev/null &<cr><cr>
    map <leader>xo :!nohup open . &> /dev/null &<cr><cr>
elseif has("unix")
    if executable("x-terminal-emulator")
        map <leader>t :!nohup x-terminal-emulator . &> /dev/null &<cr><cr>
    endif
    if executable("xdg-open")
        map <leader>xo :!nohup xdg-open . &> /dev/null &<cr><cr>
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim_runtime/my_configs.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash 
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif   

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Session management
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:auto_session_management = 0
let s:path_arg = expand('%:p')
let s:path_arg_defined = strlen(@%) > 0

" Workaround to remove BufExplorer from MBE list
" due to some bug I have yet to figure out, see SaveSession()
function! s:RemoveBufExpFromMBE(session_filename)
    exe "!sed -iE -e '/BufExplorer/d' " . shellescape(a:session_filename) . ' &> /dev/null &'
endfunction

function! s:AutoSaveSession()
    if g:auto_session_management
        call SaveSession()
    endif
endfunction

function! s:AutoRestoreSession()
    if g:auto_session_management
        call RestoreSession()
    endif 
endfunction

function! SaveSession()
    " FIXME Session is not saved properly if MBE is opened,
    " haven't had time to check this yet
    MBECloseAll
    let l:currentdir = getcwd()

    " This is highly opinionated:
    " 1. If current working directory it's not ~/Documents, don't bother at all
    " 2. If it is, but under Playground subdirectory, skip it (I use 'Playground'
    " to quickly test stuff, etc, non-project stuff).
    " 3. If vim is started with a path argument, and it is not under ~/Documents,
    " skip it. Eg: quickly open a file in ~/Desktop.
    if !(l:currentdir =~ $HOME . '/Documents')
        return 0
    elseif (l:currentdir =~ $HOME . '/Documents/Playground/')
        return 0
    elseif ((s:path_arg_defined) && !(s:path_arg =~ $HOME . '/Documents'))
        return 0
    endif

    " Session file is saved under a directory tree that mirrors the current
    " working directory, inside ~/.vim/sessions
    let l:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(l:sessiondir) != 2)
        exe 'silent !mkdir -p "' . l:sessiondir . '"'
        redraw!
    endif
    let l:filename = l:sessiondir . '/session.vim'
    exe 'mksession! ' fnameescape(l:filename)
    call s:RemoveBufExpFromMBE(l:filename)
endfunction

function! RestoreSession()
    MBECloseAll
    let l:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let l:sessionfile = l:sessiondir . "/session.vim"

    let l:currentdir = getcwd()
    " If file is opened as an argument to vim & not under specified diretories,
    " don't manage it (see SaveSession() above)
    if s:path_arg_defined && !(s:path_arg =~ l:currentdir)
        echo "Disable session."
    elseif filereadable(l:sessionfile)
        exe 'source ' . fnameescape(l:sessionfile)
    else
        echo "No session loaded."
    endif
endfunction

" Required by session management
set sessionoptions-=options

au VimEnter * nested :call s:AutoRestoreSession()
au VimLeave * :call s:AutoSaveSession()
