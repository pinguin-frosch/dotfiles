local M = {}

local lsp_icons = {
    Text = '󰉿',
    Method = '󰊕',
    Function = '󰊕',
    Constructor = '󰒓',
    Field = '󰜢',
    Variable = '󰆦',
    Property = '󰖷',
    Class = '󱡠',
    Interface = '󱡠',
    Struct = '󱡠',
    Module = '󰅩',
    Unit = '󰪚',
    Value = '󰦨',
    Enum = '󰦨',
    EnumMember = '󰦨',
    Keyword = '󰻾',
    Constant = '󰏿',
    Snippet = '󱄽',
    Color = '󰏘',
    File = '󰈔',
    Reference = '󰬲',
    Folder = '󰉋',
    Event = '󱐋',
    Operator = '󰪚',
    TypeParameter = '󰬛',
}

function M.get_lsp_icon(kind)
    return lsp_icons[kind]
end

return M
