" For configuration & simple documentation for each reference,
" see `plugins_config.vim`

call plug#begin('~/.vim/plugged')

" Utils
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tpope/vim-repeat'
Plug 'KabbAmine/vCoolor.vim'

" Files/browsing related
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'corntrace/bufexplorer'
Plug 'dezull/minibufexpl.vim', { 'branch': 'patches' }
Plug 'scrooloose/nerdtree'
" On macOS (comes with BSD Ctags), you can install Exuberant Ctags
" with homebrew: `$brew install ctags`
Plug 'dezull/tagbar', { 'branch': 'fix/tags-not-updated' }

" Syntax/filetype/linter
Plug 'w0rp/ale'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'elzr/vim-json'
Plug 'beyondwords/vim-twig'
Plug 'nikvdp/ejs-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'

" Snippets/completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim', { 'do': 'pip3 install --user pynvim' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

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
Plug 'https://github.com/blueyed/vim-diminactive.git'
Plug 'maximbaz/lightline-ale'

" Color schemes
Plug 'vim-scripts/mayansmoke'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/peaksea'

call plug#end()
