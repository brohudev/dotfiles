return {
  'tpope/vim-fugitive',
  config = function()
    -- Define key bindings for Fugitive under <leader>g
    vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Open Git status' })
    vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'Commit changes' })
    vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Push changes' })
    vim.keymap.set('n', '<leader>gP', '<cmd>Git pull<CR>', { desc = 'Pull changes' })
    vim.keymap.set('n', '<leader>gb', '<cmd>Git branch<CR>', { desc = 'List branches' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = 'Open Git diff' })
    vim.keymap.set('n', '<leader>gl', '<cmd>Glog<CR>', { desc = 'Show Git log' })
    vim.keymap.set('n', '<leader>gr', '<cmd>Gread<CR>', { desc = 'Read file from Git' })
    vim.keymap.set('n', '<leader>gw', '<cmd>Gwrite<CR>', { desc = 'Write file to Git (Stage)' })
    vim.keymap.set('n', '<leader>gx', '<cmd>Gdelete<CR>', { desc = 'Delete file from Git' })
  end,
}
