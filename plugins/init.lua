return {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },
    ["folke/which-key.nvim"] = {
        disable = true
    },
    ["akinsho/bufferline.nvim"] = {
        disable = true
    },
    ["nvim-neo-tree/neo-tree.nvim"] = {
        disable = true
    },
    ["glepnir/dashboard-nvim"] = {
        disable = true
    },
    ["karb94/neoscroll.nvim"] = {
        disable = true
    },
    -- ["declancm/cinnamon.nvim"] = {
    --     disable = true
    -- },
    ["akinsho/nvim-toggleterm.lua"] = {
        disable = true
    },
    -- ["lewis6991/gitsigns.nvim"] = { disable = true },
    -- {
    --     "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function()
    --         require("trouble").setup {
    --             position = "left"
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- },
    -- {
    --     "folke/todo-comments.nvim",
    --     requires = "nvim-lua/plenary.nvim",
    --     config = function()
    --         require("todo-comments").setup {}
    --     end
    -- },
    {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby").setup({
                tabline = require("user.plugins.tabby-conf").tab_only
            })
        end
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
        end
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup()
        end
    },
    {
        'tom-anders/telescope-vim-bookmarks.nvim',
        config = function()
            require('telescope').load_extension('vim_bookmarks')
        end,
    },
    {
        'kkoomen/vim-doge',
        run = ":call doge#install()",
        config = function()
            require("user.plugins.vim-doge-conf").setup()
        end,
        cmd = { "DogeGenerate", "DogeCreateDocStandard" },
    },
    {'MattesGroeger/vim-bookmarks'},
    {'Shougo/defx.nvim'},
    {'mattn/emmet-vim'},
    {'alvan/vim-closetag'},
    {'maxmellon/vim-jsx-pretty'},
    {"tpope/vim-repeat"},
    {"tpope/vim-fugitive"},
    {"tpope/vim-surround"},
    {"mg979/vim-visual-multi"}
}
