vim.opt.backup = false         -- creates a backup file
vim.opt.clipboard = ""
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = false       -- highlight all matches on previous search pattern
vim.opt.ignorecase = true      -- ignore case in search patterns
vim.opt.mouse = ""
vim.opt.pumheight = 20         -- pop up menu height
vim.opt.showtabline = 0        -- always show tabs
vim.opt.smartcase = true       -- smart case
vim.opt.smartindent = true     -- make indenting smarter again
vim.opt.splitbelow = true      -- force all horizontal splits to go below current window
vim.opt.splitright = true      -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true   -- set term gui colors (most terminals support this)
vim.opt.showmatch = true       -- Show matching brackets
vim.opt.expandtab = true       -- convert tabs to spaces
vim.opt.shiftwidth = 2         -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2            -- insert 2 spaces for a tab
vim.opt.number = true          -- set numbered lines
vim.opt.relativenumber = true  -- set relative numbered lines
vim.opt.numberwidth = 4        -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"     -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false           -- display lines as one long line
vim.opt.swapfile = false       -- creates a swapfile
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shell = 'pwsh'
vim.opt.cursorline = true

local vim_undo_dir = vim.fn.expand("$HOME") .. "\\AppData\\Local\\nvim-data\\undodir"

-- Check if the directory exists
if vim.fn.isdirectory(vim_undo_dir) == 0 then
  vim.fn.mkdir(vim_undo_dir, "p")
end

vim.opt.undodir = vim_undo_dir
vim.opt.undofile = true -- enable persistent undo
