local presets = {}
local util = require('tabby.util')

local C = require "default_theme.colors"
local filename = require('tabby.module.filename')
local text = require('tabby.text')
local tab = require('tabby.tab')

local hl_head = 'TabLine'
local hl_tabline = 'TabLine'
local hl_normal = 'Normal'
local hl_tabline_sel = 'TabLineSel'
local hl_tabline_fill = 'TabLineFill'

local function tab_label(tabid, active)
    local icon = active and '' or ''
    local number = vim.api.nvim_tabpage_get_number(tabid)
    local name = tab.get_name(tabid)
    return string.format(' %s %d: %s ', icon, number, name)
end

local function clear_tab_label(tabid, active)
    local icon = active and '' or ''
    local name = tab.get_raw_name(tabid)
    local number = vim.api.nvim_tabpage_get_number(tabid)
    local wins = tab.all_wins(tabid)
    local labels = {}
    if name == '' then
        labels = {'', icon, number, string.format('[%d]', #wins), ''}
    else
        labels = {'', icon, number, name, string.format('[%d]', #wins), ''}
    end
    return table.concat(labels, ' ')
end

local function win_label(winid, top)
    local icon = top and '' or ''
    return string.format(' %s %s ', icon, filename.unique(winid))
end

presets.active_wins_at_tail = {
    hl = hl_tabline_fill,
    layout = 'active_wins_at_tail',
    head = {{
        '  ',
        hl = hl_head
    }, text.separator('', hl_head, hl_tabline_fill)},
    active_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, true),
                hl = hl_tabline_sel
            }
        end,
        left_sep = text.separator('', hl_tabline_sel, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline_sel, hl_tabline_fill)
    },
    inactive_tab = {
        label = function(tabid)
            return {
                tab_label(tabid),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    top_win = {
        label = function(winid)
            return {
                win_label(winid, true),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    win = {
        label = function(winid)
            return {
                win_label(winid),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    tail = {text.separator('', hl_tabline, hl_tabline_fill), {
        '  ',
        hl = hl_tabline
    }}
}
presets.active_wins_at_end = {
    hl = hl_tabline_fill,
    layout = 'active_wins_at_end',
    head = {{
        '  ',
        hl = hl_head
    }, text.separator('', hl_head, hl_tabline_fill)},
    active_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, true),
                hl = hl_tabline_sel
            }
        end,
        left_sep = text.separator('', hl_tabline_sel, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline_sel, hl_tabline_fill)
    },
    inactive_tab = {
        label = function(tabid)
            return {
                tab_label(tabid),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    top_win = {
        label = function(winid)
            return {
                win_label(winid, true),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    },
    win = {
        label = function(winid)
            return {
                win_label(winid),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    }
}
presets.active_tab_with_wins = {
    hl = hl_tabline_fill,
    layout = 'active_tab_with_wins',
    head = {{
        '  ',
        hl = hl_head
    }, text.separator('', hl_head, hl_tabline_fill)},
    active_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, true),
                hl = hl_tabline_sel
            }
        end,
        left_sep = text.separator('', hl_tabline_sel, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline_sel, hl_tabline_fill)
    },
    inactive_tab = {
        label = function(tabid)
            return {
                tab_label(tabid),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    top_win = {
        label = function(winid)
            return {
                win_label(winid),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    },
    win = {
        label = function(winid)
            return {
                win_label(winid),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    }
}
presets.tab_with_top_win = {
    hl = hl_tabline_fill,
    layout = 'tab_with_top_win',
    head = {{
        '  ',
        hl = hl_head
    }, text.separator('', hl_head, hl_tabline_fill)},
    active_tab = {
        label = function(tabid)
            return {
                clear_tab_label(tabid, true),
                hl = hl_tabline_sel
            }
        end,
        left_sep = text.separator('', hl_tabline_sel, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline_sel, hl_tabline_fill)
    },
    inactive_tab = {
        label = function(tabid)
            return {
                clear_tab_label(tabid),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    },
    active_win = {
        label = function(winid)
            return {
                string.format(' %s ', filename.unique(winid)),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    },
    win = {
        label = function(winid)
            return {
                string.format(' %s ', filename.unique(winid)),
                hl = hl_normal
            }
        end,
        left_sep = text.separator('', hl_normal, hl_tabline_fill),
        right_sep = text.separator('', hl_normal, hl_tabline_fill)
    }
}
presets.tab_only = {
    hl = hl_tabline_fill,
    layout = 'tab_only',
    head = {{
        '  ',
        hl = hl_head
    }, text.separator('', hl_head, hl_tabline_fill)},
    active_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, true),
                hl = hl_tabline_sel
            }
        end,
        left_sep = text.separator('', hl_tabline_sel, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline_sel, hl_tabline_fill)
    },
    inactive_tab = {
        label = function(tabid)
            return {
                tab_label(tabid, false),
                hl = hl_tabline
            }
        end,
        left_sep = text.separator('', hl_tabline, hl_tabline_fill),
        right_sep = text.separator('', hl_tabline, hl_tabline_fill)
    }
}

return presets
