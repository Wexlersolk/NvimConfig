return {
	-- Telescope and dependencies
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"exosyphon/telescope-color-picker.nvim",
			"debugloop/telescope-undo.nvim",
			"aaronhallaert/advanced-git-search.nvim",
			"AckslD/nvim-neoclip.lua",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"mbbill/undotree",
			"windwp/nvim-autopairs",
			"ibhagwan/fzf-lua",
			"joshmedeski/telescope-smart-goto.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>uu", function()
				builtin.find_files({ cwd = vim.fn.expand("%:p:h") })
			end, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>ui", function()
				require("telescope").extensions.live_grep_args.live_grep_args({
					cwd = vim.fn.expand("%:p:h"),
				})
			end, { desc = "Live Grep" })

			vim.keymap.set("n", "<leader>uk", function()
				require("telescope.builtin").live_grep({
					glob_pattern = "!{spec,test}",
					cwd = vim.fn.expand("%:p:h"),
				})
			end, { desc = "Live Grep Code" })
			-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
			-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help Tags" })
			-- vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })
			vim.keymap.set("n", "<leader>ug", "<cmd>AdvancedGitSearch<CR>", { desc = "AdvancedGitSearch" })
			-- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find Old Files" })
			-- vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find Word under Cursor" })
			-- vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Search Git Commits" })
			-- vim.keymap.set("n", "<leader>gb", builtin.git_bcommits, { desc = "Search Git Commits for Buffer" })
			-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
					layout_config = { width = 0.7 },
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			local telescope = require("telescope")
			local telescopeConfig = require("telescope.config")

			-- Clone the default Telescope configuration
			local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

			-- I want to search in hidden/dot files.
			table.insert(vimgrep_arguments, "--hidden")
			-- I don't want to search in the `.git` directory.
			table.insert(vimgrep_arguments, "--glob")
			table.insert(vimgrep_arguments, "!**/.git/*")

			local actions = require("telescope.actions")

			local select_one_or_multi = function(prompt_bufnr)
				local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
				local multi = picker:get_multi_selection()
				if not vim.tbl_isempty(multi) then
					require("telescope.actions").close(prompt_bufnr)
					for _, j in pairs(multi) do
						if j.path ~= nil then
							vim.cmd(string.format("%s %s", "edit", j.path))
						end
					end
				else
					require("telescope.actions").select_default(prompt_bufnr)
				end
			end

			telescope.setup({
				defaults = {
					-- `hidden = true` is not supported in text grep commands.
					vimgrep_arguments = vimgrep_arguments,
					path_display = { "truncate" },
					mappings = {
						n = {
							["<C-,>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
						i = {
							["<C-t>"] = actions.move_selection_previous, -- move to prev result
							["<C-d>"] = actions.select_tab, -- move to prev result
							["<C-h>"] = actions.move_selection_next, -- move to next result
							["<C-'>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
							["<C-s>"] = actions.cycle_history_next,
							["<C-n>"] = actions.cycle_history_prev,
							["<CR>"] = select_one_or_multi,
							["<C-S-d>"] = actions.delete_buffer,
							["<C-o>"] = actions.cycle_previewers_next,
							["<C-a>"] = actions.cycle_previewers_prev,
						},
					},
				},
				pickers = {
					find_files = {
						-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
				extensions = {
					undo = {
						use_delta = true,
						use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
						side_by_side = false,
						diff_context_lines = vim.o.scrolloff,
						entry_format = "state #$ID, $STAT, $TIME",
						mappings = {
							i = {
								["<C-cr>"] = require("telescope-undo.actions").yank_additions,
								["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
								["<cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			})

			require("telescope").load_extension("fzf")

			require("telescope").load_extension("ui-select")

			vim.g.zoxide_use_select = true

			require("telescope").load_extension("undo")

			require("telescope").load_extension("advanced_git_search")

			require("telescope").load_extension("live_grep_args")

			require("telescope").load_extension("colors")
		end,
	},
}
