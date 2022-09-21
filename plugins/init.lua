return {
  ["folke/which-key.nvim"] = {
    disable = true,
  },
  ["feline-nvim/feline.nvim"] = {
    disable = true,
  },
  ["akinsho/bufferline.nvim"] = {
    disable = true,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    disable = true,
  },
  {
    "kdheepak/tabline.nvim",
    config = function() require("tabline").setup { enable = false } end,
    requires = { "hoob3rt/lualine.nvim", "kyazdani42/nvim-web-devicons" },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function() require("lualine").setup(require "user.plugins.lualine-conf") end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  },
  {
    "tiagovla/scope.nvim",
    config = function() require("scope").setup() end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function() require("telescope").load_extension "file_browser" end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function() require("telescope").load_extension "live_grep_args" end,
  },
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function() require("telescope").load_extension "vim_bookmarks" end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    config = function() require("telescope").load_extension "project" end,
  },
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    config = function() require("user.plugins.vim-doge-conf").setup() end,
    cmd = { "DogeGenerate", "DogeCreateDocStandard" },
  },
  {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
  },
  { "MattesGroeger/vim-bookmarks" },
  { "mattn/emmet-vim" },
  { "tpope/vim-fugitive" },
  { "Mofiqul/dracula.nvim" },
  { "mg979/vim-visual-multi" },
  { "tpope/vim-surround" },
  { "ggandor/lightspeed.nvim" },
}
