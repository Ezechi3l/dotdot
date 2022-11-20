local fn = require "eze.functions"

vim.api.nvim_create_user_command('CReload', function()
  vim.schedule(function()
    fn.clear_package_loaded()
    vim.api.nvim_command("source $MYVIMRC")
    ---    See: ~
    ---        |notify.Config|

    -- Packer recompile
    fn.recompile()
  end)
end, {})

vim.api.nvim_create_user_command('CEdit', function()
  vim.schedule(function()
    vim.api.nvim_command("e " .. fn.config_path .. "/init.lua")
  end)
end, {})

