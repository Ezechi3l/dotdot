local function set(key, value, append)
  if append == nil then
    append = false
  end

  if value == nil then
    value = true
  end

  if not append then
    vim.opt[key] = value

    return
  end

  vim.opt[key]:append(value)
end

-- init autocmd (pas sur du pourquoi)
-- autocmd are script run when a event is triggered
-- here we delete all script before loading the new config
-- else when loading the script directly inside neovim it will just add events
-- so with an updated event old version still exists
vim.cmd([[autocmd!]])

--scriptencoding utf-8
vim.cmd([[
filetype plugin indent on
syntax enable
]])

-- command line
set("cmdheight", 2)

-- On save le buffer quand on le quitte, edit, créée etc.
set("autowrite")
set("autowriteall")

-- Don't close buffer, just go in hidden
set("hidden")

-- Auto clipboard
set("clipboard", "unnamedplus", true)

-- Number lines
set("number")
set("relativenumber")
set("encoding", "utf-8")
set("title")
set("autoindent")
set("background", "dark")
set("backup", false)
set("hlsearch")
set("showcmd")
set("mouse", "a")
set("smartindent", true)

-- Afficher rapidement la parenthèse associée
set("showmatch")

-- set spell
set("spelllang", "fr", true)

-- Show whitespaces
set("list")
set("listchars", "tab:→ ,trail:~,nbsp:␣")

-- Affiche toujours la barre de statut
set("laststatus", 2)
set("expandtab")
set("shell", "zsh")
set("backupskip", "/tmp/*,/private/tmp/*")
set("ignorecase")
set("smartcase")

-- Be smart when using tabs
set("smarttab")
set("shiftwidth", 2)
set("tabstop", 2)
set("cursorline")

-- No Wrap lines
set("wrap", false)
set("backspace", "start,eol,indent")

-- Finding files - Search down into subfolders
set("path", "**", true)
set("wildignore", "*/node_modules/*", true)
set("wildignore", "*/vendor/*", true)

-- Display all matching files when we tab complete
set("wildmenu")

-- Add ruler on 80 columns
set("colorcolumn", { 80 })

-- Ne pas mettre à jour la vue pour les records
set("lazyredraw")

-- Faster redrawing
set("ttyfast")

-- Open new windows below the current window.
set("splitbelow")

-- Open new windows right of the current window.
set("splitright")

-- Turn off paste mode when leaving insert
-- autocmd InsertLeave * set nopaste

-- Toujours afficher 10 lignes au dessus ou en dessous du curseur
set("scrolloff", 10)
set("sidescrolloff", 10)

-- More match with %
set("matchpairs", "<:>", true)

-- Set undofile (keep modification on reboot)
set("undofile")
vim.cmd([[ set undodir=$HOME/.local/share/nvim/generate/undotreetmp/undo ]])

-- Set cursor line color on visual mode
vim.cmd([[
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
]])

-- Don't fold on open
set("foldlevel", 99)
set("foldmethod", "indent")
-- set("foldexpr", "nvim_treesitter#foldexpr()")

-- Notify required option
vim.opt.termguicolors = true

-- Comp required option
vim.o.completeopt = "menu,menuone,noselect"
