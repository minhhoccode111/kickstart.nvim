-- Autoformat

return {
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat Code',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      -- Manually edit code style CS50
      local disable_filetypes = {
        c = true,
        cpp = true,
        -- No need for markdown
        markdown = true,
        -- json = true,
        -- md = true,
      }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = { -- <leader>b to add like ';' to js, ts
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },

      -- web
      javascript = { { 'prettierd', 'prettier', 'standardjs' } },
      typescript = { { 'prettierd', 'prettier' } },
      -- jsx = { { 'prettierd', 'prettier', 'standardjs' } },
      -- tsx = { { 'prettierd', 'prettier', 'standardjs' } },
      typescriptreact = { { 'prettierd', 'prettier', 'standardjs' } },
      html = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      -- markdown = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      -- go = { 'ast_grep' },

      -- low level
      -- c = { 'clang-format' },
    },
  },
}
