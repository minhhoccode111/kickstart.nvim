-- print 'Hello, World! From neotree.lua'

return {
  -- File: lua/custom/plugins/filetree.lua
  'nvim-neo-tree/neo-tree.nvim',

  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            '.git',
          },
        },
        window = {
          mappings = {
            ['l'] = 'set_root',
            ['h'] = 'navigate_up',
            ['H'] = 'none',
            ['/'] = 'none',
          },
        },
      },
    }

    -- My setting neotree keymaps, see :help neotree
    -- local command = require 'neo-tree.command'
    local map = vim.keymap.set

    -- since we don't need a file tree that much so a little deep is ok
    -- since we spend half screen for editor (usually) so float is better
    map('n', '<c-n>', '<cmd> Neotree toggle float<cr>', { desc = '[N]eotree [F]loat' })
    map('n', '<leader>nf', '<cmd> Neotree toggle float<cr>', { desc = '[N]eotree [F]loat' })
    map('n', '<leader>nl', '<cmd> Neotree toggle left <cr>', { desc = '[N]eotree [L]eft' })
  end,
}
