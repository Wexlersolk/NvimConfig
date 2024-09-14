return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "m", function()
			harpoon:list():add()
		end)

		vim.keymap.set("n", "<leader>m", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<dm>", function()
			harpoon:list():next()
		end)

		local symbols = { "&", "[", "{", "}", "(" }
		for i, symbol in ipairs(symbols) do
			vim.keymap.set("n", symbol, function()
				harpoon:list():select(i)
			end)
		end
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
