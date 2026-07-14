-- Shared infrastructure for lisp-family languages
--  (clojure, fennel, scheme, lisp, janet, etc.)
--
-- Plugins:
--   nvim-parinfer  — parenthesis inference
--   nvim-paredit   — paredit-style structural editing
--   parpar.nvim    — integrates parinfer with paredit
--   conjure        — interactive REPL evaluation (primarily Clojure)

-- Globals must be set before the relevant plugin loads.
vim.g.parinfer_filetypes = vim.g.parinfer_filetypes or { 'clojure', 'scheme', 'lisp', 'racket', 'hy', 'fennel', 'janet', 'carp', 'wast', 'yuck', 'dune' }

local function gh(repo) return 'https://github.com/' .. repo end

local conjure_ft = { 'clojure', 'fennel', 'scheme', 'lisp', 'janet', 'racket', 'hy' }

vim.pack.add {
  gh 'gpanders/nvim-parinfer',
  gh 'julienvincent/nvim-paredit',
  gh 'dundalek/parpar.nvim',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = conjure_ft,
  callback = function() vim.pack.add { gh 'Olical/conjure' } end,
})

-- parpar (parinfer + paredit) for lisp/clojure
do
  local paredit = require 'nvim-paredit'
  require('parpar').setup {
    paredit = {
      filetypes = { 'clojure', 'fennel', 'scheme', 'lisp', 'janet' },
      keys = {
        ['<leader>ph'] = { paredit.api.slurp_backwards, 'Slurp backwards' },
        ['<leader>pj'] = { paredit.api.barf_backwards, 'Barf backwards' },
        ['<leader>pk'] = { paredit.api.barf_forwards, 'Barf forwards' },
        ['<leader>pl'] = { paredit.api.slurp_forwards, 'Slurp forwards' },
      },
    },
  }
end
