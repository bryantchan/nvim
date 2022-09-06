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
            hidden = true,
            hijack_netrw = true,
	        grouped = true,
	        sorting_strategy = 'ascending',
	        initial_mode = 'normal',
            mappings = {
                ["i"] = {
                    ["<C-h>"] = fb_actions.goto_parent_dir,
                    ["<C-l>"] = actions.select_default,
                },
                ["n"] = {
                    ["h"] = fb_actions.goto_parent_dir,
                    ["l"] = actions.select_default,
                    -- your custom normal mode mappings
                }
            }

        }
    }
}
