local fn = require("eze.functions")

local get_setup = function(lib)
  if not lib then
    fn.log("Empty name -_-'")

    return nil
  end

  local path = 'eze/setup/' .. lib
  local ok, setup = pcall(require, path)

  if not ok then
    fn.log(
      string.format(
        "Error loading setup file for %s located in %s with error: %s",
        lib,
        path,
        setup
      )
    )

    return nil
  end

  if type(setup) == "function" then
    return setup
  end

  fn.log(
    string.format(
      "Setup file for %s should return a function",
      lib
    )
  )
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  use "antoinemadec/FixCursorHold.nvim"

  -- Indent line
  use 'Yggdroot/indentLine'

  -- Autopairs
  use "windwp/nvim-autopairs"

  use "mbbill/undotree"

  -- Term in float
  use {
    'akinsho/toggleterm.nvim',
    config = get_setup("toggleterm"),
  }

  use 'github/copilot.vim'

  -- Git stuff
  use 'tpope/vim-fugitive'

  use {
    'lewis6991/gitsigns.nvim',
    config = get_setup("gitsigns"),
  }

  -- Helpers tpope
  -- -- Surround an string with a pair of characters
  use 'tpope/vim-surround'

  -- -- Comments on gcc
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = get_setup('notify')
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    config = get_setup('telescope'),
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    after = "telescope-bashed.nvim"
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    requires = { 'nvim-telescope/telescope.nvim' },
    run = 'make',
  }

  -- Postman for vim
  use {
    'NTBBloodbath/rest.nvim',
    config = get_setup('rest')
  }

  use {
    "Ezechi3l/telescope-bashed.nvim",
    setup = get_setup('bashed')
  }

  -- Treesitter (syntax)
  use {
    "nvim-treesitter/nvim-treesitter",
    config = get_setup("treesitter"),
    requires = { { 'JoosepAlviste/nvim-ts-context-commentstring' } },
  }

  --  Theming
  use {
    'mhartington/oceanic-next',
    config = function()
      vim.g.oceanic_next_terminal_bold = 1
      vim.g.oceanic_next_terminal_italic = 1
      vim.cmd('colorscheme OceanicNext')
    end
  }

  -- use { 'ayu-theme/ayu-vim', config = function()
  --   vim.cmd('set termguicolors')
  --   vim.cmd('let ayucolor="light"')
  --   vim.cmd('colorscheme ayu')
  --
  -- end }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      -- require "catppuccin".setup {
      --   term_colors = true
      -- }
      --
      -- vim.g.catppuccin_flavour = "mocha"
      -- vim.cmd('colorscheme catppuccin')
    end,
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = get_setup("tree"),
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
  }

  -- -- Tabs for buffer
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = get_setup('bufferline'),
  }

  use {
    'folke/which-key.nvim',
    config = get_setup('whichkey'),
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Completion for nvim (+LSP)
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use { 'hrsh7th/nvim-comp', config = get_setup('comp') }
  use { 'L3MON4D3/LuaSnip', config = get_setup('lua_snip') }
  use 'saadparwaiz1/cmp_luasnip'
end)
