local function s(mode, lhs, rhs, opts)
	if type(opts) == "string" then
		opts = { desc = opts }
	elseif opts == nil then
		opts = {}
	end

	if type(lhs) == "table" then
		for _, key in ipairs(lhs) do
			vim.keymap.set(mode, key, rhs, opts)
		end
	else
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end
local all = { "n", "v", "i" }
s("n", "<Space>", "<Nop>", { silent = true })
s("n", "<Esc>", vim.cmd.nohlsearch, "Clear search results")
s("n", "<leader>q", vim.cmd.qa, "Quit neovim")
s("n", "<C-u>", require("undotree").open, "Toggle Undo Tree")
s("n", "<S-u>", vim.cmd.redo, "Redo")
s("n", "<leader>cf", vim.lsp.buf.format, "Format Current Buffer")

-- find & replace
s("n", "R", ":s/", "Replace in line")
s("v", "R", 'y:%s/<c-r>"/', "Replace selection")
s("n", "<c-r>", ":%s/", "Replace")
s("v", "<c-r>", ":s/", "Replace in selection")

s(all, "<C-S-S>", function()
	vim.cmd.stopinsert()
	vim.cmd.command("noautocmd update")
end, "Save Buffer Without Formatting")
s(all, "<C-s>", function()
	vim.cmd.stopinsert()
	vim.cmd.up()
end, "Save Buffer")
s("n", "<M-r>", ":restart<CR>", "Restart Neovim")

-- Move Lines
s("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move Down")
s("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move Up")
s("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move Down")
s("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move Up")
s("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move Down")
s("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move Up")

-- buffers
s("n", "<leader>bb", "<cmd>e #<cr>", "Switch to Other Buffer")
s("n", "<C-w>", vim.cmd.bd, "Delete current buffer")
-- core
s("n", { "<leader>/", "<leader>sg" }, Snacks.picker.grep, "Grep (Root Dir)")
s("n", { "<leader>:", "<leader>sc" }, Snacks.picker.command_history, "Command History")
s("n", "<leader>e", Snacks.picker.explorer, "Find Files (Root Dir)")
s("n", { "<leader><space>", "<leader>ff" }, Snacks.picker.files, "Find Files (Root Dir)")
s("n", "<leader>n", Snacks.picker.notifications, "Notification History")

-- find
s("n", "<leader>fb", function()
	Snacks.picker.buffers({ hidden = true, nofile = true })
end, "Buffers (all)")
s("n", "<leader>fF", function()
	Snacks.picker.files({ cwd = vim.uv.cwd() })
end, "Find Files (cwd)")
s("n", "<leader>fg", Snacks.picker.git_files, "Find Files (git-files)")
s("n", "<leader>fr", Snacks.picker.recent, "Recent")
s("n", "<leader>fR", function()
	Snacks.picker.recent({ filter = { cwd = true } })
end, "Recent (cwd)")
s("n", "<leader>fp", Snacks.picker.projects, "Projects")

-- git
s("n", "<leader>gd", Snacks.picker.git_diff, "Git Diff (hunks)")
s("n", "<leader>gD", function()
	Snacks.picker.git_diff({ base = "origin", group = true })
end, "Git Diff (origin)")
s("n", "<leader>gs", Snacks.picker.git_status, "Git Status")
s("n", "<leader>gS", Snacks.picker.git_stash, "Git Stash")
--
-- grep / search
s("n", "<leader>sb", Snacks.picker.lines, "Buffer Lines")
s("n", "<leader>sB", Snacks.picker.grep_buffers, "Grep Open Buffers")
s("n", "<leader>sG", function()
	Snacks.picker.grep({ cwd = vim.uv.cwd() })
end, "Grep (cwd)")
s({ "n", "x" }, "<leader>sw", Snacks.picker.grep_word, "Visual selection or word (Root Dir)")
s({ "n", "x" }, "<leader>sW", function()
	Snacks.picker.grep_word({ cwd = vim.uv.cwd() })
end, "Visual selection or word (cwd)")

-- search
s("n", '<leader>s"', Snacks.picker.registers, "Registers")
s("n", "<leader>s/", Snacks.picker.search_history, "Search History")
s("n", "<leader>sa", Snacks.picker.autocmds, "Autocmds")
s("n", "<leader>sC", Snacks.picker.commands, "Commands")
s("n", "<leader>sd", Snacks.picker.diagnostics, "Diagnostics")
s("n", "<leader>sD", Snacks.picker.diagnostics_buffer, "Buffer Diagnostics")
s("n", "<leader>sh", Snacks.picker.help, "Help Pages")
s("n", "<leader>sH", Snacks.picker.highlights, "Highlights")
s("n", "<leader>si", Snacks.picker.icons, "Icons")
s("n", "<leader>sj", Snacks.picker.jumps, "Jumps")
s("n", "<leader>sk", Snacks.picker.keymaps, "Keymaps")
s("n", "<leader>sl", Snacks.picker.loclist, "Location List")
s("n", "<leader>sM", Snacks.picker.man, "Man Pages")
s("n", "<leader>sm", Snacks.picker.marks, "Marks")
s("n", "<leader>sq", Snacks.picker.qflist, "Quickfix List")

-- ui
s("n", "<leader>uC", Snacks.picker.colorschemes, "Colorschemes")

-- lsp
-- s("i", "<C-Space>", vim.lsp.completion.get, "Trigger Autocomplete")
s("n", "<leader>cl", Snacks.picker.lsp_config, "Lsp Info")

s("n", "gd", vim.lsp.buf.definition, "Goto Definition")
s("n", "gr", vim.lsp.buf.references, "References")
s("n", "gI", vim.lsp.buf.implementation, "Goto Implementation")
s("n", "gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition")
s("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")

s("n", "K", vim.lsp.buf.hover, "Hover")
s("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
s("i", "<c-k>", vim.lsp.buf.signature_help, "Signature Help")

s({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code Action")
s({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
s("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")

s("n", "<leader>cR", Snacks.rename.rename_file, "Rename File")
s("n", "<leader>cr", vim.lsp.buf.rename, "Rename")

s("n", "<leader>cA", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source" },
			diagnostics = {},
		},
	})
end, "Source Action")

s("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, "Next Reference")

s("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, "Prev Reference")

s("n", "<a-n>", function()
	Snacks.words.jump(vim.v.count1, true)
end, "Next Reference")

s("n", "<a-p>", function()
	Snacks.words.jump(-vim.v.count1, true)
end, "Prev Reference")

s("n", "<leader>co", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.organizeImports" },
			diagnostics = {},
		},
	})
end, "Organize Imports")
