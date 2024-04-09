--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true -- false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- mine
-- fat cursor
-- vim.opt.guicursor = ''

-- line wrap, combine with relative number to jump faster
vim.opt.wrap = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable 24-bit RGB
vim.opt.termguicolors = true

-- disply a line at column 80
vim.opt.colorcolumn = '80'

-- mine

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50 -- 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8 -- 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ My basic Keymaps ]]
--[[ KEYS ]]
-- Enter Normal mode from Insert mode
vim.keymap.set('i', 'jj', '<esc>', { desc = 'Enter Normal mode from Insert mode' })

-- gj, gk instead of j, k. Turn off since not set line wrap
-- vim.keymap.set({ 'n', 'v' }, 'j', 'gj', { desc = 'Move sub line' })
-- vim.keymap.set({ 'n', 'v' }, 'k', 'gk', { desc = 'Move sub line' })

-- Visual mode JK to mode selected text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Join line below but keep cursor position the same
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join line below and keep cursor position the same' })

-- Center cursor after moving screen
vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Center cursor after moving screen' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Center cursor after moving screen' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor after moving screen' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor after moving screen' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center cursor after moving screen' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center cursor after moving screen' })

-- Basic movement and jumping
vim.keymap.set({ 'n', 'o', 'v' }, '<c-l>', '$', { desc = 'Jump to end of line' })
vim.keymap.set({ 'n', 'o', 'v' }, '<c-h>', '^', { desc = 'Jump to start of line' })
vim.keymap.set({ 'n', 'o', 'v' }, '<c-k>', '%', { desc = 'Jump between braces' })

-- Insert new line above and stay in Normal mode
vim.keymap.set('n', 'O', 'o<esc>', { desc = 'New line above' })

-- Select all with <C-a>
vim.keymap.set({ 'i', 'n', 'v' }, '<C-a>', '<esc>ggVG', { desc = 'Select all' })

-- Paste over selected text without losing current clipboard
vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without losing keep clipboard' })

-- Keybinds to make split navigation easier.
--  Use ALT+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- <esc><esc>
vim.keymap.set('t', 'jj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--[[ COMMANDS ]]
-- Save file with <C-s>
vim.keymap.set({ 'i', 'n' }, '<C-s>', '<cmd> w <cr>', { desc = 'Save file' })

-- Cycle through files in current buffer
vim.keymap.set('n', '<c-o>', '<cmd> bn <cr>', { desc = 'Next file in current buffer' })
vim.keymap.set('n', '<c-i>', '<cmd> bp <cr>', { desc = 'Prev file in current buffer' })
-- split, prev buffer, window up, delete buffer (performance?)
vim.keymap.set('n', '<leader>xb', '<cmd> sp <cr> <cmd> bp <cr> <c-w>k <cmd> bd! <cr>', { desc = '[X]Quit [B]uffer Current' })

-- Replace regex string current file
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [R]egex String' })

-- Source current file
vim.keymap.set('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source File' })

-- Toggle line number
vim.keymap.set('n', '<leader>tn', '<cmd>set nu!<CR>', { desc = '[T]oggle [N]umber Line' })
vim.keymap.set('n', '<leader>tr', '<cmd>set rnu!<CR>', { desc = '[T]oggle [R]elative Number Line' })

-- Close window
vim.keymap.set('n', '<leader>xx', '<cmd> q <cr>', { desc = '[X]Quit Current' })
vim.keymap.set('n', '<leader>xa', '<cmd> qa <cr>', { desc = '[X]Quit [A]ll' })

-- Open terminals
vim.keymap.set('n', '<leader>tt', '<cmd> ter <cr>', { desc = '[T]oggle [T]erminal' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to [D]iagnostic [P]revious message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to [D]iagnostic [N]ext message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- TODO:
-- new buffer mapping
-- Toggle Terminals (vertical, horizontal, float etc.)

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --  Uncomment the following line and add your plugins to `lua/minhhoccode/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  require 'minhhoccode',

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
}, {
  -- Configuration, checkout the docs below
  -- https://github.com/folke/lazy.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },

  -- Some basics performance lazy docs
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },

  -- Enable profiling of lazy.nvim. This will add some overhead,
  -- so only enable this when you are debugging lazy.nvim
  profiling = {
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = false,
    -- Track each new require in the Lazy profiling tab
    require = false,
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
