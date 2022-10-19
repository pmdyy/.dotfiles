return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use({
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end
    })

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use('neovim/nvim-lspconfig')
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function() require("null-ls").setup() end,
        requires = {"nvim-lua/plenary.nvim"}
    })

    use "lukas-reineke/indent-blankline.nvim"

    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("toggleterm").setup {
                shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
                direction = 'float',
                float_opts = {border = 'curved'}
            }
        end
    }

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                pre_hook = require(
                    'ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
            })
        end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use({
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({default = true})
        end
    })

    use({
        'jameshiew/nvim-magic',
        config = function() require('nvim-magic').setup() end,
        requires = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
    })

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    -- Themes
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")

    use("nvim-treesitter/nvim-treesitter",
        {run = ":TSUpdate", config = function() end})
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
      'nvim-tree/nvim-tree.lua',
      config = function() 
        require("nvim-tree").setup()
      end,
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- use {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    --     requires = {
    --         "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    --         "MunifTanjim/nui.nvim"
    --     }
    -- }

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        "folke/zen-mode.nvim",
        event = "BufWinEnter",
        config = function()
            require("zen-mode").setup {
                window = {
                    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    -- height and width can be:
                    -- * an absolute number of cells when > 1
                    -- * a percentage of the width / height of the editor when <= 1
                    -- * a function that returns the width or the height
                    width = 120, -- width of the Zen window
                    height = 1, -- height of the Zen window
                    -- by default, no options are changed for the Zen window
                    -- uncomment any of the options below, or add other vim.wo options you want to apply
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        relativenumber = false, -- disable relative numbers
                        cursorline = false, -- disable cursorline
                        cursorcolumn = false, -- disable cursor column
                        foldcolumn = "0", -- disable fold column
                        list = false, -- disable whitespace characters
                        colorcolumn = "0"
                    }
                },
                plugins = {
                    -- disable some global vim options (vim.o...)
                    -- comment the lines to not apply the options
                    options = {
                        enabled = true,
                        ruler = false, -- disables the ruler text in the cmd line area
                        showcmd = false -- disables the command in the last line of the screen
                    },
                    twilight = {enabled = true}, -- enable to start Twilight when zen mode opens
                    gitsigns = {enabled = false}, -- disables git signs
                    -- tmux = {enabled = false}, -- disables the tmux statusline
                    -- this will change the font size on kitty when in zen mode
                    -- to make this work, you need to set the following kitty options:
                    -- - allow_remote_control socket-only
                    -- - listen_on unix:/tmp/kitty
                    kitty = {
                        enabled = false,
                        font = "+4" -- font size increment
                    }
                },
                -- callback where you can add custom code when the Zen window opens
                on_open = function(win) end,
                -- callback where you can add custom code when the Zen window closes
                on_close = function() end
            }
        end
    }

    -- use {
    --     'abecodes/tabout.nvim',
    --     config = function()
    --         require('tabout').setup {
    --             tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    --             backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    --             act_as_tab = true, -- shift content if tab out is not possible
    --             act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    --             default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    --             default_shift_tab = '<C-d>', -- reverse shift default action,
    --             enable_backwards = true, -- well ...
    --             completion = true, -- if the tabkey is used in a completion pum
    --             tabouts = {
    --                 {open = "'", close = "'"}, {open = '"', close = '"'},
    --                 {open = '`', close = '`'}, {open = '(', close = ')'},
    --                 {open = '[', close = ']'}, {open = '{', close = '}'}
    --             },
    --             ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    --             exclude = {} -- tabout will ignore these filetypes
    --         }
    --     end,
    --     wants = {'nvim-treesitter'}, -- or require if not used so far
    --     after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    -- }

end)
