local keymap = vim.keymap -- for conciseness
vim.api.nvim_set_keymap("n", ",", "w", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<BS>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "`", ":bnext<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "N", "n", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "T", "N", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", ".", "gcc", { noremap = false }) -- Comment current line
vim.api.nvim_set_keymap("v", ".", "gc", { noremap = false }) -- Comment selection
vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<space>e", [[:execute "normal! vi{"<CR>]], { noremap = true, silent = true })

-- Normal mode: Paste at the cursor position (not before or above)
vim.api.nvim_set_keymap("n", "p", "p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "P", "P", { noremap = true, silent = true })

-- Visual mode: Replace selected text with the pasted content
vim.api.nvim_set_keymap("v", "p", "p", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "P", "P", { noremap = true, silent = true })

vim.api.nvim_set_keymap("x", "p", '"_dP', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

vim.keymap.set("n", "<leader>pb", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>pm", "oif err != nil {<CR>}<Esc>Olog.Fatal(err)<Esc>")

vim.keymap.set("n", "Y", "bvwy", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", "$a;<Esc>", { noremap = true, silent = true })
vim.api.nvim_command("set autoindent")

vim.api.nvim_set_keymap("n", "<leader>;", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>,", ":w<CR>", { noremap = true, silent = true })

-- Change move keys
vim.api.nvim_set_keymap("v", "n", "<left>", { silent = true })
vim.api.nvim_set_keymap("v", "h", "<down>", { silent = true })
vim.api.nvim_set_keymap("v", "t", "<up>", { silent = true })
vim.api.nvim_set_keymap("v", "s", "<right>", { silent = true })
vim.api.nvim_set_keymap("n", "n", "<left>", { silent = true })
vim.api.nvim_set_keymap("n", "h", "<down>", { silent = true })
vim.api.nvim_set_keymap("n", "t", "<up>", { silent = true })
vim.api.nvim_set_keymap("n", "s", "<right>", { silent = true })

--moving stuff around
vim.keymap.set("v", "H", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "T", ":m '>-2<CR>gv=gv")

-- clear search highlights
keymap.set("n", "<leader>c", ":nohl<CR>")
keymap.set("n", "O", "<Esc>o", { noremap = true, silent = true })
keymap.set("n", "<CR>", "O")
--newline in i
vim.keymap.set("i", "<C-CR>", "<Esc>O", { noremap = true, silent = true })
vim.keymap.set("i", "<c-o>", "<Esc>o", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "o", "o <BS><Esc>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", ",", "w", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "V", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "v", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "V", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "v", "$", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "l", "s", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "k", "v", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "V", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>z", ":%y+<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "ggVG", { noremap = true, silent = true })
-- delete single character without copying into register
--
keymap.set("n", "q", '"_x')

vim.api.nvim_set_keymap("v", "d", '"_d', { noremap = true, silent = true }) -- end of the line in visual mode
vim.api.nvim_set_keymap("n", "d,", [["_daw]<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "y,", [[:let @"=@:<CR>yiw]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "dd", '"_dd', { noremap = true })

-- window management
keymap.set("n", "<leader>\\", "<C-w>v") -- split window vertically

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", "<C-w>l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", "<C-w>t", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-s>", "<C-w>b", { noremap = true, silent = true })

vim.api.nvim_set_keymap("i", "<C-h>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-t>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-n>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Right>", { noremap = true, silent = true })

keymap.set("n", "<leader>oo", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>oh", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>ot", ":tabn<CR>") --  go to next tab

-- vim-maximizer

-- nvim-tree
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization
--keymap.set("n", "<leader>e", ":Fern . -drawer<CR>") -- toggle file explorer
keymap.set("n", "<leader>ss", ":SessionSave<CR>") -- save session
keymap.set("n", "<leader>rr", ":SessionRestore<CR>") -- restore session

--Terminal stuff
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>x",
	":belowright split term://cd %:p:h && $SHELL<CR>",
	{ noremap = true, silent = true }
)

vim.api.nvim_set_keymap("n", "<leader>r", ":LspRestart<CR>", { noremap = true, silent = true })

--GAMES
-- Define custom commands
vim.cmd("command! Mines :Nvimesweeper")
vim.cmd("command! DC %s/\\/\\/.*$//g | nohlsearch")
vim.cmd("command! Minesweeper :Nvimesweeper")

-- Remap commands that originally use `[` to `]`
vim.keymap.set("n", "]c", "[c", { noremap = true, silent = true })
vim.keymap.set("n", "]d", "[d", { noremap = true, silent = true })
vim.keymap.set("n", "]f", "[d", { noremap = true, silent = true })
--
vim.keymap.del("n", "[d")

---comment
vim.api.nvim_set_keymap("n", ":comment", ":'<,'>s/^/# /<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ":uncomment", ":'<,'>s/^#\\s\\?//<CR>", { noremap = true, silent = true })

-- Disable specific normal mode mappings by mapping them to <nop>
