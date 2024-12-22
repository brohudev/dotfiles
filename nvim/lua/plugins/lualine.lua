return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

    -- Define Rose Pine colors
    local colors = {
      love = '#eb6f92', -- Rose color (for active modes)
      gold = '#f6c177', -- Yellowish (for visual mode)
      pine = '#9ccfd8', -- Light Blue (for normal mode)
      foam = '#31748f', -- Dark Blue (for command mode)
      iris = '#c4a7e7', -- Light Purple (for background)
      text = '#e0def4', -- Text color (light)
      surface = '#1f1d2e', -- Dark background
      background = '#191724', -- Very dark background
      inactive_bg = '#26233a', -- Inactive background
    }

    -- Rose Pine Lualine theme
    local rose_pine_lualine_theme = {
      normal = {
        a = { bg = colors.iris, fg = colors.background, gui = 'bold' },
        b = { bg = colors.surface, fg = colors.text, gui = 'bold' },
        c = { bg = colors.surface, fg = colors.text },
      },
      insert = {
        a = { bg = colors.love, fg = colors.background, gui = 'bold' },
        b = { bg = colors.surface, fg = colors.text },
        c = { bg = colors.surface, fg = colors.text },
      },
      visual = {
        a = { bg = colors.gold, fg = colors.background, gui = 'bold' },
        b = { bg = colors.surface, fg = colors.text },
        c = { bg = colors.surface, fg = colors.text },
      },
      command = {
        a = { bg = colors.foam, fg = colors.background, gui = 'bold' },
        b = { bg = colors.surface, fg = colors.text },
        c = { bg = colors.surface, fg = colors.text },
      },
      replace = {
        a = { bg = colors.foam, fg = colors.background, gui = 'bold' },
        b = { bg = colors.surface, fg = colors.text },
        c = { bg = colors.surface, fg = colors.text },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.text, gui = 'bold' },
        b = { bg = colors.inactive_bg, fg = colors.text },
        c = { bg = colors.inactive_bg, fg = colors.text },
      },
    }

    -- Configure lualine with the Rose Pine theme and colorful elements
    lualine.setup {
      options = {
        theme = rose_pine_lualine_theme,
        component_separators = { left = '', right = '' }, -- Powerline separators
        section_separators = { left = '', right = '' }, -- Powerline separators
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return str:sub(1, 1):upper()
            end,
          }, -- Show just the first letter of mode (e.g., 'N', 'I')
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
