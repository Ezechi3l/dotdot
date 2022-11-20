-- Inspiration from https://github.com/LunarVim/LunarVim/blob/rolling/lua/lvim/plugin-loader.lua
local utils = require "eze.utils"

M = {}

M.config_path = vim.call("stdpath", "config")

M._compile_path = utils.join_paths(M.config_path, "plugin", "packer_compiled.lua")

M.log = function(message, level)
  if not level then
    level = vim.log.levels.INFO
  end

  vim.notify(message, level, { title = "Config" })
end

M.pcall_packer_command = function(cmd, kwargs)
  local status_ok, msg = pcall(function()
    require("packer")[cmd](unpack(kwargs or {}))
  end)

  if not status_ok then
    M.log(cmd .. " failed with: " .. vim.inspect(msg), vim.log.levels.WARN)
  end
end

M.cache_clear = function()
  if vim.fn.delete(M._compile_path) == 0 then
    -- M.log("Deleted packer_compiled.lua")
  end
end

M.recompile = function()
  M.cache_clear()
  M.pcall_packer_command "compile"

  if utils.is_file(M._compile_path) then
    M.log("Generated packer_compiled.lua")
  end
end


M.clear_package_loaded = function()
  -- Remove cached lua files from configurations
  for module, _ in pairs(package.loaded) do
    if module:match "eze" then
      package.loaded[module] = nil
    end
  end
end

vim.api.nvim_create_user_command('CReload', function()
  vim.schedule(function()
    M.clear_package_loaded()
    vim.api.nvim_command("source $MYVIMRC")
    ---    See: ~
    ---        |notify.Config|

    -- Packer recompile
    M.recompile()
  end)
end, {})

vim.api.nvim_create_user_command('CEdit', function()
  vim.schedule(function()
    vim.api.nvim_command("e " .. M.config_path .. "/init.lua")
  end)
end, {})

return M
