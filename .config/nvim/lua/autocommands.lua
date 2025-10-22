vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.md',
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.md',
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0) -- Save current cursor position
    vim.cmd 'normal! ggVGgq' -- Reformat whole buffer
    vim.api.nvim_win_set_cursor(0, pos) -- Restore cursor position
  end,
})
