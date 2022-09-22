local actions = require "telescope.actions"
local fb_actions = require("telescope").extensions.file_browser.actions

local action_state = require "telescope.actions.state"
local action_mt = require "telescope.actions.mt"

local M = {}

M.yank = function(prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  vim.fn.setreg("*", entry.value)
  actions.close(prompt_bufnr)
end

M = action_mt.transform_mod(M)

local GitMappings = {
  i = {
    ["<C-c>"] = M.yank,
  },
}

return {
  defaults = {
    file_ignore_patterns = { ".git", "node_modules" },
    prompt_prefix = "",
    mappings = {
      n = {
        ["<C-q>"] = actions.send_selected_to_qflist,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
    git_bcommits = {
      mappings = GitMappings,
    },
    git_commits = {
      mappings = GitMappings,
    },
    git_branches = {
      mappings = GitMappings,
    },
  },
  extensions = {
    "live_grep_args",
    "vim_bookmarks",
    "project",
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hidden = true,
      hijack_netrw = true,
      grouped = true,
      select_buffer = true,
      sorting_strategy = "ascending",
      initial_mode = "normal",
      default_selection_index = 2,
      mappings = {
        ["i"] = {
          ["<C-h>"] = fb_actions.goto_parent_dir,
          ["<C-l>"] = actions.select_default,
        },
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          -- your custom normal mode mappings
        },
      },
    },
  },
}
