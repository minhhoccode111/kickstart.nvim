local map = vim.keymap.set
-- local nomap = vim.keymap.del

--[[ KEYS ]]

-- Enter Normal mode from Insert mode
map('i', 'jj', '<esc>', { desc = 'Enter Normal mode from Insert mode' })

-- gj, gk instead of j, k. Turn off since not set line wrap
-- map({ 'n', 'v' }, 'j', 'gj', { desc = 'Move sub line' })
-- map({ 'n', 'v' }, 'k', 'gk', { desc = 'Move sub line' })

-- Visual mode JK to mode selected text
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Join line below but keep cursor position the same
map('n', 'J', 'mzJ`z', { desc = 'Join line below and keep cursor position the same' })

-- Center cursor after moving screen
map('n', '<c-f>', '<c-f>zz', { desc = 'Center cursor after moving screen' })
map('n', '<c-b>', '<c-b>zz', { desc = 'Center cursor after moving screen' })
map('n', '<c-d>', '<c-d>zz', { desc = 'Center cursor after moving screen' })
map('n', '<c-u>', '<c-u>zz', { desc = 'Center cursor after moving screen' })
map('n', 'n', 'nzzzv', { desc = 'Center cursor after moving screen' })
map('n', 'N', 'Nzzzv', { desc = 'Center cursor after moving screen' })

-- Basic movement and jumping
map({ 'n', 'o', 'v' }, 'H', '^', { desc = 'Jump to start of line' })
map({ 'n', 'o', 'v' }, 'L', '$', { desc = 'Jump to end of line' })
-- no Visual since it is used to move line up and down
map({ 'n', 'o' }, 'K', '%', { desc = 'Jump between braces' })

-- Insert new line above and stay in Normal mode
map('n', 'O', 'o<esc>', { desc = 'New line above' })

-- Insert new line and move cursor down in Insert mode
-- map('i', '<c-j>', '<esc>o', { desc = 'New line in Insert mode' })

-- Select all with <C-a>
map({ 'i', 'n', 'v' }, '<C-a>', '<esc>ggVG', { desc = 'Select all' })

-- Paste over selected text without losing current clipboard
map('x', '<leader>p', '"_dP', { desc = 'Paste without losing keep clipboard' })

-- Keybinds to make split navigation easier.
--  Use ALT+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<c-h>', '<c-w><c-h>', { desc = 'Move focus to the left window' })
map('n', '<c-l>', '<c-w><c-l>', { desc = 'Move focus to the right window' })
map('n', '<c-j>', '<c-w><c-j>', { desc = 'Move focus to the lower window' })
map('n', '<c-k>', '<c-w><c-k>', { desc = 'Move focus to the upper window' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- <esc><esc>
map('t', 'jj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--[[ COMMANDS ]]

-- Save file with <C-s>
map({ 'i', 'n' }, '<C-s>', '<cmd> w <cr>', { desc = 'Save file' })

-- Replace regex string current file
map('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [R]egex String' })

-- Source current file
map('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source File' })

-- Toggle line number
map('n', '<leader>Tn', '<cmd>set nu!<CR>', { desc = '[T]oggle [N]umber Line' })
map('n', '<leader>Tr', '<cmd>set rnu!<CR>', { desc = '[T]oggle [R]elative Number Line' })

-- Close window
map('n', '<leader>xx', '<cmd> q <cr>', { desc = '[X]Close w/ :q' })
map('n', '<leader>xa', '<cmd> qa <cr>', { desc = '[X]Close w/ :q[a]' })

-- Change window Width
map('n', '<c-,>', '<c-w><', { desc = 'Decrease Window Width' })
map('n', '<c-.>', '<c-w>>', { desc = 'Increase Window Width' })

-- Split window
map('n', '<leader>-', '<cmd> sp <cr>', { desc = 'New [-]Horizon Window' })
map('n', '<leader>|', '<cmd> vsp <cr>', { desc = 'New [|]Vertical Window' })

-- Extra terminal keymaps in term.lua

-- Cycle through files in current buffer
map('n', '<c-o>', '<cmd> bn <cr>', { desc = 'Next Buffer', silent = true })
map('n', '<c-i>', '<cmd> bp <cr>', { desc = 'Prev Buffer', silent = true })

-- Pick buffer to close
map('n', '<leader>xp', '<cmd>lua require("bufferline").close_with_pick()<cr>', { desc = '[X]Close [P]ick Buffer' })

-- Close current buffer
map('n', '<leader>xb', '<cmd> bd <cr>', { desc = '[X]Close w/ :[b]d', silent = true })

-- Diagnostic keymaps
map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to [D]iagnostic [P]revious message' })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to [D]iagnostic [N]ext message' })
map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

map('n', '<leader>mm', '<cmd>Mason<cr>', { desc = '[M]anager [M]ason' })
map('n', '<leader>ml', '<cmd>Lazy<cr>', { desc = '[M]anager [L]azy' })

return {}
