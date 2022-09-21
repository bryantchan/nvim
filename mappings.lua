local utils = require "core.utils"
local maps = { n = {}, v = {}, t = {}, x = {}, [""] = {} }

maps.n["sh"] = { "<C-w>h" }
maps.n["sk"] = { "<C-w>k" }
maps.n["sj"] = { "<C-w>j" }
maps.n["sl"] = { "<C-w>l" }

maps.n["<leader><S-h>"] = { ":vertical resize +5<CR>" }
maps.n["<leader><S-j>"] = { ":resize -5<CR>" }
maps.n["<leader><S-k>"] = { ":resize +5<CR>" }
maps.n["<leader><S-l>"] = { ":vertical resize -5<CR>" }

-- Set key bindings
maps.n["<C-s>"] = { ":w!<CR>" }
maps.n["<C-a>"] = { "gg<S-v>G" }
-- Edit vimr configuration file
maps.n["<leader><S-e>"] = { "<cmd>e ~/.config/nvim/lua/user/init.lua<CR>" }

maps.n["zv"] = { "<C-w>|" }
maps.n["zs"] = { "<C-w>_" }
maps.n["zo"] = { "<C-w>=" }
maps.n["sv"] = { "<cmd>vsplit<CR>" }
maps.n["ss"] = { "<cmd>split<CR>" }

maps.n["<leader>w"] = { "<cmd>set wrap<CR>" }
maps.n["<leader>nw"] = { "<cmd>set nowrap<CR>" }
maps.n["gn"] = { "<cmd>cn<CR>" }
maps.n["gp"] = { "<cmd>cp<CR>" }

maps.n["<leader>d"] = { '"_d' }
maps.n["x"] = { '"_x' }
maps.v["<S-y>"] = { '"+y' }
maps.n["<S-p>"] = { '"+p' }
maps.x["p"] = { '"_dP' }

maps.n["<leader>dd"] = { "<cmd>:DogeGenerate<cr>" }
maps.n["<C-b>"] = { "<cmd>:AerialToggle<cr>" }

-- ====
-- Git
-- ====
maps.n["<leader>gs"] = { ":G<CR>" }
maps.n["<leader>gl"] = { ":G blame<CR>" }
maps.n["<leader>gb"] = { function() require("telescope.builtin").git_branches() end, desc = "Checkout branches" }
maps.n["<leader>gc"] = { function() require("telescope.builtin").git_commits() end, desc = "Git Commits" }
maps.n["<leader>gm"] =
  { function() require("telescope.builtin").git_bcommits() end, desc = "Git Commits for current buffer" }
-- --

maps.n["<leader>mm"] = { function() require("telescope.builtin").keymaps() end, desc = "Show keymaps" }
maps.n["ma"] = { function() require("telescope").extensions.vim_bookmarks.all() end, desc = "Show Bookmarks" }
maps.n["sf"] =
  { function() require("telescope").extensions.file_browser.file_browser { path = "%:p:h" } end, desc = "File Browser" }
maps.n["<leader>;"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find Lines" }
maps.n["<leader>f"] =
  { function() require("telescope.builtin").find_files { hidden = true } end, desc = "Telescope search files" }
maps.n["<leader>s"] =
  { function() require("telescope.builtin").grep_string() end, desc = "Telescope search current word" }
maps.n["<leader>r"] =
  { function() require("telescope").extensions.live_grep_args.live_grep_args() end, desc = "Telescope search words" }

maps.n["<leader>b"] = {
  function()
    require("telescope.builtin").buffers {
      sort_mru = true,
      ignore_current_buffer = true,
    }
  end,
  desc = "Telescope search buffers",
}

maps.n["<leader>o"] = { function() require("telescope.builtin").oldfiles() end, desc = "Find old files" }
maps.n["<leader>pp"] = { function() require("telescope").extensions.project.project() end, desc = "Project Picker" }
maps.n["<leader>y"] = { function() require("telescope.builtin").registers() end, desc = "Find registers" }
maps.n["<leader>x"] = {
  function()
    require("telescope.builtin").diagnostics {
      bufnr = 0,
    }
  end,
  desc = "Find Diagnostics in current buffer",
}

maps.n["<leader>]"] = { function() require("telescope.builtin").diagnostics() end, desc = "Find All Diagnostics" }
maps.n["<leader>q"] = { function() require("telescope.builtin").quickfix() end, desc = "Quick fix" }
maps.n["<leader>e"] = { function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document Symbols" }

-- Comment
if utils.is_available "Comment.nvim" then
  maps.n["<leader><Space>"] = {
    function() require("Comment.api").toggle.linewise.current() end,
    desc = "Comment line",
  }
  maps.v["<leader><Space>"] = {
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    desc = "Toggle comment line",
  }
end

return maps
