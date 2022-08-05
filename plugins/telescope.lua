local actions = require "telescope.actions"

return {
    defaults = {
        file_ignore_patterns = {".git", "node_modules"},
        prompt_prefix = "",
        mappings = {
            i = {
                ["<C-g>"] = actions.send_selected_to_qflist + actions.open_qflist
            }
        }
    },
    extensions = {'live_grep_args'}
}
