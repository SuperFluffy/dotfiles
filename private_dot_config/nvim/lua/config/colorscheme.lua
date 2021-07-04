-- require 'dracula'
local utils = require('utils')

-- utils.opt('o', 'termguicolors', true)
-- vim.cmd 'colorscheme dracula'
require('solarized').set()

-- Set the background to light because for whatever reason solarized.nvim sets it to dark
utils.opt('o', 'background', 'light')
