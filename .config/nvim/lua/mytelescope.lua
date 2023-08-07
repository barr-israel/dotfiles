local builtin = require('telescope.builtin')
vim.keymap.set({'n', 'v', 'i'}, '<M-e>', builtin.find_files, {})
vim.keymap.set({'n', 'v', 'i'}, '<M-f>', builtin.live_grep, {})
vim.keymap.set({'n', 'v', 'i'}, '<C-b>', builtin.buffers, {})
vim.keymap.set({'n', 'v', 'i'}, '<M-g>', ":Telescope git_files<CR>", {noremap=true})
vim.keymap.set({'n', 'v', 'i'}, '<M-d>', ":Telescope lsp_definitions<CR>", {})
vim.keymap.set({'n', 'v', 'i'}, '<M-r>', ":Telescope lsp_references<CR>", {})
vim.keymap.set({'n', 'v', 'i'}, '<M-s>', ":Telescope lsp_document_symbols<CR>", {})
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions
require("telescope").setup{
    defaults = {
        mappings = {
            n = {
                ["<C-p>"] = action_layout.toggle_preview,
            },
            i = {
                ['<C-c>'] = require('telescope.actions').delete_buffer,
                ["<C-p>"] = action_layout.toggle_preview,
                ["<Esc>"] = actions.close
            },
        },
        preview = {
            mime_hook = function(filepath, bufnr, opts)
                local is_image = function(filepath)
                    local image_extensions = {'png','jpg'}   -- Supported image formats
                    local split_path = vim.split(filepath:lower(), '.', {plain=true})
                    local extension = split_path[#split_path]
                    return vim.tbl_contains(image_extensions, extension)
                end
                if is_image(filepath) then
                    local term = vim.api.nvim_open_term(bufnr, {})
                    local function send_output(_, data, _ )
                        for _, d in ipairs(data) do
                            vim.api.nvim_chan_send(term, d..'\r\n')
                        end
                    end
                    vim.fn.jobstart(
                    {
                        'chafa', '--center=on', filepath  -- Terminal image viewer command
                    }, 
                    {on_stdout=send_output, stdout_buffered=true, pty=true, width=80, height=100})
                else
                    require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
                end
            end
        },
    },
    extensions = {
        file_browser = {
            --theme = "ivy",
            hijack_netrw = true,
            cwd_to_path = true,
            hidden = true,
            prompt_path = true,
            mappings = {
                ["i"] = {
                    ["<C-t>"] = actions.select_tab,
                    ["<C-c>"] = fb_actions.change_cwd,
                },
                ["n"] = {
                    ["<C-t>"] = actions.select_tab,
                    ["<C-c>"] = fb_actions.change_cwd,
                },
            },
        },
        undo = {
            use_delta = true,
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
                preview_height = 0.7,
            },
            diff_context_lines = 10,
            entry_format = "state #$ID, $STAT, $TIME",
            time_format = "",
            mappings = {
                i = {
                    -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
                    -- you want to replicate these defaults and use the following actions. This means
                    -- installing as a dependency of telescope in it's `requirements` and loading this
                    -- extension from there instead of having the separate plugin definition as outlined
                    -- above.
                    ["<cr>"] = require("telescope-undo.actions").yank_additions,
                    ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                    ["<C-cr>"] = require("telescope-undo.actions").restore,
                },
            },
        },
    },
}
require("telescope").load_extension("file_browser")
vim.keymap.set({'n', 'v', 'i'}, '<C-e>', ":Telescope file_browser path=%:h select_buffer=true<CR>", {noremap=true})
require("telescope").load_extension("undo")
vim.keymap.set({'n', 'v', 'i'}, '<C-u>', ":Telescope undo<CR>", {noremap=true})
