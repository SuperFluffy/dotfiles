local utils = require 'utils'

local cmd = vim.cmd
local indent_len = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'

utils.opt('b', 'expandtab', true) -- expand tabs to spaces
utils.opt('b', 'shiftwidth', indent_len) -- when shifting, shift by <indent_len>
utils.opt('b', 'smartindent', true) -- when inserting a new line indent the next line based on current
utils.opt('b', 'tabstop', indent_len) -- a tab accounts for <indent_len> spaces

-- How to remove preview form completeopt?
-- utils.opt('o', 'completeopt', -=preview) -- Prevent nvim from opening the scratch preview window
utils.opt('o', 'completeopt', 'menuone,noselect')
utils.opt('o', 'hidden', true) -- allow to switch away from editted buffers without first saving
utils.opt('o', 'mouse', 'a') -- enable mouse interaction in all modes
utils.opt('o', 'laststatus', 3) -- always have a status line
utils.opt('o', 'scrolloff', 4 ) -- keep a "margin" of 4 lines at the bottom and top of a buffer
utils.opt('o', 'shiftround', true) -- round to multiples of <shiftwidth> when shifting lines
utils.opt('o', 'showtabline', 2) -- always show the tabline
utils.opt('o', 'splitbelow', true) -- when splitting horizontally, split below the current window
utils.opt('o', 'splitright', true) -- when splitting vertically, split to the right of the current window
utils.opt('o', 'startofline', false) -- Store and restore the cursor position when changing around buffers
utils.opt('o', 'wildmode', 'list:longest,full')

-- utils.opt('w', 'foldmethod', 'syntax') -- 
utils.opt('w', 'colorcolumn', '100')
utils.opt('w', 'number', true) -- Show line numbers
utils.opt('w', 'relativenumber', true) -- Show numbers relative to the current row.
utils.opt('w', 'signcolumn', 'yes') -- Always display the sign column

vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
