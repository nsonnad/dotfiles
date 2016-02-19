set nocompatible

"========================================================
" Plug
"========================================================
call plug#begin('~/.vim/plugged')

" Colors
Plug 'chriskempson/base16-vim'

" Utilities
Plug 'chrisbra/csv.vim'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'godlygeek/tabular'
Plug 'heavenshell/vim-jsdoc'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-pencil'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"============================
"Syntax highlighting
"===========================
Plug 'pangloss/vim-javascript'

" react
Plug 'mxw/vim-jsx'
let javascript_enable_domhtmlcss=1

Plug 'hdima/python-syntax'

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
"Plug 'vim-scripts/syntaxhaskell.vim'

"Check for new/updated bundles
call plug#end()

let base16colorspace=256
set t_Co=256
:command Dark set background=dark | colorscheme base16-ocean
:command Light set background=light | colorscheme base16-solarized
:Dark
":Light

noremap ⁄ :Dark<CR>
noremap € :Light<CR>

" Auto-refrech vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"============================
"SETTINGS
"=============================
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

filetype plugin on
filetype indent on

syntax enable
syntax on

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

" Always splits to the right and below
set splitright
set splitbelow

" Set to auto read when a file is changed from the outside
set autoread

" Set to auto write file
set autowriteall

" Display unprintable chars
set list
set listchars=tab:\|\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Case insensitive search
set ignorecase
set smartcase

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=3

" Min width of the number column to the left
set numberwidth=1

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" No need to show mode
set noshowmode

