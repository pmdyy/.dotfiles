local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s', ':w<CR>', {})
keymap('i', '<c-s', '<Esc>:w<CR>a', {})
local opts = {noremap = true}
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- TermToggle
keymap('n', '<c-t>', ':ToggleTerm<CR>', {})
keymap('t', '<c-t>', '<C-\\><C-n>:q<CR>', {})

-- ZenMode, map :ZenMode command on 'Z'
keymap('n', 'z', ':ZenMode<CR>', {})

-- NvimTree, map :NvimTreeToggle command on 'Ctrl+e'
keymap('n', '<c-e>', ':Neotree toggle reveal<cr>', opts)
