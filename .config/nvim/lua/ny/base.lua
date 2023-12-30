-- Base Configuration

local o = vim.o

-- GUI
o.number = true
o.mouse = 'a'
o.termguicolors = true

-- Clipboard
o.clipboard = 'unnamedplus'

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.cmdheight = 0

-- Search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Map <leader> to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

