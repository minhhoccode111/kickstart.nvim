return {
  {
    'NvChad/nvterm',
    config = function()
      require('nvterm').setup {
        -- Default setting
        -- terminals = {
        --   shell = vim.o.shell,
        --   list = {},
        --   type_opts = {
        --     float = {
        --       relative = 'editor',
        --       row = 0.3,
        --       col = 0.25,
        --       width = 0.5,
        --       height = 0.4,
        --       border = 'single',
        --     },
        --     horizontal = { location = 'rightbelow', split_ratio = 0.3 },
        --     vertical = { location = 'rightbelow', split_ratio = 0.5 },
        --   },
        -- },
        behavior = {
          -- autoclose_on_quit = {
          --   enabled = false,
          --   confirm = true,
          -- },
          -- close_on_exit = true,
          auto_insert = false,
        },
      }

      local map = vim.keymap.set

      -- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
      -- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
      -- is not what someone will guess without a bit more experience.
      -- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
      -- or just use <C-\><C-n> to exit terminal mode
      map('t', 'jj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

      -- Open terminals
      map('n', '<leader>tt', '<cmd> ter <cr>', { desc = '[T]erminal New Buffer' })

      -- Togglable fast
      map({ 'n', 't' }, '<a-i>', '<cmd>lua require("nvterm.terminal").toggle "float"<cr>', { desc = 'Toggle Float Terminal' })
      map({ 'n', 't' }, '<a-j>', '<cmd>lua require("nvterm.terminal").toggle "horizontal"<cr>', { desc = 'Toggle [j]Bottm Terminal' })
      map({ 'n', 't' }, '<a-l>', '<cmd>lua require("nvterm.terminal").toggle "vertical"<cr>', { desc = 'Toggle [l]Right Terminal' })

      -- New with <leader>
      map({ 'n', 't' }, '<leader>ti', '<cmd>lua require("nvterm.terminal").new "float"<cr>', { desc = '[T]erminal New [i]Float' })
      map({ 'n', 't' }, '<leader>tj', '<cmd>lua require("nvterm.terminal").new "horizontal"<cr>', { desc = '[T]erminal New [j]Bottom' })
      map({ 'n', 't' }, '<leader>tl', '<cmd>lua require("nvterm.terminal").new "vertical"<cr>', { desc = '[T]erminal New [l]Right' })

      -- Open New Vertical terminal and run `test` script
      map({ 'n', 't' }, '<leader>ts', function()
        require('nvterm.terminal').send('npm run test', 'vertical')
      end, { desc = '[T]erminal Run [S]cript' })

      -- Send a command to the opened Terminal
      -- require('nvterm.terminal').send(' your command ', 'horizontal|vertical|float') -- the 2nd argument i.e direction is optional
      -- Example run `node test` in a float terminal
      -- map({ 'n', 't' }, '<a-i>', '<cmd>lua require("nvterm.terminal").send("node test", "float")<cr>', { desc = 'Toggle Float Terminal' })
    end,
  },
}
