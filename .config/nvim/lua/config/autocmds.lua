vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.clj',
  callback = function()
    -- Requires Conjure to be installed
    -- This sends the (user/reset) command to the connected REPL
    vim.cmd 'ConjureEval (user/reset)'
  end,
})
