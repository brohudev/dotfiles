return { -- contains all the one liner plugins
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = { signs = false },
  },
  -- NOTE: plugins yoinked straight from Github:
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'theprimeagen/refactoring.nvim', -- Refactoring plugin to refactor code within Neovim
  'mbbill/undotree', -- Undotree for visualizing and managing undo history
  'tpope/vim-fugitive', -- Vim Fugitive for Git integration
  'nvim-treesitter/nvim-treesitter-context', -- Treesitter context for better code context
  'nvim-lua/plenary.nvim', -- lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window navigation
}
