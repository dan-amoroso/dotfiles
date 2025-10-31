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
    
    -- Safely restore cursor position, clamping to valid range
    local line_count = vim.api.nvim_buf_line_count(0)
    local safe_row = math.min(pos[1], line_count)
    local line_length = #vim.api.nvim_buf_get_lines(0, safe_row - 1, safe_row, false)[1]
    local safe_col = math.min(pos[2], line_length)
    
    vim.api.nvim_win_set_cursor(0, { safe_row, safe_col })
  end,
})
