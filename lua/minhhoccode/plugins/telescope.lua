-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        mappings = {
          -- i = { ['<c-enter>'] = 'to_fuzzy_refine' },

          -- In case we prefer <tab> for completion
          -- i = { ['<tab>'] = require('telescope.actions').select_default },
          -- n = { ['<tab>'] = require('telescope.actions').select_default },
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    -- mine
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.fd, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind Current [W]ord' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep String' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld (Opened) Files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind Current [B]uffers' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
    vim.keymap.set('n', '<leader>fa', function() -- use fd for performance search
      builtin.fd {
        no_ignore = true,
        hidden = true,
        follow = true,
      }
    end, { desc = '[F]ind [A]ll files' })
    vim.keymap.set('n', '<leader>fc', builtin.git_commits, { desc = '[F]ind Git [C]ommits' })
    vim.keymap.set('n', '<leader>ft', builtin.git_status, { desc = '[F]ind Git s[T]atus' })
    vim.keymap.set('n', '<c-p>', builtin.resume, { desc = '[F]ind [R]esume' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[F]ind [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.fd { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[F]ind [N]eovim files' })

    -- Custom search when you get prompted to options to search
    vim.keymap.set('n', '<leader>f?', function()
      local cwd_s = vim.fn.input 'Path (~/): '
      local hidden_c = vim.fn.input 'With hidden files? (Y/n) '
      local no_ignore_c = vim.fn.input 'Show files listed in .gitignore (node_modules)? (y/N) '

      -- if cwd not provide search in current dir
      local cwd = cwd_s ~= '' and '~/' .. cwd_s or nil -- work like a?b:c in js

      -- {hidden}           (boolean)         determines whether to show hidden
      --                                      files or not (default: false)
      local hidden
      if hidden_c == 'n' or hidden_c == 'N' then
        hidden = false
      else
        -- default include hidden files
        hidden = true
      end

      -- {no_ignore}        (boolean)         show files ignored by .gitignore,
      --                                      .ignore, etc. (default: false)
      local no_ignore
      if no_ignore_c == 'y' or no_ignore_c == 'Y' then
        no_ignore = true
      else
        -- default not include files in .gitignore
        no_ignore = false
      end

      builtin.fd {
        -- this path is based on your system's files structure
        cwd = cwd,
        -- show hidden files
        hidden = hidden, -- to search like .env etc
        -- show file ignore by .gitignore (who search in /node_modules?)
        no_ignore = no_ignore,
      }
    end, { desc = 'Prompt to [F]ind from ~/[?]' })
  end,
}
