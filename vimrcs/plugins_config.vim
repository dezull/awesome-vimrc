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

" KabbAmine/vCoolor.vim
" ---------------------
"
" GUI Color picker
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = 'ç' " <M-g>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files/browsing related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctrlpvim/ctrlp.vim
" ------------------
"
" Use <leader>cp to trigger.
" In the window, use `<c-f>` switch to file/buffer/MRU search,
" `<c-r>` to toggle regex, `<c-d>` to toggle fullpath/filename.
" let g:ctrlp_map = '<c-f>'
let g:ctrlp_map = '<leader>cp'
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'tmp\|node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|bower_components'

" junegunn/fzf.vim
" ----------------
"
let $FZF_DEFAULT_COMMAND='
            \ (
            \   (git ls-files --others --exclude-standard -c -m) ||
            \   (find . -path "*/\.*" -prune -o -type f -print -o -type l -print -maxdepth 3 2> /dev/null | sed s/^..//)
            \ ) | sort | uniq 2> /dev/null'
nmap <c-f> :FZF<CR>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
" Use similar sort as to MBE below
let g:bufExplorerSortBy='number'

" fholgado/minibufexpl.vim
" ------------------------
"
"  Browse the current buffer in the sidebar
let g:miniBufExplBuffersNeeded = 0
let g:miniBufExplVSplit = 30
let g:miniBufExplBRSplit = 0
let g:miniBufExplEqualAlways = 0
" map <leader>uu :MBEToggle<cr>
map <leader>uu :call <SID>DoThenResize(':MBEToggle')<cr>
map <F8> <leader>uu
" Move focus to MBE window, especially useful for multi-window edit,
" you can quickly move to MBE to open file in the previous window
map <leader>uf :MBEFocus<cr>

" scrooloose/nerdtree
" -------------------
"
" Browse the current directory tree
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI=1
"map <leader>nn :NERDTreeToggle<cr>
map <leader>nn :call <SID>DoThenResize(':NERDTreeToggle')<cr>
map <F7> <leader>nn
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>

" majutsushi/tagbar
" -------------------
"
" Symbols browser
let g:tagbar_autoclose = 0
let g:tagbar_width = 40
"map <leader>nn :TagbarToggle<cr>
map <leader>tb :call <SID>DoThenResize(':TagbarToggle')<cr>
map <F9> <leader>tb

function! s:ResetWindowsSize()
    let saved_ead = &ead
    let &ead = 'hor'
    set equalalways
    let &ead = saved_ead
    set noequalalways
endfunction

" Avoid window resizing madness when toggling windows.
" especially when doing multi-window editing.
function! s:DoThenResize(what)
    execute a:what
    call s:ResetWindowsSize()
endfunction

let g:tagbar_type_javascript = {
    \ 'ctagstype': 'js',
    \ 'kinds': [
        \ 'r:var:1',
        \ 'a:array:1',
        \ 'o:object',
        \ 'f:function'
    \ ],
    \ 'scope2kind' : {
        \ 'f' : 'function',
    \ },
\ }

let g:tagbar_type_emptytagbar = {
    \ 'ctagstype': 'emptytagbar',
    \ 'kinds' : []
\ }

let g:tagbar_compact = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax/filetype/linter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1

" w0rp/ale
" --------------------
" Use <leader><leader>n and <leader><leader>p to jump to next and previous
" lint errors.
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noinsert
nmap ff :ALEFix<CR>

" Map ALE next & previous with vim.repeat support
nnoremap <silent> <Plug>RepeatALEPreviousWrap :<c-u>ALEPreviousWrap<cr>:call repeat#set("\<Plug>RepeatALEPreviousWrap")<cr>
nmap <silent> <leader><leader>p <Plug>RepeatALEPreviousWrap
nnoremap <silent> <Plug>RepeatALENextWrap :<c-u>ALENextWrap<cr>:call repeat#set("\<Plug>RepeatALENextWrap")<cr>
nmap <leader><leader>n <Plug>RepeatALENextWrap

" posva/vim-vue
" -------------
" When checking for preprocessor languages, multiple syntax highlighting checks 
" are done, which can slow down vim. This variable prevents vim-vue from 
" supporting every pre-processor language highlighting.
let g:vue_disable_pre_processors=1

" Other Filetype/language specifics plugins
" -----------------------------------------
"
" digitaltoad/vim-pug
" groenewege/vim-less
" tpope/vim-markdown
" elzr/vim-json
" beyondwords/vim-twig
" nikvdp/ejs-syntax
" cakebaker/scss-syntax.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Snippets/completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shougo/neosnippet.vim
" ---------------------
" Use <c-j> to insert code snippet, and to jump to placeholders. Snippets provided by
" Shougo/neosnippet-snippets
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VCS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" tpope/vim-fugitive
" ------------------
"
" Git wrapper, eg: `:Gstatus` for `git status`.

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
" surround selection, word with string. Eg: enclose text in quotes.
" To surround with (') in normal/insert <leader>': foo -> 'foo'
" To delete enclosing (') in normal <leader>d': 'foo' -> foo
nmap <silent> <leader>' ysiw'
nmap <silent> <leader>" ysiw"
nmap <silent> <leader>) ysiw)
nmap <silent> <leader>] ysiw]
nmap <silent> <leader>} ysiw}
nmap <silent> <leader>> ysiw>
vmap <silent> <leader>' $q
vmap <silent> <leader>" $e
vmap <silent> <leader>) $1
vmap <silent> <leader>] $2
vmap <silent> <leader>} $3
vmap <silent> <leader>> <esc>`>a><esc>`<i<<esc>
nmap <silent> <leader>d' ds'
nmap <silent> <leader>d" ds"
nmap <silent> <leader>d) ds)
nmap <silent> <leader>d] ds]
nmap <silent> <leader>d} ds}
nmap <silent> <leader>d> ds>

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
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1
" Fix issues with deoplete
function g:Multiple_cursors_before()
    call deoplete#custom#buffer_option('auto_complete', v:false)
