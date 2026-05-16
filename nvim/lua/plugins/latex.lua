-- nvim/lua/plugins/latex.lua
return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-pdf',
          '-interaction=nonstopmode',
          '-synctex=1',
        },
      }
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_quickfix_ignore_filters = {
        'Overfull',
        'Underfull',
        'Package hyperref Warning',
      }
      vim.g.tex_flavor = 'latex'
    end,
  },
}
