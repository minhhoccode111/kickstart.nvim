-- other tiny plugins

return {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    -- { 'windwp/nvim-ts-autotag' },
    -- opts = {},
  },

  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
}

--[[ 
NOTE:
TODO:
FIXME:
FIX:
BUG:
WARN:
HACK:
PERF:
TEST: 

]]
