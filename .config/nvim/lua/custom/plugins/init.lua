-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local function gh(repo) return 'https://github.com/' .. repo end

-- Globals must be set before the relevant plugin loads,
--  so they go above the vim.pack.add call.
vim.g.tmux_navigator_no_wrap = 1

vim.pack.add {
  gh 'christoomey/vim-tmux-navigator',
  gh 'tpope/vim-vinegar',
  gh 'tpope/vim-repeat',
  gh 'tpope/vim-surround',
  gh 'adelarsq/vim-matchit',
  gh 'sphamba/smear-cursor.nvim',
  gh 'stevearc/oil.nvim',
  gh 'godlygeek/tabular',
  gh 'catgoose/nvim-colorizer.lua',
}

-- tmux/vim split navigation (overrides built-in <C-hjkl> window moves)
vim.keymap.set('n', '<c-h>', '<cmd><C-U>TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<c-j>', '<cmd><C-U>TmuxNavigateDown<CR>')
vim.keymap.set('n', '<c-k>', '<cmd><C-U>TmuxNavigateUp<CR>')
vim.keymap.set('n', '<c-l>', '<cmd><C-U>TmuxNavigateRight<CR>')
vim.keymap.set('n', '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<CR>')

require('smear_cursor').setup {
  stiffness = 1,
  trailing_stiffness = 0.6,
  damping = 0.8,
  damping_insert_mode = 0.8,
  distance_stop_animating = 0.5,
  time_interval = 10,
}

require('mini.icons').setup {}
require('oil').setup {}

require('colorizer').setup()

-- Iterate over all other Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
