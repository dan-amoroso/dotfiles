-- Go (golang) support
--
-- Tools (auto-installed via mason below):
--   gopls      — Go language server
--   goimports  — formatter that also organizes imports
--   gofumpt    — stricter alternative to gofmt

-- LSP: gopls
vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      gofumpt = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
vim.lsp.enable 'gopls'

-- Conform: register Go formatters and add a Go-specific format-on-save
--  (the whitelist in init.lua does not include go).
require('conform').formatters_by_ft.go = { 'goimports', 'gofumpt' }

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('go-format-on-save', { clear = true }),
  pattern = '*.go',
  callback = function(args)
    require('conform').format { bufnr = args.buf, timeout_ms = 1000, lsp_format = 'fallback' }
  end,
})

-- Treesitter: install Go parsers if they are not already
do
  local ok, ts = pcall(require, 'nvim-treesitter')
  if ok and ts.install then ts.install { 'go', 'gomod', 'gosum', 'gowork' } end
end

-- Mason: ensure tools are installed (deferred until mason-registry is ready)
vim.schedule(function()
  local ok, registry = pcall(require, 'mason-registry')
  if not ok then return end
  for _, name in ipairs { 'gopls', 'goimports', 'gofumpt' } do
    if registry.has_package(name) then
      local pkg = registry.get_package(name)
      if not pkg:is_installed() then pkg:install() end
    end
  end
end)
