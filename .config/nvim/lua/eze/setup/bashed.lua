return function()
  vim.g.bashed_commands = {
    http = {
      { 'fd', '-t', 'f', '-e', 'http' },
      { ':e %s', 'lua require("rest-nvim").run()' },
      "List all http files inside the project to run rest.nvim on one"
    },
    css_del = { 'fd -t f -e css', ':!rm %s' },
  }
end

