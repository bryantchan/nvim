return function()
    local map = vim.keymap.set
    local set = vim.opt
    local utils = require "core.utils"

    -- Set options
    set.timeoutlen = 600

    -- Remap space as leader key
    vim.g.mapleader = ";"

    map("n", "sh", "<C-w>h")
    map("n", "sk", "<C-w>k")
    map("n", "sj", "<C-w>j")
    map("n", "sl", "<C-w>l")

    map("n", "<leader><S-h>", ":vertical resize +5<CR>")
    map("n", "<leader><S-j>", ":resize -5<CR>")
    map("n", "<leader><S-k>", ":resize +5<CR>")
    map("n", "<leader><S-l>", ":vertical resize -5<CR>")

    -- Set key bindings
    map("n", "<C-s>", ":w!<CR>")
    map("n", "<C-a>", "gg<S-v>G")
    map("n", "sgs", ":G<CR>")
    -- Edit vimr configuration file
    map("n", "<leader><S-e>", "<cmd>e ~/.config/nvim/lua/user/init.lua<CR>")

    map("n", "zv", "<C-w>|")
    map("n", "zs", "<C-w>_")
    map("n", "zo", "<C-w>=")
    map("n", "sv", "<cmd>vsplit<CR>")
    map("n", "ss", "<cmd>split<CR>")

    map("n", "<leader>w", "<cmd>set wrap<CR>")
    map("n", "<leader>nw", "<cmd>set nowrap<CR>")
    map("n", "gn", "<cmd>cn<CR>")
    map("n", "gp", "<cmd>cp<CR>")

    map("n", "<leader>d", '"_d')
    map("n", "x", '"_x')
    map("v", "<S-y>", '"+y')
    map("n", "<S-p>", '"+p')
    map("x", "p", '"_dP')

    map("n", "gb", "<cmd>:G blame<cr>")
    map("n", "<leader>dd", "<cmd>:DogeGenerate<cr>")

    -- Find files
    -- ----------

    map("n", "<leader>mm", function()
        require("telescope.builtin").keymaps()
    end, {
        desc = "Show keymaps"
    })

    map("n", "ma", function()
        require("telescope").extensions.vim_bookmarks.all()
    end, {
        desc = "Show Bookmarks"
    })

    map("n", "<leader>;", function()
        require("telescope.builtin").current_buffer_fuzzy_find()
    end, {
        desc = "Find Lines"
    })

    map("n", "<leader>f", function()
        require("telescope.builtin").find_files({
            hidden = true
        })
    end, {
        desc = "Telescope search files"
    })

    map("n", "<leader>s", function()
        require("telescope.builtin").grep_string()
    end, {
        desc = "Telescope search current word"
    })

    map("n", "<leader>r", function()
        require("telescope").extensions.live_grep_args.live_grep_args()
    end, {
        desc = "Telescope search words"
    })

    map("n", "<leader>b", function()
        require("telescope.builtin").buffers({
            sort_mru = true,
            ignore_current_buffer = true
        })
    end, {
        desc = "Telescope search buffers"
    })

    map("n", "<leader>o", function()
        require("telescope.builtin").oldfiles()
    end, {
        desc = "Find old files"
    })

    map("n", "<leader>y", function()
        require("telescope.builtin").registers()
    end, {
        desc = "Find registers"
    })

    map("n", "<leader>x", function()
        require("telescope.builtin").diagnostics({
            bufnr = 0
        })
    end, {
        desc = "Find Diagnostics in current buffer"
    })

    map("n", "<leader>]", function()
        require("telescope.builtin").diagnostics()
    end, {
        desc = "Find All Diagnostics"
    })

    -- ====
    -- Git 
    -- ====
    -- map("n", "<leader>gb", function()
    --     require("telescope.builtin").git_branches()
    -- end, {
    --     desc = "Checkout branches"
    -- })
    --
    -- map("n", "<leader>gc", function()
    --     require("telescope.builtin").git_commits()
    -- end, {
    --     desc = "Git Commits"
    -- })
    --
    -- map("n", "<leader>gm", function()
    --     require("telescope.builtin").git_bcommits()
    -- end, {
    --     desc = "Git Commits for current buffer"
    -- })

    map("n", "<leader>q", function()
        require("telescope.builtin").quickfix()
    end, {
        desc = "Quick fix"
    })

    map("n", "<leader>e", function()
        require("telescope.builtin").lsp_document_symbols()
    end, {
        desc = "Document Symbols"
    })

    -- Comment
    if utils.is_available "Comment.nvim" then
        map("n", "<leader><Space>", function()
            require("Comment.api").toggle.linewise.current()
        end, {
            desc = "Comment line"
        })
        map("v", "<leader><Space>",
            "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        {
            desc = "Toggle comment line"
        })
    end

    vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", {
        noremap = true
    })
    vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", {
        noremap = true
    })
    vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", {
        noremap = true
    })
    vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", {
        noremap = true
    })
    vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", {
        noremap = true
    })
    -- move current tab to previous position
    vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", {
        noremap = true
    })
    -- move current tab to next position
    vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", {
        noremap = true
    })

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", {})
    vim.api.nvim_create_autocmd("BufWritePost", {
        desc = "Sync packer after modifying plugins.lua",
        group = "packer_conf",
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync"
    })
end
