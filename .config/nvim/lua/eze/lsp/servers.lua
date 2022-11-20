local M = {}

M._buf_opts = { buffer = 0 }
M._opts = { silent = true, noremap = true }

M._on_attach = function()
  return function(_, bufnr)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, M._buf_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, M._buf_opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, M._buf_opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, M._buf_opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, M._buf_opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, M._buf_opts)
    vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, M._buf_opts)
    vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, M._buf_opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, M._buf_opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>', M._opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', M._opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lw', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', M._opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lx', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', M._opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lv', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', M._opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', M._opts)
  end
end

M._capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.setup = function()
  -- Remove every clients before reloading them
  vim.lsp.stop_client(vim.lsp.get_active_clients())

  local servers_installed = require "nvim-lsp-installer.servers".get_installed_server_names()

  for _, server in pairs(servers_installed) do
    local config = {
      on_attach = M._on_attach(),
      capabilities = M._capabilities
    }

    local ok, custom_config = pcall(require, "eze/lsp/lsp_config/" .. server)
    if not ok then
      custom_config = {}
    end

    config = vim.tbl_deep_extend("force", config, custom_config)

    require "lspconfig"[server].setup(config)
  end
end

return M
