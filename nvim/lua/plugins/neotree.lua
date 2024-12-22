return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',

  keys = {
    { '<leader>fe', ':Neotree toggle<CR>', desc = '[F]ile [E]xplorer - Toggle', silent = true },
    { '<leader>ff', ':Neotree focus<CR>', desc = '[F]ile [F]ocus - Focus on NeoTree', silent = true },
    { '<leader>fc', ':Neotree close<CR>', desc = '[F]ile [C]lose - Close NeoTree', silent = true },
    { '<leader>fr', ':Neotree refresh<CR>', desc = '[F]ile [R]efresh - Refresh NeoTree', silent = true },
    { '<leader>fs', ':Neotree show<CR>', desc = '[F]ile [S]how - Show NeoTree', silent = true },
    { '<leader>fm', ':Neotree action move<CR>', desc = '[F]ile [M]ove - Move a file/directory', silent = true },
    { '<leader>fM', ':Neotree action copy<CR>', desc = '[F]ile [C]opy - Copy a file/directory', silent = true },
    { '<leader>fd', ':Neotree action delete<CR>', desc = '[F]ile [D]elete - Delete a file/directory', silent = true },
    { '<leader>frn', ':Neotree action rename<CR>', desc = '[F]ile [R]e[N]ame - Rename a file/directory', silent = true },
    { '<leader>fn', ':Neotree action new<CR>', desc = '[F]ile [N]ew - Create a new file/directory', silent = true },
    { '<leader>fu', ':Neotree action up<CR>', desc = '[F]ile [U]p - Go up one directory', silent = true },
    { '<leader>fb', ':Neotree action back<CR>', desc = '[F]ile [B]ack - Go back to the previous folder', silent = true },
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw = true,
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
