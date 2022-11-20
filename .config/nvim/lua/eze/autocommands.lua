-- module from lunarvim
-- https://raw.githubusercontent.com/LunarVim/LunarVim/23df368b00bda0ed4a01fac92f7ad80998c1d34a/lua/lvim/core/autocmds.lua
--
-- @TODO Save on format should get info from the servers installed
-- @TODO convert autocommands to lua

local M = {}

--- Load the default set of autogroups and autocommands.
function M.load_defaults()
  local definitions = {
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = "qf",
        command = "set nobuflisted",
      },
    },
    {
      "FileType",
      {
        group = "_filetype_settings",
        pattern = { "gitcommit", "markdown" },
        command = "setlocal wrap spell",
      },
    },
    {
      "FileType",
      {
        group = "_buffer_mappings",
        pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
        command = "nnoremap <silent> <buffer> q :close<CR>",
      },
    },
    {
      "FileType",
      {
        group = "_php",
        pattern = { "*.php" },
        command = "nnoremap <localleader>; mwA;<esc>`w"
      },
    },
    {
      { "BufWinEnter", "BufRead", "BufNewFile" },
      {
        group = "_format_options",
        pattern = "*",
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
      },
    },
    {
      "VimResized",
      {
        group = "_auto_resize",
        pattern = "*",
        command = "tabdo wincmd =",
      },
    },
  }

  M.define_autocmds(definitions)
  M.enable_format_on_save()
end

function M.enable_format_on_save()
  local opts = {
    pattern = "*",
    ---@usage timeout number timeout in ms for the format request (Default: 1000)
    timeout = 1000,
    ---@usage filter func to select client
    -- filter = require("lvim.lsp.handlers").format_filter,
  }

  vim.api.nvim_create_augroup("lsp_format_on_save", {})

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = { "*.lua", "*.php", "*.elm", "*.py", "*.html", "*.tsx", "*.css", "*.js", "*.vue", "*.sass", "*.scss" },
    callback = function()
      require "eze.lsp.utils".format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
end

function M.toggle_format_on_save()
  local exists, _ = pcall(vim.api.nvim_get_autocmds, {
    group = "lsp_format_on_save",
    event = "BufWritePre",
  })

  if not exists then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

function M.enable_transparent_mode()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      local hl_groups = {
        "Normal",
        "SignColumn",
        "NormalNC",
        "TelescopeBorder",
        "NvimTreeNormal",
        "EndOfBuffer",
        "MsgArea",
      }
      for _, name in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
      end
    end,
  })
  vim.opt.fillchars = "eob: "
end

--- Clean autocommand in a group if it exists
--- This is safer than trying to delete the augroup itself
---@param name string the augroup name
function M.clear_augroup(name)
  -- defer the function in case the autocommand is still in-use
  local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = name })
  if not exists then
    return
  end
  vim.schedule(function()
    local _, _ = xpcall(function()
      vim.api.nvim_clear_autocmds { group = name }
    end, debug.traceback)
  end)
end

--- Create autocommand groups based on the passed definitions
--- Also creates the augroup automatically if it doesn't exist
---@param definitions table contains a tuple of event, opts, see `:h nvim_create_autocmd`
function M.define_autocmds(definitions)
  for _, entry in ipairs(definitions) do
    local event = entry[1]
    local opts = entry[2]
    if type(opts.group) == "string" and opts.group ~= "" then
      local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
      if not exists then
        vim.api.nvim_create_augroup(opts.group, {})
      end
    end
    vim.api.nvim_create_autocmd(event, opts)
  end
end

M.load_defaults()

return M
