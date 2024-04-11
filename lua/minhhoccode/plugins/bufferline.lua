-- tabs like

return {
  'akinsho/bufferline.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  -- only need tabs like display, already cycle through buffers with :bn :bp
  opts = {},
  -- config = function()
  -- require('bufferline').setup {
  --   options = {
  --     hover = {
  --       enabled = true,
  --       delay = 200,
  --       reveal = { 'close' },
  --     },
  --   },
  -- }

  -- local map = vim.keymap.set
  -- Cycle through files in current buffer
  -- map('n', '<c-o>', '<cmd> bn <cr>', { desc = 'Next Buffer', silent = true })
  -- map('n', '<c-i>', '<cmd> bp <cr>', { desc = 'Prev Buffer', silent = true })

  -- Pick buffer to close
  -- map('n', '<leader>xp', '<cmd>lua require("bufferline").close_with_pick()<cr>', { desc = '[X]Close [P]ick Buffer' })

  -- Close current buffer
  -- map('n', '<leader>xb', '<cmd> bd <cr>', { desc = '[X]Close w/ :[b]d', silent = true })
  -- end,
}
