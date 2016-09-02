"""""""""""""""""""""""""""""""""""""""""""
" Miroslav Limbahter
" Vim configuration
" 11.8.2016.
"
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""
" Vundle config 
" (plugin management tool)
"
"""""""""""""""""""""""""""""""""""""""""""

" To make plugins work you need to install Vundle first:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Brief help
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

set nocompatible " be iMproved, required
filetype off " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin on GitHub repo
Plugin 'scrooloose/nerdtree' " File directory tree
Plugin 'scrooloose/syntastic' " Syntax checker for various languages
Plugin 'itchyny/lightline.vim' " Configurable status line for Vim
Plugin 'tpope/vim-commentary' " Plugin for code comments
Plugin 'tpope/vim-fugitive' " Git integration
Plugin 'ctrlpvim/ctrlp.vim' " Full path fuzzy file finder for Vim

" Plugins for code snippets
" (various languages included)
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Color shcheme plugins
Plugin 'flazz/vim-colorschemes' " Various color schemes for Vim

" All of your Plugins must be added before the following line
call vundle#end() " required
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""
" Syntastic config
" (syntax checker)
"
""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""
" Lightline
" (pretty status line with colorshcemes
"
""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

""""""""""""""""""""""""""""""""""""""""""""
" CtrlP settings
'
""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_match_window = 'bottom,order:ttb'

""""""""""""""""""""""""""""""""""""""""""""
" My Vim config
"
""""""""""""""""""""""""""""""""""""""""""""

" colorscheme
colorscheme Tomorrow-Night
" syntax highligh on
syntax enable
" invisible characters
set listchars=tab:▸\ ,eol:¬
set list
" tab options
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
" search highlight
set hlsearch
" show line numbers
set number
set showmatch
set showcmd
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"
"""""""""""""""""""""""""""""""""""""""""""""

" toggle invisible chars
map <leader>l :set list!<CR>
" disable arrow keys for navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" toggle NERDTree on/off
map <C-n> :NERDTreeToggle<CR>
" bind Ctrl+S for saving current file in any mode
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
" split windows easy navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

""""""""""""""""""""""""""""""""""""""""""""
" Auto commands
"
""""""""""""""""""""""""""""""""""""""""""""

" autoload NERDTree when vim starts
autocmd vimenter * NERDTree
" code completion for PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" close vim if NERDTree is the last opened windows
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
