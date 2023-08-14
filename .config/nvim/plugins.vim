call plug#begin()
Plug 'lambdalisue/suda.vim'
Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
Plug 'folke/tokyonight.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ecthelionvi/NeoColumn.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'dstein64/nvim-scrollview'
Plug 'HiPhish/rainbow-delimiters.nvim'
Plug 'debugloop/telescope-undo.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'michaelb/sniprun', {'do': 'sh ./install.sh'}
Plug 'NeogitOrg/neogit'
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'     " Required
Plug 'hrsh7th/cmp-nvim-lsp' " Required
Plug 'L3MON4D3/LuaSnip'     " Required
Plug 'psf/black', {'branch': 'stable'}
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'kosayoda/nvim-lightbulb'
Plug 'weilbith/nvim-code-action-menu'
Plug 'mfussenegger/nvim-lint'
call plug#end()
lua require('mytelescope')
lua require('myplugins')
lua require('mylsp')
