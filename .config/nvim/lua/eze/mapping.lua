vim.cmd([[
let maplocalleader= ","
map <space> <leader>
]])

local opts = { noremap = true, silent = true }

-- Go to normal mode on terminal with ESC
vim.api.nvim_set_keymap("t", "<esc>", '<C-\\><C-n>', opts)

-- Go to insert mode on insert with jk
vim.api.nvim_set_keymap("i", "jk", "<esc>", opts)

-- Remove highlight on esc
vim.api.nvim_set_keymap("n", "<esc>", "<cmd>nohlsearch<cr>", opts)

-- Only get from the cursor with Y
vim.api.nvim_set_keymap("n", "Y", "y$", opts)

-- Search for the selected text
vim.api.nvim_set_keymap("v", "*", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts)

vim.api.nvim_set_keymap("n", "<s-tab>", "<cmd>BufferLineCycleNext<CR>>", opts)

-- Github copilot
-- vim.cmd([[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]])
-- vim.cmd([[let g:copilot_no_tab_map = v:true]])

-- " Command line search with text (10x mieux)
vim.cmd([[
cnoremap <expr> <c-n> wildmenumode() ? "\<c-n>" : "\<down>"
cnoremap <expr> <c-p> wildmenumode() ? "\<c-p>" : "\<up>"
]])
