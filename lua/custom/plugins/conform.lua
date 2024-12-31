return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  config = function()
    require('conform').setup {
      notify_no_formatters = true,
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        css = { 'prettier' },
        go = { 'golines' },
        handlebars = { 'prettier' },
        html = { 'prettier' },
        htmldjango = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'ruff_format', 'ruff_organize_imports' },
        sh = { 'shfmt' },
        sql = { 'pg_format' },
        typescript = { 'prettierd', 'eslint' },
        typescriptreact = { 'prettierd', 'eslint' },
        yaml = { 'prettier' },
      },
    }

    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('EslintFixAll', { clear = true }),
      pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
      command = 'silent! EslintFixAll',
    })
  end,
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
}
