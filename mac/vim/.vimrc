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
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
Plugin 'tyru/eskk.vim'
Plugin 'skanehira/preview-markdown.vim'
Plugin 'skanehira/translate.vim'
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

" +-------+
" | vsnip |
" +-------+
let g:vsnip_snippet_dir = expand('~/.vim/vsnip')
" Expand
imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
" Expand or jump
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap s <Plug>(vsnip-select-text)
xmap s <Plug>(vsnip-select-text)
nmap S <Plug>(vsnip-cut-text)
xmap S <Plug>(vsnip-cut-text)

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

" +-----------------+
" | MarkdownPreview |
" +-----------------+
let g:preview_markdown_vertical = 1
let g:preview_markdown_parser = 'glow'

" +-----------+
" | translate |
" +-----------+
let g:translate_source = "en"
let g:translate_target = "ja"
let g:translate_popup_window = 1
let g:translate_winsize = 10

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
set foldmethod=indent
set foldcolumn=3

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

" +-------+
" | Local |
" +-------+
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  " let files = findfile('.vimrc.local', escape(a:loc, ' ') . ':', -1)
  let files = findfile('.vimrc.local', escape(a:loc, '').';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
