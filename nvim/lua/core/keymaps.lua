vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus left' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus right' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus down' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus up' })

-- Increment/decrement
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Windows (splits) - moved from leader s to avoid conflict with search
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = '[W]indow: split [V]ertical' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = '[W]indow: split [H]orizontal' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = '[W]indow: [E]qual size' })
vim.keymap.set('n', '<leader>wx', '<cmd>close<CR>', { desc = '[W]indow: close' })

-- Buffers (streamlined)
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })

-- Tabs (minimal)
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>', { desc = '[T]ab [P]revious' })

-- Remove current folder from project list
vim.keymap.set('n', '<leader>pd', function()
  local history = require 'project_nvim.utils.history'
  local cwd = vim.fn.getcwd()
  local projects = history.get_recent_projects()
  local found = false
  for _, p in ipairs(projects) do
    if p == cwd then
      found = true
      break
    end
  end
  history.delete_project { value = cwd }
  vim.notify(found and ('Removed: ' .. cwd) or 'Not in project list', vim.log.levels.INFO)
end, { desc = '[P]roject: [D]elete current from list' })

-- Add current folder as project (shows in <leader>pp picker)
vim.keymap.set('n', '<leader>pa', function()
  local project = require 'project_nvim.project'
  local history = require 'project_nvim.utils.history'
  local cwd = vim.fn.getcwd()
  if vim.fn.isdirectory(cwd) == 1 then
    table.insert(history.session_projects, cwd)
    project.set_pwd(cwd, 'manual')
    vim.notify('Added project: ' .. cwd, vim.log.levels.INFO)
  end
end, { desc = '[P]roject: [A]dd current folder' })

-- Run commands (edit nvim/lua/run_commands.lua to customize)
vim.keymap.set('n', '<leader>rr', function()
  require('run_commands').pick()
end, { desc = '[R]un command (dev servers, logs)' })

-- Yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking',
  group = vim.api.nvim_create_augroup('yank-highlight', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
