set nocompatible

"========================================================
" Plug
"========================================================
call plug#begin('~/.vim/plugged')

" Utilities
Plug 'andys8/vim-elm-syntax'
Plug 'chrisbra/csv.vim'
Plug 'chriskempson/base16-vim'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'heavenshell/vim-jsdoc'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'reedes/vim-pencil'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

"============================
"Syntax highlighting
"===========================
Plug 'pangloss/vim-javascript'
Plug 'nsonnad/vim-interview-syntax'


Plug 'hdima/python-syntax'

"Check for new/updated bundles
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"================================================
" WRITING + GOYO
"================================================
:command Zen Goyo | SoftPencil
let g:goyo_height=90
au BufRead *.md hi clear SpellBad
au BufRead *.md hi SpellBad ctermfg=red cterm=underline
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.interview,*.vw :PencilSoft

let g:limelight_conceal_ctermfg = 'gray'

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
" execute "set colorcolumn=" . join(range(81,335), ',')

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

"ctrl+r to replace highlighted text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"===============================================================================
" Function Key Mappings
"===============================================================================

" <F2>: Open Vimfiler

" <F3>: Gundo
nnoremap <F3> :<C-u>UndotreeToggle<CR>

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

" <Leader>v: Fast editing of the .vimrc
nnoremap <Leader>vv :e! /Users/nikhil/docs/dotfiles/.nvimrc<cr>

:nmap <silent> <leader>d :Dark<cr>
:nmap <silent> <leader>l :Light<cr>
:nmap <silent> <leader>z :Zen<cr>

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

noremap <leader>gu :UndotreeToggle<CR>

" search for current word (to replace)
noremap <leader>sc :%s/<C-r><C-w>/
nnoremap <silent> <leader>nn :set nonumber! \| set relativenumber!<cr>

nnoremap <leader>R :RainbowParenthesesToggle

" <Leader>m: Maximize current split
nnoremap <Leader>m <C-w>_<C-w><Bar>

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

"===============================================================================
" Lightline
"===============================================================================
let g:lightline = {
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
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

if g:colors_name == "base16-gruvbox-light-hard"
  let g:lightline.colorscheme = "selenized_light"
else
  let g:lightline.colorscheme = "seoul256"
endif

function! LightLineModified()
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

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

"===============================================================================
" tmuxline
"===============================================================================

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%D'],
      \'z'    : '#H',
      \'options': {
        \'status-justify': 'left'}
      \}

:command Tmuxline lightline

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
" COC
"===============================================================================

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" autocompletion
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Keybindings
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)
nmap <silent> <leader>E <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>p :call CocActionAsync('format')<CR>

"===============================================================================
" vim-test
"===============================================================================
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

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
" Neosnippet
"===============================================================================

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets,~/.vim/plugged/vim-react-snippets/snippets,~/.vim/plugged/vim-interview-syntax/snippets'

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
" Vimwiki
"===============================================================================
autocmd BufRead,BufNewFile ~/Dropbox/vimwiki/* set filetype=vimwiki

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki',
        \ 'syntax': 'markdown', 'ext': '.md'}]

nmap <Leader>wp :Files ~/Dropbox/vimwiki<CR>

"===============================================================================
" Custom commands
"===============================================================================
:command Ipysource source ~/docs/dotfiles/.vim/bundle/vim-ipython/ftplugin/python/ipy.vim

let g:jsdoc_default_mapping=0
