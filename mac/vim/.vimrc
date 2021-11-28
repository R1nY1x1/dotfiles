" +----------+
" | Encoding |
" +----------+
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

" +--------+
" | Plugin |
" +--------+
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" :PluginInstall
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'tyru/eskk.vim'
call vundle#end()
filetype plugin indent on

" +---------+
" | airline |
" +---------+
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" +----------+
" | NERDTree |
" +----------+
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" +-----+
" | lsp |
" +-----+
let g:lsp_diagnostics_echo_cursor = 1
set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><tab> pumvisible() ? "<Down>" : "<tab>"
inoremap <expr><S-tab> pumvisible() ? "<Up>" : "<S-tab>"

" +------+
" | eskk |
" +------+
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary  = {'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}

let g:eskk#kakutei_when_unique_candidate = 1
let g:eskk#enable_completion = 0
let g:eskk#no_default_mappings = 1
let g:eskk#keep_state = 0
let g:eskk#egg_like_newline = 1

let g:eskk#marker_henkan = "[変換]"
let g:eskk#marker_henkan_select = "[選択]"
let g:eskk#marker_okuri = "[送り]"
let g:eskk#marker_jisyo_touroku = "[辞書]"

augroup vimrc_eskk
  autocmd!
  autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
augroup END

imap jk <Plug>(eskk:toggle)
cmap jk <Plug>(eskk:toggle)

" +-------+
" | basic |
" +-------+
set directory=$HOME/.vim/swap
set backupdir=$HOME/.vim/backup
set undodir=$HOME/.vim/undo

" Syntax
syntax on
colorscheme monokai

" Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent

set backspace=indent,eol,start

set laststatus=2

set title
set number
set cursorline
set showmatch
set matchtime=5

" Serch
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan

" Folding

" +--------+
" | Keymap |
" +--------+
" :map   :noremap  :unmap     ノーマル、ビジュアル、選択、オペレータ待機
" :nmap  :nnoremap :nunmap    ノーマル
" :vmap  :vnoremap :vunmap    ビジュアル、選択
" :smap  :snoremap :sunmap    選択
" :xmap  :xnoremap :xunmap    ビジュアル
" :map!  :noremap! :unmap!    挿入、コマンドライン
" :imap  :inoremap :iunmap    挿入
" :lmap  :lnoremap :lunmap    挿入、コマンドライン、Lang-Arg
" :cmap  :cnoremap :cunmap    コマンドライン

nnoremap j gj
nnoremap k gk

nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap jj <Esc>
