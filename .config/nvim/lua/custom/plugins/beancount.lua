do
  local ok, ts = pcall(require, 'nvim-treesitter')
  if ok and ts.install then ts.install { 'beancount' } end
end