endfunction
function g:Multiple_cursors_after()
    call deoplete#custom#buffer_option('auto_complete', v:true)
endfunction


" maxbrunsfeld/vim-yankstack
" --------------------------
"
" Browse history of yanks
" Use <M-p> and <M-P> to cycle through items in the yank stack

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
map <silent> gx <leader>cu

" Hooks for VueJS files
let g:ft = ''
fu! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                let syn = tolower(syn)
                exe 'setf '.syn
            endif
        endif
    endif
endfu
fu! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ''
    endif
endfu


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
   \ 'component_expand': {
   \   'linter_checking': 'lightline#ale#checking',
   \   'linter_warnings': 'lightline#ale#warnings',
   \   'linter_errors': 'lightline#ale#errors',
   \   'linter_ok': 'lightline#ale#ok'
   \ },
   \ 'component_type': {
   \   'linter_checking': 'left',
   \   'linter_warnings': 'warning',
   \   'linter_errors': 'error',
   \   'linter_ok': 'left'
   \ },
   \ 'active': {
   \   'left': [ ['mode', 'paste'], ['fugitive', 'filename'] ],
   \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
   \ },
   \ 'component_function': {
   \   'mode': 'LightlineMode',
   \   'fugitive': 'LightlineFugitive',
   \   'filename': 'LightlineFilename',
   \   'fileformat': 'LightlineFileformat',
   \   'filetype': 'LightlineFiletype',
   \   'fileencoding': 'LightlineFileencoding',
   \ },
   \ 'separator': { 'left': '', 'right': '' },
   \ 'subseparator': { 'left': '', 'right': '' }
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
                \ fname =~ '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '\[BufExplorer\]\|-MiniBufExplorer-\|NERD_tree' ? '' :
                \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname =~ '__Tagbar__' ? 'Tagbar' :
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

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction
