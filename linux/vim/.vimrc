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
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-treesitter'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
Plugin 'tyru/eskk.vim'
Plugin 'previm/previm'
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
nnoremap <C-t> :NERDTreeToggle<CR>

" +-----+
" | fzf |
" +-----+
" fzf settings
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> <Space>f :Files<CR>
nnoremap <silent> <Space>g :GFiles<CR>
nnoremap <silent> <Space>G :GFiles?<CR>
nnoremap <silent> <Space>b :Buffers<CR>
nnoremap <silent> <Space>h :History<CR>
nnoremap <silent> <Space>r :RG<CR>


" +-----+
" | lsp |
" +-----+
let g:lsp_diagnostics_echo_cursor = 1
set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><tab> pumvisible() ? "<Down>" : "<tab>"
inoremap <expr><S-tab> pumvisible() ? "<Up>" : "<S-tab>"
nnoremap <Space>d :LspPeekDefinition<CR>
nnoremap <Space>D :LspDefinition<CR>
nnoremap <Space>t :LspPeekTypeDefinition<CR>
nnoremap <Space>T :LspTypeDefinition<CR>

" +-------+
" | vsnip |
" +-------+
let g:vsnip_snippet_dir = expand('~/.vim/vsnip')
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

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

" +--------+
" | Previm |
" +--------+
let g:previm_open_cmd = 'open -a Google\ Chrome'
" let g:previm_enable_realtime = 1

" +-----------+
" | translate |
" +-----------+
let g:translate_source = "en"
let g:translate_target = "ja"
let g:translate_popup_window = 1
let g:translate_winsize = 10

" +----------+
" | vim-peek |
" +----------+
let g:peek_popup_window = 1
let g:peek_winsize = 10
let g:peek_move_span = 1

" +-------+
" | basic |
" +-------+
set belloff=all
set directory=$HOME/.vim/swap
set backupdir=$HOME/.vim/backup
set undodir=$HOME/.vim/undo

" Syntax
syntax on
colorscheme molokai

" Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set autoindent

set backspace=indent,eol,start

set laststatus=2

set title
set number
set cursorline
set showmatch
set matchtime=5
set ambiwidth=double

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
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprev<CR>

nmap <Esc><Esc> :nohlsearch<CR><Esc>

inoremap jj <Esc>

" +----------+
" | Filetype |
" +----------+
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

augroup PythonTab
  autocmd! 
  autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4
  autocmd BufNewFile,BufRead *.py setlocal softtabstop=4
augroup END

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
