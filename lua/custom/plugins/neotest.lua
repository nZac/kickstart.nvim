return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>tn',
      function()
        require('neotest').run.run { strategy = 'dap', suite = false }
      end,
      desc = '[T]est [N]earest',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last { strategy = 'dap', suite = false }
      end,
      desc = '[T]est [L]ast',
    },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[T]est [F]ile',
    },
  },
}
