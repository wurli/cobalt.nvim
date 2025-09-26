---@class PaletteColors
local palette = {

    -- UI
    DarkLavender  = "#001B32", -- markup.list
    MidnightNavy  = "#011E3A", -- gutter-bg
    MarineBlue    = "#002240", -- bg,box-shadow
    DayShade      = "#204060", -- print-margin
    NightShade    = "#143a5d", -- marker-layer-bg,find-line-bg,console-error-bg
    SnowWhite     = "#FFFFFF", -- text,cursor
    AmberBlaze    = "#FF9D00", -- meta,span
    CoralPink     = "#FF628C", -- other
    PearlWhite    = "#F8F8F8", -- invalid
    BloodRed      = "#800F00", -- invalid-bg
    -- Copper        = "#bd8041", -- support
    Copper        = "#A6723A", -- support


    BlushPink     = "#EB939A", -- support.constant
    PeachSherbet  = "#FFB054", -- support.function
    Lawn          = "#00383c", -- Diff add background
    Burgundy      = "#3E1F32", -- Diff delte background
    RustyBrown    = "#86543a", -- Visual mode highlight
    Steel         = "#8091A0", -- Line numbers

    -- Syntax
    LemonZest     = "#FFEE80", -- storage
    LimeGreen     = "#FFDD00", -- entity
    Harlequin     = "#3AD900", -- string
    PaleGreen     = "#80FFC2", -- regex
    SereneSky     = "#0088FF", -- comment
    DeepOcean     = "#C8E4FD", -- heading
    NightfallBlue = "#001221", -- heading-bg
    AshenGrey     = "#CCCCCC", -- variable
    OrchidPink    = "#FF80E1", -- variable.language
    AquaBreeze    = "#9EFFFF", -- meta.tag
    MochaBrown    = "#FB6F1C", -- node-selector-bg
    SandyBeige    = "#4D4333", -- comment-highlight
    MossGreen     = "#D1B78A", -- comment-highlight-bg
    Olive         = "#80803C", -- marker-layer-bg,active-debug-line-bg
    PaleBlue      = "#BED6FF", -- operator
    CharcoalGrey  = "#C0C0C0", -- terminal
    DarkGrey      = "#1E1E1E", -- terminal


    -- Terminal colors
    Silver1       = "#4F4F4F",
    Salmon    = "#FF6C60",
    BrightYellow  = "#A8FF60",
    PaleYellow1   = "#FFFFB6",
    PastelBlue1   = "#96CBFE",
    PastelBlue2   = "#FF73FD",
    PastelBlue3   = "#C6C5FE",
    OffWhite      = "#EEEEEE",
    Silver2       = "#7C7C7C",
    PalePink      = "#FFB6B0",
    PaleOrange    = "#CEFFAC",
    PaleYellow2   = "#FFFFCC",
    PastelBlue4   = "#B5DCFF",
    PastelBlue5   = "#FF9CFE",
    PastelBlue6   = "#DFDFFE",
    DeepBlack     = "#000000",
    ElectricBlue  = "#00005F",

}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to CobaltConfig.colors.
---   - theme: Use selected theme. Defaults to CobaltConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("cobalt").config.colors
    local theme = opts.theme or require("cobalt")._CURRENT_THEME -- WARN: this fails if called before cobalt.load()

    if not theme then
        error("cobalt.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme cobalt'")
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("cobalt.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {} )
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M
