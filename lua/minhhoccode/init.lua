-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- settings
require 'minhhoccode.set'

-- keymaps
require 'minhhoccode.map'

-- plugins
return {
  require 'minhhoccode.plugins.autopairs',
  require 'minhhoccode.plugins.neotree',
  require 'minhhoccode.plugins.gitsigns',
  require 'minhhoccode.plugins.conform',
  require 'minhhoccode.plugins.lspconfig',
  require 'minhhoccode.plugins.mini',
  require 'minhhoccode.plugins.nvimcmp',
  require 'minhhoccode.plugins.telescope',
  require 'minhhoccode.plugins.treesitter',
  require 'minhhoccode.plugins.comment',
  require 'minhhoccode.plugins.other',
  require 'minhhoccode.plugins.tokyonight',
  require 'minhhoccode.plugins.whichkey',
}
