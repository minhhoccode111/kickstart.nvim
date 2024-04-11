return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>b',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = 'Make Code [B]eautiful',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
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
      typescript = { { 'prettier', 'ts-standard' } },
      jsx = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },

      -- low level
      -- c = { {  } },
    },
  },
}
