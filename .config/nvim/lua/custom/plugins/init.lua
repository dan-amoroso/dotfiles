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
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'lisp' },
  },
  { 'adelarsq/vim-matchit' },
  -- Cursor animation for better visibility
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    config = function()
      local animate = require 'mini.animate'
      animate.setup {
        -- Cursor path animation
        cursor = {
          enable = true,
          timing = animate.gen_timing.linear { duration = 80, unit = 'total' },
          path = animate.gen_path.line {
            predicate = function()
              return true -- Animate all cursor movements
            end,
          },
        },
        -- Scroll animation (optional, can disable if you don't like it)
        scroll = {
          enable = false,
        },
        -- Resize animation
        resize = {
          enable = false,
        },
        -- Open/close animation
        open = {
          enable = false,
        },
        close = {
          enable = false,
        },
      }
    end,
  },
}
