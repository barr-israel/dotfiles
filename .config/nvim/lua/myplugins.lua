require("NeoColumn").setup({always_on = true})
require('hlslens').setup() 
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    highlight = {
        'RainbowDelimiterCyan',
        'RainbowDelimiterViolet',
        'RainbowDelimiterOrange',
        'RainbowDelimiterBlue',
        'RainbowDelimiterGreen',
        'RainbowDelimiterYellow',
        'RainbowDelimiterRed',
    },
}
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'lua', 'vim', 'vimdoc', 'python'},
    auto_install = true,
    highlight = {
        enable=true,
    }
})
require('gitsigns').setup()
require('dashboard').setup({shortcut_type="number", change_to_vcs_root=true})
vim.keymap.set({'n'}, '<S-Space>', ":SnipRun<CR>j", {noremap=true})
vim.keymap.set({'i'}, '<S-Space>', "<C-o>:SnipRun<CR><C-o>j", {noremap=true})
vim.keymap.set({'v'}, '<S-Space>', ":'<,'>SnipRun<CR>j", {noremap=true})
require('neogit').setup()
vim.keymap.set({'n', 'v', 'i'}, '<C-g>', ":Neogit<CR>", {noremap=true})
require("nvim-lightbulb").setup({ autocmd = { enabled = true }, sign = { enabled = false}, virtual_text = {enabled = true, text='A'}})
code_action_menu = require('code_action_menu')
vim.keymap.set({'n'}, '<F4>', code_action_menu.open_code_action_menu, {})
lint = require('lint')
lint.linters_by_ft = {
  python = {'pycodestyle',}
}
vim.keymap.set({'n'}, '<F5>', lint.try_lint, {})
