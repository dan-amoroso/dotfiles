-- Fennel support
--
-- Tools (auto-installed via mason below):
--   fennel-ls  — Fennel language server
--   fnlfmt     — Fennel formatter
--
-- Shared lisp tooling (parinfer/paredit/parpar/conjure) lives in lisps.lua.

-- LSP: fennel-ls
vim.lsp.config('fennel_ls', {})
vim.lsp.enable 'fennel_ls'

-- Conform: register Fennel formatter and add a Fennel-specific format-on-save
--  (the whitelist in init.lua does not include fennel).
require('conform').formatters_by_ft.fennel = { 'fnlfmt' }

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('fennel-format-on-save', { clear = true }),
  pattern = '*.fnl',
  callback = function(args)
    require('conform').format { bufnr = args.buf, timeout_ms = 1000, lsp_format = 'fallback' }
  end,
})

-- Treesitter: install Fennel parser if it is not already
do
  local ok, ts = pcall(require, 'nvim-treesitter')
  if ok and ts.install then ts.install { 'fennel' } end
end

-- Mason: ensure tools are installed (deferred until mason-registry is ready)
vim.schedule(function()
  local ok, registry = pcall(require, 'mason-registry')
  if not ok then return end
  for _, name in ipairs { 'fennel-ls', 'fnlfmt' } do
    if registry.has_package(name) then
      local pkg = registry.get_package(name)
      if not pkg:is_installed() then pkg:install() end
    end
  end
end)
