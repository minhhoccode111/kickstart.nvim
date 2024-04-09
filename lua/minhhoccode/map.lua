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
map('n', '<C-f>', '<C-f>zz', { desc = 'Center cursor after moving screen' })
map('n', '<C-b>', '<C-b>zz', { desc = 'Center cursor after moving screen' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Center cursor after moving screen' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Center cursor after moving screen' })
map('n', 'n', 'nzzzv', { desc = 'Center cursor after moving screen' })
map('n', 'N', 'Nzzzv', { desc = 'Center cursor after moving screen' })

-- Basic movement and jumping
map({ 'n', 'o', 'v' }, '<c-l>', '$', { desc = 'Jump to end of line' })
map({ 'n', 'o', 'v' }, '<c-h>', '^', { desc = 'Jump to start of line' })
map({ 'n', 'o', 'v' }, '<c-k>', '%', { desc = 'Jump between braces' })

-- Insert new line above and stay in Normal mode
map('n', 'O', 'o<esc>', { desc = 'New line above' })

-- Select all with <C-a>
map({ 'i', 'n', 'v' }, '<C-a>', '<esc>ggVG', { desc = 'Select all' })

-- Paste over selected text without losing current clipboard
map('x', '<leader>p', '"_dP', { desc = 'Paste without losing keep clipboard' })

-- Keybinds to make split navigation easier.
--  Use ALT+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- Cycle through files in current buffer
map('n', '<c-o>', '<cmd> bn <cr>', { desc = 'Next file in current buffer' })
map('n', '<c-i>', '<cmd> bp <cr>', { desc = 'Prev file in current buffer' })
-- split, prev buffer, window up, delete buffer (performance?)
map('n', '<leader>xb', '<cmd> sp <cr> <cmd> bp <cr> <c-w>k <cmd> bd! <cr>', { desc = '[X]Quit [B]uffer Current' })

-- Replace regex string current file
map('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[R]eplace [R]egex String' })

-- Source current file
map('n', '<leader><leader>', function()
  vim.cmd 'so'
end, { desc = 'Source File' })

-- Toggle line number
map('n', '<leader>tn', '<cmd>set nu!<CR>', { desc = '[T]oggle [N]umber Line' })
map('n', '<leader>tr', '<cmd>set rnu!<CR>', { desc = '[T]oggle [R]elative Number Line' })

-- Close window
map('n', '<leader>xx', '<cmd> q <cr>', { desc = '[X]Quit Current' })
map('n', '<leader>xa', '<cmd> qa <cr>', { desc = '[X]Quit [A]ll' })

-- Open terminals
map('n', '<leader>tt', '<cmd> ter <cr>', { desc = '[T]oggle [T]erminal' })

-- Diagnostic keymaps
map('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to [D]iagnostic [P]revious message' })
map('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to [D]iagnostic [N]ext message' })
map('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic [E]rror messages' })
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })

-- Toggle Terminals (vertical, horizontal, float etc.) -- TODO:

return {}