" Auto complete setting
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=node_modules/**,bower_components/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/
set wildignore+=*/.nx/**,*.app

" Make search act like search in modern browsers
set incsearch

" Make regex a little easier to type
set magic

" Show incomplete commands
set showcmd

" Turn off sound
set vb
set t_vb=

" Explicitly set encoding to utf-8
set encoding=utf-8

" Column width indicator
set colorcolumn=+1

" Lower the delay of escaping out of other modes
set timeout timeoutlen=1000 ttimeoutlen=0"

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" Text display settings
set linebreak
set textwidth=80
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

"dont tell me to save when switching buffers
set hidden
set relativenumber
set number
set expandtab tabstop=2 shiftwidth=2
" vim-seek leaping motions
let g:seek_enable_jumps = 1
"
"Better redrawing for large files
set ttyfast

"Disable the vbell
set visualbell t_vb="
set title

"Let backspace do what it's supposed to: allow backspace over indent, eol, and start of an insert
set backspace=indent,eol,start

" automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" disable weird vim regex
nnoremap / /\v
vnoremap / /\v

"===============================================================================
" Function Key Mappings
"===============================================================================

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

"===============================================================================
" Leader Key Mappings
"===============================================================================

let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

nnoremap <Leader>`` :qa!<cr><F5>

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" Toggle display of unprintable characters
nnoremap <silent> <Leader>2 :set list!

" <Leader>w: Close current buffer
nnoremap <Leader>w :bdelete<cr>
nnoremap <Leader>x :bp\|bd #<cr>

" <Leader>o: only
nnoremap <Leader>o :only<cr>

" <Leader>e: Fast editing of the .vimrc
nnoremap <Leader>ee :e! /Users/nikhil/docs/dotfiles/.vimrc<cr>

:nmap <silent> <leader>d :Dark<cr>
:nmap <silent> <leader>l :Light<cr>

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

" <Leader>,: Switch to previous split
nnoremap <Leader>, <C-w>p

" launch nerdtree
nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>

" Saving, quitting
nnoremap <leader>s :w!<cr>
nnoremap <leader>a :w!<cr>
nnoremap <leader>A :wa!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>

" FZF
nnoremap <leader>f :FZF<cr>
nnoremap <leader>F :FZF!<cr>

nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>t0 :tabfirst<cr>
nnoremap <leader>t$ :tablast<cr>
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>te :tabedit
nnoremap <leader>jd :JsDoc<cr>

noremap <leader>gu :GundoToggle<CR>
noremap <leader>sm :SyntasticToggleMode<CR>
noremap <leader>st :SyntasticCheck<CR>

" search for current word (to replace)
noremap <leader>sc :%s/<C-r><C-w>/
nnoremap <silent> <leader>nn :set nonumber! \| set relativenumber!<cr>

nnoremap <leader>R :RainbowParenthesesToggle

" <Leader>m: Maximize current split
nnoremap <Leader>m <C-w>_<C-w><Bar>
nmap <Leader>md :LivedownPreview<CR>

""===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

"U Redos since 'u' undos
nnoremap U :redo<cr>

" _ : Quick horizontal splits
nnoremap _ :sp<cr>

" | : Quick vertical splits
nnoremap <bar> :vsp<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" Make Y act like other uppercase commands
nnoremap Y y$"

"===============================================================================
" Normal Mode Ctrl Key Mappings
"===============================================================================

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl-q: Visual block mode

" Ctrl-w: Window management

"===============================================================================
" Visual Mode Key Mappings
"===============================================================================

" y: Yank and go to end of selection
xnoremap y y`]

" p: Paste in visual mode should not replace the default register with the
" deleted text
xnoremap p "_dP

" d: Delete into the blackhole register to not clobber the last yank. To 'cut',
" use 'x' instead
xnoremap d "_d

" \: Toggle comment
xmap \ <Leader>c<space>

"Backspace Delete selected and go into insert mode
xnoremap <bs> c

" Tab Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

" Bubble multiple lines
vmap ˚ [egv
vmap ∆ ]egv

"===============================================================================
" Normal Mode Key Mappings
"===============================================================================
" Up Down Left Right resize splits
nnoremap <up> <c-w>+
nnoremap <down> <c-w>-
nnoremap <left> <c-w><
nnoremap <right> <c-w>>

" Bubble single lines
nmap ˚ [e
nmap ∆ ]e

"Alt-h: Go to previous buffer
noremap ˙ :bprevious<CR>
"Alt-l: Go to next buffer
noremap ¬ :bnext<CR>
"Alt-Shift-j: Duplicate line down
noremap Ô mzyyp`zj
"Alt-Shift-k: Duplicate line up
noremap  mzyyp`z

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

"===============================================================================
" TmuxNavigator
"===============================================================================
let g:tmux_navigator_no_mappings = 1

"nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"===============================================================================
" NERDTree
"===============================================================================

nnoremap <silent> <Leader><tab> :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

"===============================================================================
" GitGutter
"===============================================================================
let g:gitgutter_eager=0

"===============================================================================
" Fugitive
"===============================================================================
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
nnoremap <Leader>gs :Gstatus<cr>


"===============================================================================
" Lightline
"===============================================================================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': {
      \   '__' : '-',
      \   'n'  : 'N',
      \   'i'  : 'I',
      \   'R'  : 'R',
      \   'c'  : 'C',
      \   'v'  : 'V',
      \   'V'  : 'V',
      \   '' : 'V',
      \   's'  : 'S',
      \   'S'  : 'S',
      \   '' : 'S',
      \ },
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
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:lightline_update()
augroup END

function! s:lightline_update()
  if !exists('g:loaded_lightline')
    return
  endif
  try
    if (&background =~# 'dark')
      let g:lightline.colorscheme = 'jellybeans'
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    elseif (&background =~# 'light')
      let g:lightline.colorscheme = 'solarized_light'
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endif
  catch
  endtry
endfunction

function! MyModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

set laststatus=2

"===============================================================================
" Syntastic
"===============================================================================
" specify which checkers to use
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['js', 'py', 'json', 'jsx'],
                           \ 'passive_filetypes': ['html'] }

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Check on buffer open
let g:syntastic_check_on_open = 1"


"===============================================================================
" Neosnippet
"===============================================================================

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/bundle/vim-react-snippets/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"===============================================================================
" Custom commands
"===============================================================================
:command Ipysource source ~/docs/dotfiles/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

let g:jsdoc_default_mapping=0
