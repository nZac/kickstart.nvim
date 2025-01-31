return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>ge', ':Gedit:<CR>', { desc = '[G]it [E]dit' })
  end,
}
