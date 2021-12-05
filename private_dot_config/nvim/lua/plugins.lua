vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
function()
    use {'wbthomason/packer.nvim', opt = true}
    use {"lukas-reineke/indent-blankline.nvim", branch = "lua", disable = true}

    use "nvim-lua/plenary.nvim"
    -- -- use "lewis6991/gitsigns.nvim"
    use 'tpope/vim-abolish'
    use 'tpope/vim-fugitive'
    use "nvim-lua/popup.nvim"
    use {
        'itchyny/lightline.vim',
        requires = 'tpope/vim-fugitive'
    }
    use {
        'mengelbrecht/lightline-bufferline',
        requires = 'itchyny/lightline.vim'
    }

    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
    --
    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        requires = 'nvim-telescope/telescope.nvim'
    }

    use {'dracula/vim', as = 'dracula' }
    use 'shaunsingh/solarized.nvim'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
        -- use "nekonako/xresources-nvim"
    --
    -- snippets
    use "hrsh7th/vim-vsnip"
    -- use "rust-lang/vscode-rust"
end
)
