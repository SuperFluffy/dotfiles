local utils = require('utils')

-- vim.g.lightline = { colorscheme = 'dracula';
-- 	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
-- 	component_function = { gitbranch = 'FugitiveHead', };
-- 	component_expand = { buffers = 'lightline#bufferline#buffers', };
-- 	component_type = { buffers = 'tabsel', };
-- 	tabline = { left = { { 'buffers'  } }, right = { { 'close' } } };
-- }

vim.g.lightline = { colorscheme = 'solarized';
	active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
	component_function = { gitbranch = 'FugitiveHead', };
	component_expand = { buffers = 'lightline#bufferline#buffers', };
	component_type = { buffers = 'tabsel', };
	tabline = { left = { { 'buffers'  } }, right = { { 'close' } } };
}

utils.opt('o', 'showmode', false) -- hide show mode because lightline takes care of that
