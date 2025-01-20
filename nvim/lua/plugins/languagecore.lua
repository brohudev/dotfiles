--Plugins in the file:
--vimtex: latex support for the lazy.
--
return {
  {
    'lervag/vimtex',
    lazy = false, -- VimTeX needs to be loaded immediately
    keys = {
      { '<localLeader>l', '', desc = '+vimtex' },
    },
    config = function()
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_view_method = 'zathura'

      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-pdf',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },
}
