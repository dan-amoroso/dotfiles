-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
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
            -- custom bindings are automatically wrapped
            ['<C-H>'] = { paredit.api.slurp_backwards, 'Slurp backwards' },
            ['<C-J>'] = { paredit.api.barf_backwards, 'Barf backwards' },
            ['<C-K>'] = { paredit.api.barf_forwards, 'Barf forwards' },
            ['<C-L>'] = { paredit.api.slurp_forwards, 'Slurp forwards' },
          },
        },
      }
    end,
  },
  {
    'Olical/conjure',
    ft = { 'clojure', 'fennel', 'lisp' },
  },
  { dir = '~/workspace/llm-repl.nvim', dependencies = { 'daurnimator/lua-http' } },
}
