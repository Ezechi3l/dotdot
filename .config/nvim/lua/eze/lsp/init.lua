local lsp_status_ok, _ = pcall(require, "lspconfig")
if not lsp_status_ok then
  return
end

-- TODO get all installed servers and run config
-- SEE https://github.com/LunarVim/LunarVim/blob/23df368b00bda0ed4a01fac92f7ad80998c1d34a/lua/lvim/lsp/manager.lua
-- See h lsp
-- Aouter null-ls
-- Github copilot changer le keymap
--

require("nvim-lsp-installer").setup {
  automatic_installation = true,

  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  },

  ensure_installed = {
    "cssls",
    "http",
    "javascript",
    "json",
    "sumneko_lua",
    "python",
    "tsx",
    "typescript",
    "yaml",
  },
}

require "eze.lsp.servers".setup()
require "eze.lsp.handlers".setup()
