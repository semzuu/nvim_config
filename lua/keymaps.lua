local keymap = vim.keymap

vim.g.mapleader = ' '

--Delete without copying to clipboard
keymap.set('n', 'x', '"_x')

--Moving lines
keymap.set('n', '<M-j>', ":m +1<Cr>")
keymap.set('n', '<M-k>', ":m -2<CR>")

--File Explorer
keymap.set('n', '<leader>fe', ':Ex<CR>')
