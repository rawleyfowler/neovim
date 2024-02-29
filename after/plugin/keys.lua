local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-h>', '<Cmd>BufferPrev<CR>', opts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-x>', '<Cmd>BufferClose<CR>', opts)
