return {
    ["NvChad/nvim-colorizer.lua"] = {
        disable = true
    },
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
    ["akinsho/nvim-toggleterm.lua"] = {
        disable = true
    },
    {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby").setup({
                tabline = require("user.plugins.tabby-conf").tab_only
            })
        end
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup()
        end
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        config = function()
            require('telescope').load_extension('file_browser')
        end
    },
    {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
            require('telescope').load_extension('live_grep_args')
        end
    },
    {
        'tom-anders/telescope-vim-bookmarks.nvim',
        config = function()
            require('telescope').load_extension('vim_bookmarks')
        end
    },
    {
        'kkoomen/vim-doge',
        run = ":call doge#install()",
        config = function()
            require("user.plugins.vim-doge-conf").setup()
        end,
        cmd = {"DogeGenerate", "DogeCreateDocStandard"}
    },
    {
        "EdenEast/nightfox.nvim",
        config = function()
        end
    },
    {"cocopon/iceberg.vim"},
    {'MattesGroeger/vim-bookmarks'},
    {'mattn/emmet-vim'},
    {'alvan/vim-closetag'},
    {'maxmellon/vim-jsx-pretty'},
    {"tpope/vim-repeat"},
    {"tpope/vim-fugitive"},
    {"tpope/vim-surround"},
    {"mg979/vim-visual-multi"}
}
