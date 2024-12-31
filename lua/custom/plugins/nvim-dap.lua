return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio' },
    -- stylua: ignore
    keys = {
      { "<leader>bl", function() require("dap").toggle_breakpoint()end, desc = "[D]ebug [L]ine" },
      { "<leader>bu", function() require("dap").up() end, desc = "[D]ebugger [U]p the stack" },
      { "<leader>bd", function() require("dap").up() end, desc = "[D]ebugger [D]own the stack" },
      { "<leader>bc", function() require("dap").continue() end, desc = "[D]ebugger [C]ontinue" },
      { "<leader>bo", function() require("dap").step_over() end, desc = "[D]ebugger [S]tep [O]ver" },
      { "<leader>bi", function() require("dap").step_into() end, desc = "[D]ebugger [S]tep [I]nto" },
      { "<leader>bC", function() require("dap").clear_breakpoints() end, desc = "[D]ebugger [C]lear Breakpoints" },

      { "<leader>bU", function() require("dapui").toggle({ }) end, desc = "[D]ap [UI]" },
      { "<leader>be", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {},
    config = function(_, opts)
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open {}
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close {}
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close {}
      end
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    config = function()
      require('dap-python').setup 'python3'
    end,
  },
}
