return function()
  require("bufferline").setup({
    options = {
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      separator_style = "slant",
      show_close_icon = false,
    },
  })
end
