vim.opt.smarttab = true
vim.opt.wildignore = { '*.o', '*.a', 'node_modules', '__pycache__', 'sdist' }

local TAB_WIDTH = 4
vim.opt.tabstop = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true
vim.opt.number = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.cmd([[
    autocmd BufNewFile,BufRead *.tt setf tt2
]])
