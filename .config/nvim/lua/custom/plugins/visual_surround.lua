local M = {}

local surround_pairs = {
  ['('] = ')',
  ['['] = ']',
  ['{'] = '}',
  ['<'] = '>',
  ['"'] = '"',
  ["'"] = "'",
  ['`'] = '`',
}

local function surround_with(open, close)
  local bufnr = 0
  local mode = vim.fn.mode()

  local a = vim.fn.getpos 'v'
  local b = vim.fn.getpos '.'

  local srow, scol = a[2] - 1, a[3] - 1
  local erow, ecol = b[2] - 1, b[3] - 1

  if srow > erow or (srow == erow and scol > ecol) then
    srow, erow = erow, srow
    scol, ecol = ecol, scol
  end

  if mode == 'V' then
    local lines = vim.api.nvim_buf_get_lines(bufnr, srow, erow + 1, false)
    if vim.tbl_isempty(lines) then return end

    lines[1] = open .. lines[1]
    lines[#lines] = lines[#lines] .. close

    vim.api.nvim_buf_set_lines(bufnr, srow, erow + 1, false, lines)
    return
  end

  local end_line = vim.api.nvim_buf_get_lines(bufnr, erow, erow + 1, false)[1] or ''
  ecol = math.min(ecol + 1, #end_line)

  local text = vim.api.nvim_buf_get_text(bufnr, srow, scol, erow, ecol, {})
  if vim.tbl_isempty(text) then return end

  text[1] = open .. text[1]
  text[#text] = text[#text] .. close

  vim.api.nvim_buf_set_text(bufnr, srow, scol, erow, ecol, text)
end

function M.setup()
  for open, close in pairs(surround_pairs) do
    vim.keymap.set('x', open, function() surround_with(open, close) end, { silent = true, desc = 'Surround selection with ' .. open .. close })
  end
end

return M
