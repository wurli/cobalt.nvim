local theme = require("cobalt.colors").setup().theme

local cobalt = {}

cobalt.normal = {
    a = { bg = theme.ui.fg_dim, fg = theme.ui.fg_reverse },
    b = { bg = theme.ui.bg_m1, fg = theme.ui.fg_dim },
    c = { bg = theme.ui.bg_m1, fg = theme.ui.fg },
}

cobalt.visual = {
    a = { bg = theme.ui.special, fg = theme.ui.fg_reverse },
    b = { bg = theme.ui.bg_m1, fg = theme.ui.special, },
}

cobalt.insert = {
    a = { bg = theme.vcs.added, fg = theme.ui.fg_reverse },
    b = { bg = theme.ui.bg_m1, fg = theme.vcs.added },
}

cobalt.command = {
    a = { bg = theme.syn.number, fg = theme.ui.fg_reverse },
    b = { bg = theme.ui.bg_m1, fg = theme.syn.number, },
}

cobalt.replace = {
    a = { bg = theme.syn.constant, fg = theme.ui.bg },
    b = { bg = theme.ui.bg_m1, fg = theme.syn.constant },
}

cobalt.inactive = {
    a = { bg = theme.ui.bg_m3, fg = theme.ui.nontext },
    b = { bg = theme.ui.bg_m3, fg = theme.ui.nontext },
    c = { bg = theme.ui.bg_m3, fg = theme.ui.nontext },
}

if vim.g.cobalt_lualine_bold then
    for _, mode in pairs(cobalt) do
        mode.a.gui = "bold"
    end
end

return cobalt
