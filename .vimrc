set nocompatible

"========================================================
" NeoBundle
"========================================================

if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', { 'build': {
      \ 'windows': 'make -f make_mingw32.mak',
      \ 'cygwin': 'make -f make_cygwin.mak',
      \ 'mac': 'make -f make_mac.mak',
      \ 'unix': 'make -f make_unix.mak',
      \ } }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'

"============================
"Language specific
"===========================
NeoBundle 'hdima/python-syntax'

"============================
"SETTINGS
"=============================
syntax on
filetype plugin on
filetype plugin indent on
colorscheme zenburn
"dont tell me to save when switching buffers
set hidden
set relativenumber
set expandtab tabstop=2 shiftwidth=2
set t_Co=256
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
" vim-seek leaping motions
let g:seek_enable_jumps = 1

"============================
"MAPPINGS
"=============================
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
nnoremap <Leader>w :bdelete<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>q :q<cr>
nnoremap f :Unite file<cr>
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

"Alt-h: Go to previous buffer
noremap ˙ :bprevious<CR>
"Alt-j: Move current line down
noremap ∆ mz:m+<cr>`z==
"Alt-k: Move current line up
noremap ˚ mz:m-2<cr>`z==
"Alt-l: Go to next buffer
noremap ¬ :bnext<CR>
"Alt-Shift-j: Duplicate line down
noremap Ô mzyyp`zj
"Alt-Shift-k: Duplicate line up
noremap  mzyyp`z

"============================
"Fugitive
"=============================
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gs :Gstatus<cr>

"============================
" Airline
"=============================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
