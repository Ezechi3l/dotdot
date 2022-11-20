return function()
  vim.opt.timeoutlen = 250
  local wk = require('which-key')

  wk.setup {
    key_labels = {
      ["<space>"] = "SPC",
      ["<a>"] = "ALT",
      ["<tab>"] = "TAB",
    },
  }

  local list = {
    b = {
      name = "Buffers",
      b = { '<cmd>BufferLineCyclePrev<cr>', "Previous" },
      f = { '<cmd><cmd>Telescope buffers<cr>', "List" },
      j = { '<cmd>BufferLinePick<cr>', "Jump" },
      n = { '<cmd>BufferLineCycleNext<CR>', "Next" },
      -- TAB = { ":ls <cr>:b ", "Cycle" }
    },

    c = { '<cmd>bd<CR>', "Close current" },

    e = { "<cmd>NvimTreeToggle<cr>", "Explorer", },

    E = {
      name = "Elm doc",
      l = { "<cmd>silent !open https://package.elm-lang.org/packages/elm/core/latest/List<cr>", "List" },
      b = { "<cmd>silent !open https://package.elm-lang.org/packages/elm/core/latest/Basics<cr>", "Basics" },
      s = { "<cmd>silent !open https://package.elm-lang.org/packages/elm/core/latest/String<cr>", "String" },
    },

    f = { "<cmd>Telescope find_files<cr>", "Telescope", },

    g = {
      name = "Git",
      a = { "<cmd>Git add %<cr>", "Stage current file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Git commit<CR>", "Commit" },
      l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame by line" },
      L = { "<cmd>Git blame<CR>", "Blame all file" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>G push<cr>", "Push" },
      s = { "<cmd>G<cr>", "Status" },
      -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
      -- b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
    },

    p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
    },

    l = {
      name = "Lsp",
      d = { "<cmd>Telescope diagnostics<cr>", "Diagnosics" },
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
    },

    q = { ":q<cr>", "Quit" },

    r = {
      name = "Rest",
      l = { "<cmd>Telescope bashed http<cr>", "List" },
      x = { "<Plug>RestNvim", "Execute" },
    },

    s = {
      name = "Search",
      e = { "<cmd>NvimTreeFocus<cr>", "Focus explorer" },
      g = { "<cmd>Telescope live_grep<cr>", "Grep" },
      n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" },
      u = { "<cmd>UndotreeToggle<cr>", "Toggle undotree" },
    },

    z = {
      name = "Others",
      s = { "Vip:sort<cr>", "Sort current paragraph" },
    },

    w = {
      name = "Window",
      w = { "<C-W>w'", "Switch windows" },
      s = { "<C-W>K'", "Make horizontal to vertical" },
    },
  }

  list["x"] = {
    name = "Config",
    e = { '<cmd>CEdit<cr>', "Edit" },
    r = { '<cmd>CReload<cr>', "Reload" },
    t = { '<Plug>PlenaryTestFile', "Test current file" },
    x = { ':w<cr>:source %<cr>', "Run current file" },
    h = { ":vsplit ~/.vimhelp<cr>", "Help" },
  }

  wk.register(list, { prefix = "<leader>" })
end
