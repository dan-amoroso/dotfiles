-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<CR>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<CR>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<CR>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<CR>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<CR>' },
    },
    init = function()
      -- Disable wrapping when navigating at edges
      vim.g.tmux_navigator_no_wrap = 1
    end,
  },
  -- navigation
  { 'tpope/vim-vinegar' },
  -- clojure/lisp
  {
    'dundalek/parpar.nvim',
    dependencies = { 'gpanders/nvim-parinfer', 'julienvincent/nvim-paredit' },
    config = function()
      local paredit = require 'nvim-paredit'
      require('parpar').setup {
        paredit = {
          -- pass any nvim-paredit options here
          keys = {
            -- custom bindings using leader key to avoid conflicts with navigation
            ['<leader>ph'] = { paredit.api.slurp_backwards, 'Slurp backwards' },
            ['<leader>pj'] = { paredit.api.barf_backwards, 'Barf backwards' },
            ['<leader>pk'] = { paredit.api.barf_forwards, 'Barf forwards' },
            ['<leader>pl'] = { paredit.api.slurp_forwards, 'Slurp forwards' },
          },
        },
      }
    end,
  },
  'tpope/vim-repeat',
  'tpope/vim-surround',
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'lisp' },
  },
  { 'adelarsq/vim-matchit' },
  -- Cursor animation for better visibility
  {
    'sphamba/smear-cursor.nvim',
    event = 'VeryLazy',
    opts = {
      -- Higher values = faster, snappier animation
      stiffness = 1, -- Increased from 0.4 for faster response
      trailing_stiffness = 0.6, -- Increased from 0.3 for faster trail
      damping = 0.8, -- Increased from 0.65 for quicker settling
      damping_insert_mode = 0.8,
      distance_stop_animating = 0.5,
      -- Lower interval = higher framerate = smoother/faster animation
      time_interval = 10, -- ~100fps for very smooth animation
    },
  },
  {
    'stevearc/oil.nvim',
    -- -@module 'oil'
    -- -@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    'https://git.sr.ht/~ioiojo/standard-clojure-style.nvim',
    config = function()
      require('standard-clojure-style').setup {
        -- Enable format on save
        format_on_save = true,
      }
    end,
  },
  {
    'godlygeek/tabular',
  },
  'norcalli/nvim-colorizer.lua',
}
