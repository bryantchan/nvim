local actions = require "telescope.actions"
local fb_actions = require"telescope".extensions.file_browser.actions

return {
    defaults = {
        file_ignore_patterns = {".git", "node_modules"},
        prompt_prefix = "",
        mappings = {
            i = {
                ["<C-g>"] = actions.send_selected_to_qflist
            }
        }
    },
    extensions = {
        'live_grep_args',
        'vim_bookmarks',
        file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    ["<backspace>"] = fb_actions.goto_parent_dir
                    -- your custom normal mode mappings
                }
            }

        }
    }
}
