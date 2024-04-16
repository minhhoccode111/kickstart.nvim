-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>r'] = { name = '[R]eplace', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ebug | [D]iagnostic', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Gitsign [H]unk', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = '[M]anagers', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]eotree', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]erminal', _ = 'which_key_ignore' },
      ['<leader>T'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>x'] = { name = '[X]Close', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
      ['<leader>ls'] = { name = '[L]SP [S]ymbols', _ = 'which_key_ignore' },
    }
  end,
}
