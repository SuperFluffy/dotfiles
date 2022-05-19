require('telescope').setup {
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown { }
        }
    }
} 
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('ui-select')
-- require('telescope').load_extension('snippets')
-- require('telescope').load_extension('media_files')
