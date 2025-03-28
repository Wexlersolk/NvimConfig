return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		local Path = require("plenary.path")

		-- Function to get the current Git repository root
		local function get_git_root()
			local git_dir = vim.fn.finddir(".git", ".;")
			if git_dir ~= "" then
				return Path:new(git_dir):parent():absolute()
			end
			return vim.fn.getcwd()
		end

		-- Function to get a unique list name for the current Git repository
		local function get_repo_list_name()
			local repo_root = get_git_root()
			local repo_hash = vim.fn.sha256(repo_root)
			return "repo_" .. repo_hash:sub(1, 8)
		end

		-- Setup Harpoon
		harpoon:setup()

		-- Create a persistent storage for multiple lists
		local lists = {}

		-- Modify keymaps to use repository-specific list
		vim.keymap.set("n", "m", function()
			local list_name = get_repo_list_name()

			-- Ensure the list exists
			if not lists[list_name] then
				lists[list_name] = harpoon:list(list_name)
			end

			lists[list_name]:add()
		end, { desc = "Add file to repository-specific Harpoon list" })

		vim.keymap.set("n", "<leader>m", function()
			local list_name = get_repo_list_name()

			-- Ensure the list exists
			if not lists[list_name] then
				lists[list_name] = harpoon:list(list_name)
			end

			harpoon.ui:toggle_quick_menu(lists[list_name])
		end, { desc = "Toggle Harpoon menu for current repository" })

		vim.keymap.set("n", "<dm>", function()
			local list_name = get_repo_list_name()

			-- Ensure the list exists
			if not lists[list_name] then
				lists[list_name] = harpoon:list(list_name)
			end

			lists[list_name]:next()
		end, { desc = "Go to next file in repository-specific Harpoon list" })

		-- Keymaps for selecting files (using symbols)
		local symbols = { "%", "7", "5", "3", "1", "9", "0", "2", "4", "6" }
		for i, symbol in ipairs(symbols) do
			vim.keymap.set("n", symbol, function()
				local list_name = get_repo_list_name()

				-- Ensure the list exists
				if not lists[list_name] then
					lists[list_name] = harpoon:list(list_name)
				end

				lists[list_name]:select(i)
			end, {
				noremap = true,
				silent = true,
				remap = true,
				desc = string.format("Select file %d in repository-specific Harpoon list", i),
			})
		end
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
