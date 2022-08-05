"------------------------------------------
" TODO:
"------------------------------------------
" maybe try vinegar
" configure fzf and telescope to play nicely together (or just use one of them
" idk how that works anymore, but basically telescope only does things within
" the current dir and fzf doesn't give a preview. Some kind of best-of-both
" would be great)


"------------------------------------------
" General
"------------------------------------------
set textwidth=79
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set wrap
set formatoptions=tcqrn1
set hidden
set noswapfile
set list
set listchars=tab:▸\ ,trail:·
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set ttyfast
set laststatus=2
set showmode
set showcmd
set wildmenu
set guifont=calling\ code:h13
set scrolloff=3
set ttimeout
set ttimeoutlen=100
set encoding=utf-8
set modelines=0
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set number
set ruler
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" Cursor motion
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim

" no tearoff menu entries
if has('win32')
    set guioptions-=t
endif

if &compatible
	set nocompatible
endif

"vms stuff
if has ("vms")
    set nobackup " do not keep a backup file, use versions instead
else
    set backup "keep a backup file :)
    if has('persistent_undo')
        set undofile "keep an undo file (to undo changes after closing)
    endif
endif

" let tabs open in current dir
function! WorkingDir()
    let file = getcwd()
    execute "e ".fnameescape(file)
endfun

" Only set syntax highlighting once!
if !exists("g:syntax_on")
	syntax enable
endif

"------------------------------------------
" Key Maps
"------------------------------------------
" TODO: switching between windows can be a pain? Maybe even a leader key window
" maker?

let mapleader = "," 

nmap <leader>ve :edit ~\AppData\Local\nvim\init.vim<cr>
nmap <leader>vr :source ~\AppData\Local\nvim\init.vim<cr>

nmap <leader>q :bufdo bdelete<cr>

"allow gf to open non-existent files
map gf :edit <cfile><cr>

"Reselect visual selection after indenting
vnoremap < <gv
vnoremap >gv

"Open the current file in the default program
nmap <leader>x :!%<cr><cr>

nnoremap j gj
nnoremap k gk
nnoremap / /\v
vnoremap / /\v
map <leader><space> :let @/=''<cr> 
noremap <leader>n :%s///n<CR>

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>t :tabnew<cr>:call WorkingDir()<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

map <leader>l :set list!<CR>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" environment variables
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrrc"

set path=.,**

"------------------------------------------
" Plugins
"------------------------------------------

" Helps force plugins to load correctly when it is turned back on below
filetype off

if has('langmap') && exists('+langremap')
    " prevent that the langmap option applies to characters
    " that result from mapping. If it's set some plugins will break
    set nolangremap
endif

" For plugins to load correctly
filetype plugin indent on

" load plugins :)

call plug#begin('~/AppData/Local/nvim/plugged')
source ~\AppData\Local\nvim\.plug_configs\treesitter.vim
source ~\AppData\Local\nvim\.plug_configs\plenary.vim
source ~\AppData\Local\nvim\.plug_configs\cosmic_latte.vim
source ~\AppData\Local\nvim\.plug_configs\vimwiki.vim
source ~\AppData\Local\nvim\.plug_configs\bullets.vim
source ~\AppData\Local\nvim\.plug_configs\fzf.vim
source ~\AppData\Local\nvim\.plug_configs\telescope.vim
source ~\AppData\Local\nvim\.plug_configs\floaterm.vim
source ~\AppData\Local\nvim\.plug_configs\nvim-notify.vim
source ~\AppData\Local\nvim\.plug_configs\hardtime.vim
source ~\AppData\Local\nvim\.plug_configs\fugitive.vim
source ~\AppData\Local\nvim\.plug_configs\lightline.vim
source ~\AppData\Local\nvim\.plug_configs\surround.vim


"Was too invasive
"source ~\AppData\Local\nvim\.plug_configs\nerd-tree.vim

"couldn't figure out where he wants the setup defines
" source ~\AppData\Local\nvim\.plug_configs\bad-practices.vim

" Airline just took a bit too much work to set up
" source ~\AppData\Local\nvim\.plug_configs\vim-airline.vim


call plug#end()
doautocmd User PlugLoaded

source ~\AppData\Local\nvim\.plug_configs\diffexpr.vim
"------------------------------------------
" Aesthetics
"------------------------------------------

" I don't wanna start just anywhere:
:cd ~\Documents
