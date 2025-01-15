return {
	{
		"smoka7/hop.nvim",
		version = "*",
		opts = {
			keys = "etovxqpdygfblzhckisuran", -- Define the keys for navigation
		},
		config = function()
			-- Load the hop module
			local hop = require("hop")
			hop.setup({
				keys = "etovxqpdygfblzhckisuran", -- Your preferred keys
			})

			-- Keymaps for hop.nvim
			local map = vim.api.nvim_set_keymap
			local opts = { noremap = true, silent = true }

			-- Jump to any word in the current buffer
			map("n", "e", ":HopWord<CR>", opts) -- Normal mode
			map("v", "e", ":HopWord<CR>", opts) -- Visual mode

			-- Additional useful mappings for hop.nvim
			map("n", "<Space>w", ":HopWordCurrentLine<CR>", opts) -- Jump to any word on the current line
		end,
	},
}
