source ~/.config/nvim/remap.vim
source ~/.config/nvim/plugins.vim
colorscheme tokyonight-night
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set autowrite
set smartindent
set wildmode=longest,list
"set cc=80
filetype plugin indent on
syntax on
set clipboard=unnamedplus
set cursorline
set cursorlineopt=number
set number relativenumber
set spell
set breakindent
hi CursorLineNr cterm=NONE ctermbg=blue ctermfg=white
hi LineNr ctermfg=blue
set scrolloff=100
set confirm
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray
