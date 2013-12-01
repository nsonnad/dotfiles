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
NeoBundle 'MarcWeber/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'goldfeld/vim-seek'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ivanov/vim-ipython'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Valloric/YouCompleteMe' , { 'build': {
      \     'mac' : './install.sh',
      \    },
      \ } 

"============================
"Language specific
"===========================
NeoBundle 'hdima/python-syntax'

"tern is a js parser
NeoBundle 'marijnh/tern_for_vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

"============================
"SETTINGS
"=============================
syntax on
filetype plugin on
filetype plugin indent on
"dont tell me to save when switching buffers
set hidden
set relativenumber
set number
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
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>t0 :tabfirst<cr>
nnoremap <leader>t$ :tablast<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>te :tabedit
nnoremap <C-p> :Unite file<cr>
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
"COLORS
"=============================
NeoBundle 'Zenburn'
colorscheme zenburn
"weird workaround for setting indent guide colors
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

NeoBundle 'altercation/vim-colors-solarized'
:command Solarized 
  \ let g:solarized_termcolors=256
  \ | set background=light 
  \ | colorscheme solarized


"============================
"PLUGIN MAPPINGS
"=============================
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
"let g:EasyMotion_leader_key = '<Leader>'

"vim-seek
let g:SeekKey = '-'
let g:SeekBackKey = '_'

"YouCompleteMe
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"Fugitive
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gs :Gstatus<cr>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

let g:UltiSnips = {}
let g:UltiSnips.ExpandTrigger = "<tab>"
let g:UltiSnips.snipmate_ft_filter = {
            \ 'default' : {'filetypes': ["FILETYPE"] },
            \ 'javascript'    : {'filetypes': ["javascript"] },
            \ 'python': {'filetypes': ["python"] },}

