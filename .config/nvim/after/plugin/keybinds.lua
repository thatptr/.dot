-- Keymaps
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- Harpoon
Map("n", "<M-q>", ":lua require('harpoon.mark').add_file()<CR>")
Map("n", "<M-x>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
Map("n", "<M-1>", ":lua require('harpoon.ui').nav_file(1)<CR>")
Map("n", "<M-2>", ":lua require('harpoon.ui').nav_file(2)<CR>")
Map("n", "<M-3>", ":lua require('harpoon.ui').nav_file(3)<CR>")
