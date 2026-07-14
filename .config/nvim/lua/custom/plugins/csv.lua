vim.pack.add { 'https://github.com/hat0uma/csvview.nvim' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'csv',
  callback = function() vim.cmd 'CsvViewEnable' end,
})
