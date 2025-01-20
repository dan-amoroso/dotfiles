return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- Git related plugins
  {'tpope/vim-fugitive', event = "User AstroGitFile"},
  {'tpope/vim-rhubarb', event = "User AstroGitFile"},

  {'tpope/vim-repeat', lazy = false},

  -- file nav
  {'tpope/vim-vinegar', lazy = false},

  -- Detect tabstop and shiftwidth automatically
  {'tpope/vim-sleuth', lazy = false},

  -- Clojure
  {'gpanders/nvim-parinfer'},
  -- {'tpope/vim-fireplace'},
  {'tpope/vim-salve', lazy = false},
  -- {'guns/vim-sexp', lazy = false},
  -- {'tpope/vim-sexp-mappings-for-regular-people', lazy = false},
  {'luochen1990/rainbow', lazy = false},
  {'tpope/vim-surround', lazy = false},
  {
    'Olical/conjure',
    ft = {'Clojure', 'ClojureScript'},
  },

  -- tmux integration
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require('nvim-tmux-navigation').setup({})
      vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
      vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
      vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
      vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
    end
  },

  -- pretty colors
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme everforest]]
    end,
  },
}
