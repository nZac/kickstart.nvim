return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>ge', ':Gedit:<CR>', { desc = '[G]it [E]dit' })
      vim.keymap.set('', '<leader>gB', ':GBrowse<CR>', { desc = '[G]it [B]rowse' })
      vim.keymap.set('', '<leader>gL', ':Git log --oneline<CR>', { desc = '[G]it [L]og' })
    end,
  },
  {
    'tpope/vim-rhubarb',
  },
  {
    'tpope/vim-unimpaired',
  },
}
