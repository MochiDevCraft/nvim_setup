vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use ( 'nvim-treesitter/playground')
    use ( 'ThePrimeagen/harpoon')
    use ( 'mbbill/undotree')
    use ( 'tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = nil
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
        end
    }
end)

