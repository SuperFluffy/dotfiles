vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
function()
    use {'wbthomason/packer.nvim', opt = true}
    use 'lukas-reineke/indent-blankline.nvim' 

    use "nvim-lua/plenary.nvim"
    -- -- use "lewis6991/gitsigns.nvim"
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use {
        'itchyny/lightline.vim',
        requires = 'tpope/vim-fugitive'
    }
    use {
        'mengelbrecht/lightline-bufferline',
        requires = 'itchyny/lightline.vim'
    }

    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }

    use 'kyazdani42/nvim-tree.lua'

    -- Common configurations for nvim LSP client
    use "neovim/nvim-lspconfig"

    -- Completion framework
    use "hrsh7th/nvim-cmp"
    -- LSP completion source for nvim-cmp
    use "hrsh7th/cmp-nvim-lsp"
    -- Snippet completion source for nvim-cmp
    use "hrsh7th/cmp-vsnip"
    -- Buffer completion source for nvim-cmp
    use "hrsh7th/cmp-buffer"
    -- Path completion source for nvim-cmp
    use "hrsh7th/cmp-path"

    use "simrat39/rust-tools.nvim"

    -- Snippet engine
    use "hrsh7th/vim-vsnip"

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        requires = 'nvim-telescope/telescope.nvim'
    }
    use {
        'nvim-telescope/telescope-ui-select.nvim',
        requires = 'nvim-telescope/telescope.nvim'
    }

    use 'shaunsingh/solarized.nvim'

    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
end
)
