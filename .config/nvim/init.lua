-- @TODO export nvim foler from dotfiles to nvim directly
-- @TODO add wichkey lsp ?
-- @TODO add window manager ?
-- @TODO add null-ls!
-- @TODO convert every path to .
-- @TODO change nerdtree's github icons
-- @TODO indent based on filetype
-- @TODO spaces based on filetype


require('eze.globals')
require('eze.commands')
require('eze.plugins')
require('eze.settings')
require('eze.theming')
require('eze.mapping')
require('eze.autocommands')
require('eze.lsp')

-- vim.cmd([[ if sas("unix")
--   let s:uname = system("uname -s")
--   " Do Mac stuff
--   if s:uname == "Darwin\n"
--     runtime ./macos.vim
--   endif
-- endif
-- ]])
--
