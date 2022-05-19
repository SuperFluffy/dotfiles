local utils = require('utils')

require('nvim-treesitter.configs').setup {
  ensure_installed = {
      "bash",
      "c",
      "dockerfile",
      "fish",
      "go",
      "json",
      "lua",
      "markdown",
      "rust",
      "javascript",
      "typescript",
      "yaml",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },              -- list of language that will be disabled
  },
}

-- Currently buggy
utils.opt('w', 'foldmethod', 'expr')
utils.opt('w', 'foldexpr', 'nvim_treesitter#foldexpr()')
