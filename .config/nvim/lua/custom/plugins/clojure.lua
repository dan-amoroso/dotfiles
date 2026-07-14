-- Clojure support
--
-- Tools (auto-installed via mason below):
--   clojure-lsp  — Clojure language server
--
-- Shared lisp tooling (parinfer/paredit/parpar/conjure) lives in lisps.lua.

vim.pack.add {
  'https://git.sr.ht/~ioiojo/standard-clojure-style.nvim',
}

require('standard-clojure-style').setup {
  format_on_save = true,
}

-- LSP: clojure-lsp
vim.lsp.config('clojure_lsp', {
  settings = {
    clojure = {
      semantic = { enable = true },
      lint = { clj_kondo = { enabled = true } },
    },
  },
})
vim.lsp.enable 'clojure_lsp'

-- Conform: register Clojure formatter and add a Clojure-specific format-on-save
--  (the whitelist in init.lua does not include clojure).
require('conform').formatters_by_ft.clojure = { 'standard-clj' }

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('clojure-format-on-save', { clear = true }),
  pattern = { '*.clj', '*.cljs', '*.cljc', '*.cljd', '*.edn', '*.bb' },
  callback = function(args)
    require('conform').format { bufnr = args.buf, timeout_ms = 1000, lsp_format = 'fallback' }
  end,
})

-- Conjure: reset user namespace after each *.clj save
vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('clojure-conjure-reset', { clear = true }),
  pattern = '*.clj',
  callback = function() vim.cmd 'ConjureEval (user/reset)' end,
})

-- Treesitter: install Clojure parser if it is not already
do
  local ok, ts = pcall(require, 'nvim-treesitter')
  if ok and ts.install then ts.install { 'clojure' } end
end

-- Mason: ensure tools are installed (deferred until mason-registry is ready)
vim.schedule(function()
  local ok, registry = pcall(require, 'mason-registry')
  if not ok then return end
  for _, name in ipairs { 'clojure-lsp' } do
    if registry.has_package(name) then
      local pkg = registry.get_package(name)
      if not pkg:is_installed() then pkg:install() end
    end
  end
end)
