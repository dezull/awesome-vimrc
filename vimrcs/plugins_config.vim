" Configurations for Plugins defined in `plugs.vim`
"
" Some plugins have no custom configuration, I list all here just for some
" documentation & future reference. We tend to forget stuff like keybindings.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Utils
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-scripts/tlib
" ----------------
"
" Required by some other plugins.

" MarcWeber/vim-addon-mw-utils
" ----------------------------
"
" Required by some other plugins.

" tpope/vim-repeat
" ----------------
"
" `.` command improvement. Needed by other plugins.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files/browsing related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlpvim/ctrlp.vim
" ------------------
"
" Search files in the current directory tree. Use `<c-f>` to trigger.
" In the window, use `<c-f>` switch to file/buffer/MRU search,
" `<c-r>` to toggle regex, `<c-d>` to toggle fullpath/filename.
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'tmp\|node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|bower_components'

" mileszs/ack.vim
" ---------------
"
" Search with `:Ack`. Requires ack in your path.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Ack and put the cursor in the right position
map <leader>g :Ack! 
" To go to the next search result do:
"   <leader>n
" To go to the previous search results do:
"   <leader>p
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" amix/open_file_under_cursor.vim
" -------------------------------
"
" Open file (path) under cursor when pressing gf

" corntrace/bufexplorer
" ---------------------
"
" Browse the current buffer in a window
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

" fholgado/minibufexpl.vim
" ------------------------
"
"  Browse the current buffer in the sidebar
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplVSplit = 25
let g:miniBufExplBRSplit = 0
"autocmd BufRead,BufNew :call MBE
map <leader>u :MBEToggle<cr>

" scrooloose/nerdtree
" -------------------
"
" Browse the current directory tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax/filetype/linter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scrooloose/syntastic
" --------------------
"
" Syntax checker - use error window to show linter messages
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_ruby_checkers = ['rubocop']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "tabedit " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

" Other Filetype/language specifics plugins
" -----------------------------------------
"
" digitaltoad/vim-pug
" groenewege/vim-less
" tpope/vim-markdown
" elzr/vim-json
" beyondwords/vim-twig
" nikvdp/ejs-syntax


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Snippets/completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" garbas/vim-snipmate
" -------------------
"
" Use <tab> or <c-j> to insert code snippet. Snippets provided by
" `honza/vim-snippets`.
"
" Eg:
" type 'fun' in javascript file, and press <tab> (or <c-j>)
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

" honza/vim-snippets
" ------------------
"
" Provide code snippets for various languages.

" vim-scripts/AutoComplPop
" ------------------------
"
" Auto completion popup. Provides omni-completion for certain file types.
" Works with `garbas/vim-snipmate`.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VCS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tpope/vim-fugitive
" ------------------
"
" Git wrapper, eg: `:GStatus` for `git status`.

" airblade/vim-gitgutter
" ----------------------
"
" Show diff in the gutter ('sign column'). Disabled by default.
" Use `:GitGutterEnable` to enable & `:GitGutterSignsToggle` to toggle signs.
let g:gitgutter_enabled=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => String/yank/replacer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tpope/vim-surround
" ------------------
"
" surround selection (FIXME: doesn't work), word with string. Eg: enclose text in quotes.
nmap <silent> <leader>' ysiw'
nmap <silent> <leader>" ysiw"
nmap <silent> <leader>d' ds'
nmap <silent> <leader>d" ds"

" terryma/vim-expand-region
" -------------------------
"
" Expand/shrink selection. Use '+' & '_'.

" terryma/vim-multiple-cursors
" ----------------------------
"
" Multiple cursors ala Sublime. Works in normal, insert & visual modes.
" First, select a word with <c-n>, and <c-n> again to select next occurence.
" <c-x> to skip, <c-p> for previous. Once selected, use other mapping,
" eg: 'c', to replace.

" maxbrunsfeld/vim-yankstack
" --------------------------
"
" Browse history of yanks
" FIXME <c-P> doesn't work
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste

" vim-scripts/matchit.zip
" -----------------------
"
" Extended matcher for %.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Commenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" scrooloose/nerdcommenter
" ------------------------
"
" For commenting, what else?
let g:NERDSpaceDelims = 1
" toggle line comment
map <silent> gc <leader>c<space>
" block comment
map <silent> gb <leader>cs
" nested comment
vmap <silent> gm <leader>cn
" uncomment line, do this to uncomment nested
map <silent> gu <leader>cu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Distraction free writing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" junegunn/goyo.vim
" -----------------
"
" `amix/vim-zenroom2`, needs this.
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

" amix/vim-zenroom2
" -----------------
"
" Just use `<leader>z` to enter this mode.
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" drmikehenry/vim-fontsize
" ------------------------
"
" Adjust font size in GUI like MacVim/GVim
" Use <leader><leader>+, <leader><leader>-, <leader><leader>0 to size up, down
" & reset respectively

" itchyny/lightline.vim
" ---------------------
"
" Pretty status line. I like it flashy.
" If supported font is used, you get even nicer UI.
" The post install VimPlug hook should install the fonts for you.
let g:lightline = {
   \ 'active': {
   \   'left': [ ['mode', 'paste'], ['fugitive', 'filename'], ['ctrlpmark'] ],
   \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
   \ },
   \ 'component_function': {
   \   'mode': 'LightlineMode',
   \   'fugitive': 'LightlineFugitive',
   \   'filename': 'LightlineFilename',
   \   'fileformat': 'LightlineFileformat',
   \   'filetype': 'LightlineFiletype',
   \   'fileencoding': 'LightlineFileencoding',
   \   'ctrlpmark': 'CtrlPMark'
   \ },
   \   'separator': { 'left': '', 'right': '' },
   \   'subseparator': { 'left': '', 'right': '' }
   \ }

function! LightlineFugitive()
    try
        if expand('%:t') !~? 'BufExplorer\|Tagbar\|NERD'
                    \ && exists('*fugitive#head')

            let branch = fugitive#head()
            return branch !=# '' ? ' '.branch : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightlineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' 
                \ && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '\[BufExplorer\]\|-MiniBufExplorer-\|NERD_tree' ? '' :
                \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ fname =~ '\[BufExplorer\]' ? 'BufExplorer' :
                \ fname == '-MiniBufExplorer-' ? 'MBE' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightlineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction 

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction
