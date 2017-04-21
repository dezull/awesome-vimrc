" For configuration & simple documentation for each reference,
" see `plugins_config.vim`

call plug#begin('~/.vim/plugged')

" Utils
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-repeat'

" Files/browsing related
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'corntrace/bufexplorer'
Plug 'fholgado/minibufexpl.vim'
Plug 'scrooloose/nerdtree'

" Syntax/filetype/linter
Plug 'scrooloose/syntastic'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'elzr/vim-json'
Plug 'beyondwords/vim-twig'
Plug 'nikvdp/ejs-syntax'

" Snippets/completion
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/AutoComplPop'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" String/yank/replacer
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'vim-scripts/matchit.zip'

" Commenting
Plug 'scrooloose/nerdcommenter'

" Distraction free writing
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" UI
Plug 'drmikehenry/vim-fontsize'
Plug 'itchyny/lightline.vim', {
    \ 'do': 'git clone https://github.com/powerline/fonts /tmp/powerline-fonts && cd /tmp/powerline-fonts && ./install.sh'
    \ }

" Color schemes
Plug 'vim-scripts/mayansmoke'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/peaksea'

call plug#end()
