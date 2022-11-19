--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

P = function(v)
    print(vim.inspect(v))

    return v
end

vim.cmd([[
function! TodoCurrent ()
    let git=system("git rev-parse --show-toplevel")
    let branch=system("git branch --show-current")
    echo substitute (branch, "\", "_")

    echo ('~/.local/todos/' . branch . '.todo')
endfunction
]])

vim.cmd([[
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_diff_background = 1
    let g:nord_underline = 1
    let g:nord_contrast = 1
]])

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.transparent_window = true
lvim.list = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- Custom settings
vim.opt.autowrite = true
vim.opt.autowriteall = true
vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '~', nbsp = '+' }
vim.opt.shiftwidth = 4
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
lvim.colorscheme = 'nord'

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
vim.g.maplocalleader = ","

-- add your own keymapping
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.hijack_directories.auto_open = false
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
-- lvim.builtin.nvimtree.setup.open_on_setup_file = false
lvim.builtin.lualine.options.theme = "papercolor_light"
lvim.builtin.lualine.sections.lualine_c = { "filename" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "css",
    "http",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "scss",
    "tsx",
    "typescript",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

local basicConfigKeymap = { noremap = true, silent = true }

vim.g.maplocalleader = ","

-- Get out insert mode
vim.api.nvim_set_keymap("i", "jk", "<esc>", basicConfigKeymap)

-- Switch between two buffers
vim.api.nvim_set_keymap("n", "<C-j>", "<C-^>", basicConfigKeymap)

-- Terminal exit mode with esc
vim.api.nvim_set_keymap("t", "<ESC>", "<C-\\><C-n>", basicConfigKeymap)

-- Search buffers
vim.api.nvim_set_keymap("n", "<tab>", ":b ", basicConfigKeymap)

-- Open terminal float
vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm<cr>", basicConfigKeymap)
vim.api.nvim_set_keymap("t", "<C-t>", "<cmd>ToggleTerm<cr>", basicConfigKeymap)

-- Only way I found to get ride of this keymap
-- vim.cmd([[tunma <C-l>]])

-- Luasnipper
local ls = require("luasnip")
vim.keymap.set({ "s", "i", }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "s", "i", }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

-- Add a ligne staying on normal mode
-- vim.api.nvim_set_keymap("n", "<CR>", "o<esc>", basicConfigKeymap)
vim.api.nvim_set_keymap("n", "<space>m", "<Plug>RestNvim", basicConfigKeymap)

-- Remove highlight on esc
vim.api.nvim_set_keymap("n", "<esc>", "<cmd>nohlsearch<CR>", basicConfigKeymap)

-- Always open all fold recursively
vim.api.nvim_set_keymap("n", "zo", "zO", basicConfigKeymap)

-- Focus the nvim tree
vim.api.nvim_set_keymap("t", "<c-l>", "<cmd>NvimTreeFocus<cr>", basicConfigKeymap)

-- TEXT OBJECTS

-- Line without the whitespaces
vim.api.nvim_set_keymap("o", "il", ":<c-u>normal! $v^<CR>", basicConfigKeymap)
vim.api.nvim_set_keymap("x", "il", ":<c-u>normal! $v^<CR>", basicConfigKeymap)


-- Inside between two same chars or first char everything except the next char
local function basic_text_objects()
    local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?' }
    for _, char in ipairs(chars) do
        for _, mode in ipairs({ 'x', 'o' }) do
            vim.api.nvim_set_keymap(mode, "i" .. char,
                string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', char, char, char)
                , { noremap = true, silent = true })
            vim.api.nvim_set_keymap(mode, "a" .. char,
                string.format(':<C-u>silent! normal! f%sF%svf%sh<CR>', char, char, char)
                , { noremap = true, silent = true })
        end
    end
end

basic_text_objects()


-- Indentation
local function select_indent(around)
    local start_indent = vim.fn.indent(vim.fn.line('.'))
    local blank_line_pattern = '^%s*$'

    if string.match(vim.fn.getline('.'), blank_line_pattern) then
        return
    end

    if vim.v.count > 0 then
        start_indent = start_indent - vim.o.shiftwidth * (vim.v.count - 1)
        if start_indent < 0 then
            start_indent = 0
        end
    end

    local prev_line = vim.fn.line('.') - 1
    local prev_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    while prev_line > 0 and (prev_blank_line(prev_line) or vim.fn.indent(prev_line) >= start_indent) do
        vim.cmd('-')
        prev_line = vim.fn.line('.') - 1
    end
    if around then
        vim.cmd('-')
    end

    vim.cmd('normal! 0V')

    local next_line = vim.fn.line('.') + 1
    local next_blank_line = function(line) return string.match(vim.fn.getline(line), blank_line_pattern) end
    local last_line = vim.fn.line('$')
    while next_line <= last_line and (next_blank_line(next_line) or vim.fn.indent(next_line) >= start_indent) do
        vim.cmd('+')
        next_line = vim.fn.line('.') + 1
    end
    if around then
        vim.cmd('+')
    end
end

vim.api.nvim_set_keymap("o", "ii", ":<c-u>lua select_indent()<CR>", basicConfigKeymap)
vim.api.nvim_set_keymap("o", "ai", ":<c-u>lua select_indent(1)<CR>", basicConfigKeymap)
vim.api.nvim_set_keymap("x", "ii", ":<c-u>lua select_indent()<CR>", basicConfigKeymap)
vim.api.nvim_set_keymap("x", "ai", ":<c-u>lua select_indent(1)<CR>", basicConfigKeymap)


-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- TOP 5 Primagen ❤️
-- https://www.youtube.com/watch?v=hSHATqh8svM

-- -- Always center search on middle of screen
vim.api.nvim_set_keymap("n", "n", "nzzzv", basicConfigKeymap)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", basicConfigKeymap)
vim.api.nvim_set_keymap("n", "J", "mzJ`z", basicConfigKeymap)

-- -- Undo chunk in insert
vim.api.nvim_set_keymap("i", "<CR>", "<CR><c-g>u", basicConfigKeymap)
vim.api.nvim_set_keymap("i", ";", ";<c-g>u", basicConfigKeymap)

-- -- Moving text
-- vim.api.nvim_set_keymap("n", "<leader>j", ":m .+2<CR>==", basicConfigKeymap)
-- vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<CR>==", basicConfigKeymap)

-- -- Quotes visual selection
vim.api.nvim_set_keymap("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>", basicConfigKeymap)
vim.api.nvim_set_keymap("v", "<leader>5", "<esc>`>a )<esc>`<i( <esc>", basicConfigKeymap)


-- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Override of wichkeys
-- from https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/core/which-key.lua
lvim.builtin.which_key.mappings[" "] = {
    x = {
        ":w<CR>:source %<CR>", "Source current buffer"
    },
    t = {
        "<Plug>PlenaryTestFile", "Run test from current buffer"
    },
}

lvim.builtin.which_key.mappings["h"] = ":ls<cr>:b<space>"

lvim.builtin.which_key.mappings.l.r = {
    "<cmd>Telescope lsp_references<CR>", "References"
}

lvim.builtin.which_key.mappings.b.c = {
    "<cmd>bd<CR>", "Close current buffer"
}

lvim.builtin.which_key.mappings.b.d = {
    "<cmd>DBUIToggle<CR>", "Toggle db client"
}

lvim.builtin.which_key.mappings.k = {
    "<cmd>NvimTreeFocus<CR>", "Focus on NvimTree"
}

lvim.builtin.which_key.mappings.s.g = {
    "<cmd>Telescope live_grep<CR>", "Search in files"
}

lvim.builtin.which_key.mappings.s.n = {
    "<cmd>lua require('telescope').extensions.notify.notify()<CR>", "See notifications"
}

lvim.builtin.which_key.mappings.w = { name = "Window"
    , e = { "<C-W>=", "Equalize windows size" }
    , f = { "<C-W>|", "Set current window to full width" }
    , h = { "<C-W>h", "Go to left window" }
    , j = { "<C-W>j", "Go to bottom window" }
    , k = { "<C-W>k", "Go to top window" }
    , l = { "<C-W>l", "Go to right window" }
    , o = { "<C-W>o", "Keep only the current window" }
    , s = { "<C-W>K", "Make horizontal to vertical" }
    , v = { "<C-W>v", "Split vertically the current buffer" }
    , w = { "<C-W>w", "Switch windows" }
}
lvim.builtin.which_key.mappings.w['+'] = { "<C-W>>50", "Increase windows width" }
lvim.builtin.which_key.mappings.w['-'] = { "<C-W><50", "Decrease windows width" }

lvim.builtin.which_key.mappings.n = { name = "Custom stuff"
    , s = { "vip:sort<CR>", "Sort current paragraph" }
    , p = { "o<esc>\"%pyiWdd%", "Copy current path file on register" }
}


lvim.builtin.which_key.mappings.g.a = { "<cmd>Git add %<CR>", "Stage current file" }
lvim.builtin.which_key.mappings.g.b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" }
lvim.builtin.which_key.mappings.g.c = { "<cmd>Git commit<CR>", "Commit" }
lvim.builtin.which_key.mappings.g.D = { "<cmd>Telescope git_commits<CR>", "Checkout commit" }
lvim.builtin.which_key.mappings.g.d = {
    "<cmd>Telescope git_bcommits<CR>",
    "Checkout commit(for current file)",
}
lvim.builtin.which_key.mappings.g.f = { "<cmd>Telescope git_bcommits<CR>", "Show current buffer commits" }
lvim.builtin.which_key.mappings.g.g = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" }
lvim.builtin.which_key.mappings.g.l = { "<cmd>Git blame<CR>", "Blame all file" }
lvim.builtin.which_key.mappings.g.o = { "<cmd>Git log -100<CR>", "Show logs" }
lvim.builtin.which_key.mappings.g.p = { "<cmd>Git push<CR>", "push" }
lvim.builtin.which_key.mappings.g.s = { "<cmd>Gedit :<CR>", "status" }
lvim.builtin.which_key.mappings.g.w = { "<cmd>Telescope git_branches<CR>", "Switch branch" }
lvim.builtin.which_key.mappings.g.v = { "<cmd>Gitsigns preview_hunk<CR>", "Preview hunk" }
lvim.builtin.which_key.mappings.g.z = {
    name = "Git stash",
    s = { "<cmd>Git stash<CR>", "Stash" },
    p = { "<cmd>Git stash pop<CR>", "Stash pop" },
}

lvim.builtin.which_key.mappings.s.u = {
    "<cmd>UndotreeToggle<CR>",
    "Toggle Undo tree",
}

-- -- -- -- -- -- -- -- -- -- -- -- --
-- ELM keymap

lvim.builtin.which_key.mappings["E"] = {
    name = "Elm stuff",
    l = { "<cmd>silent !firefox https://package.elm-lang.org/packages/elm/core/latest/List<CR>", "List" },
    b = { "<cmd>silent !firefox https://package.elm-lang.org/packages/elm/core/latest/Basics<CR>", "Basics" },
    s = { "<cmd>silent !firefox https://package.elm-lang.org/packages/elm/core/latest/String<CR>", "String" },
    f = { "<cmd>silent !elm-format --yes %<CR>", "Format" },
}

lvim.builtin.which_key.mappings["H"] = {
    name = "Hello rse",
    g = { "<cmd>silent !firefox https://gitlab.richcongress.io/private/hellorse/-/merge_requests<CR>",
        "Open merge requests" },
    i = { "<cmd>!make issue<cr>", "Open issue on redmine" },
    f = { "<cmd>!make fix<CR>", "Fix" },
    k = { "<cmd>silent !firefox https://suivideprojets.rich-id.io/projects/educandco/agile/board<CR>", "Open kanban" },
    w = { "<cmd>TermExec cmd='hello bin/phpunit %'<CR>", "Test current file" },
}


-- Additional Plugins
lvim.plugins = {
    -- THEMES
    { "shaunsingh/nord.nvim" },

    -- -- Display lines indent
    -- { 'lukas-reineke/indent-blankline.nvim', },

    -- Substitute variants of text and handle change of case
    -- crs (snake), crm (Mixed), crp (pascal), crU (upper) etc
    { "tpope/vim-abolish" },

    { "github/copilot.vim" },

    {
        "tpope/vim-fugitive",
        cmd = {
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },


    -- Add, remove, change surrounding of a word
    -- https://github.com/tpope/vim-surround
    -- to change " to ' cs"', to remove ds",
    -- to add ysiw"
    -- need to be quickly done
    {
        "tpope/vim-surround",
        keys = { "c", "d", "y" }
    },


    -- Undo viewing
    { "mbbill/undotree"
        , config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end
    },

    -- Postman like
    -- Postman for vim
    {
        'NTBBloodbath/rest.nvim',
        commit = "e5f68db73276c4d4d255f75a77bbe6eff7a476ef",
        config = function()
            require("rest-nvim").setup({
                skip_ssl_verification = false,
                env_file = '.env',
                custom_dynamic_variables = {}
            })
        end
    },

    {
        "Ezechi3l/telescope-bashed.nvim",
        setup = function()
            vim.g.bashed_commands = {
                http = {
                    { 'fd', '-t', 'f', '-e', 'http' },
                    { ':e %s', 'lua require("rest-nvim").run()' },
                    "List all http files inside the project to run rest.nvim on one"
                },
            }
        end,
    },

    {
        'kristijanhusak/vim-dadbod-ui',
        config = function()
            vim.g.db_ui_auto_execute_table_helpers = 1
        end,
    },

    'tpope/vim-dadbod',

    'nelsyeung/twig.vim',

    -- {'jwoudenberg/elm-pair', rtp = 'editor-integrations/neovim', disable = true },
}


lvim.builtin.telescope.on_config_done = function(telescope)
    vim.g.bashed_commands = {
        http = {
            { 'fd', '-t', 'f', '-e', 'http' },
            { ':e %s', 'lua require("rest-nvim").run()' },
            "List all http files inside the project to run rest.nvim on one"
        },
        css_del = { 'fd -t f -e css', ':!rm %s' },
    }

    telescope.load_extension("bashed")
end


lvim.builtin.gitsigns.opts.current_line_blame = true

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
vim.cmd([[
augroup vimrc
  autocmd!
augroup END

command! -nargs=? DevDocs call system('firefox https://devdocs.io/#q=<args>')

autocmd vimrc FileType python,ruby,javascript,go,html,php nnoremap <buffer><leader>D :execute "DevDocs ".expand("<cword>")<CR>
]])

vim.cmd([[
augroup mygroup
	au!

  " Always save on lost focus, leavin buffe, exiting insert mode etc.
  autocmd TextChanged,InsertLeave,BufLeave,FocusLost * silent! :wa

  fun! StripTrailingWhitespace()
      " Don't strip on these filetypes
      if &ft =~ 'vim'
          return
      endif
      %s/\s\+$//e
  endfun

  autocmd BufWritePre * call StripTrailingWhitespace()
augroup END
]])

vim.cmd([[
augroup filetype_php
    autocmd!

    autocmd FileType php setlocal shiftwidth=4

    " Dump die snippet
    autocmd FileType php nnoremap <localleader>dd mmyiwodd("------", $);<esc>hPF,hP`m
    autocmd FileType php nnoremap <localleader>dp mmodd('-------------', );<esc>hPF'P`m

    " go to next variable in line
    autocmd FileType php nnoremap <localleader>n f$l

    " go to previous variables in line
    autocmd FileType php nnoremap <localleader>p F$l

    " insert ; at the end of line
    autocmd FileType php nnoremap <localleader>; mwA;<esc>`w

    " Show all fn
    " sm => Show Method
    autocmd FileType php nnoremap <localleader>sm :v/function/d<cr>


]])

vim.cmd([[
augroup filetype_elm
    autocmd!
    autocmd FileType elm nnoremap <localleader>f :!make elm-format %<cr>
    autocmd FileType elm nnoremap <localleader>d diwi(Debug.log "-------- <esc>pi -------" <esc>pi)<esc>
    autocmd FileType elm nnoremap <localleader>l viw`<iDebug.log "----------" <esc>hi
augroup END
]])

vim.cmd([[
augroup filetype_git
    autocmd!
    autocmd FileType gitcommmit setlocal spell
    autocmd FileType gitcommmit setlocal spelllang=en
augroup END
]])

vim.cmd([[
augroup filetype_yaml
    autocmd!
    autocmd FileType yaml setlocal shiftwidth=4
augroup END
]])

vim.cmd([[
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal spelllang=fr
 augroup END
 ]])


vim.cmd([[
augroup filetype_bash
    autocmd!
    autocmd FileType .zsh setlocal filetype=bash
    autocmd FileType markdown setlocal spelllang=fr
 augroup END
 ]])

vim.cmd([[
augroup filetype_twig
    autocmd!
    autocmd FileType html.twig.js.css setlocal filetype=twig
augroup END
]])

vim.cmd([[
imap <silent><script><expr> <C-e> copilot#Accept('\<CR>')
let g:copilot_no_tab_map = v:true
]])
vim.cmd([[
let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ }
]])
