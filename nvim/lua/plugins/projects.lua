-- Tab-scoped projects: each tab = one project with isolated buffers, search, grep
-- Switch with <leader>pp (new project tab) or <leader>ps (switch in current tab)
return {
  -- Tab-scoped buffers: bnext/bprev only cycle within current tab
  {
    'tiagovla/scope.nvim',
    event = 'TabNewEntered',
    config = true,
  },
}
