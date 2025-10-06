--TODO:
--PreProc needs its own color
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field directory ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
    ---@param palette PaletteColors
    ---@return ThemeColors
    wave = function(palette)
        return {
            ui = {
                fg           = palette.SnowWhite,
                fg_dim       = palette.AshenGrey,
                fg_reverse   = palette.DarkLavender,

                bg_dim       = palette.NightShade,
                -- bg_gutter    = palette.MidnightNavy,
                bg_gutter    = palette.MarineBlue,

                bg_m1        = palette.DayShade,     -- Nvim tree window picker
                bg_m2        = palette.DayShade,     -- Markdown headings
                bg_m3        = palette.MidnightNavy,   -- Status line of non-current windows

                bg           = palette.MarineBlue,     -- Normal background
                bg_p1        = palette.MidnightNavy,   -- Line length highlight
                bg_p2        = palette.NightShade,     -- Current line highlight

                -- special      = palette.PeachSherbet,
                special      = palette.AmberBlaze,
                nontext      = palette.Steel,      -- Line numbers
                whitespace   = palette.DayShade,

                bg_search    = palette.Copper,
                bg_cursearch = palette.MochaBrown,
                bg_visual    = palette.RustyBrown,

                pmenu = {
                    fg       = palette.SnowWhite,
                    fg_sel   = "none",               -- This is important to make highlights pass-through
                    bg       = palette.DarkLavender,
                    bg_sel   = palette.NightShade,
                    bg_sbar  = palette.MarineBlue,
                    bg_thumb = palette.Steel, -- scrollbar position indicator
                },
                float = {
                    fg        = palette.SnowWhite,
                    bg        = palette.DarkLavender,
                    fg_border = palette.AshenGrey,
                    bg_border = palette.DarkLavender,
                },
            },
            syn = {
                string     = palette.Harlequin,
                variable   = "none",
                number     = palette.BlushPink,   -- E.g. numbers
                constant   = palette.BlushPink,   -- E.g. TRUE, FALSE
                identifier = palette.SnowWhite,   -- E.g. class fields
                parameter  = palette.PastelBlue6,   -- E.g. function args
                -- fun        = palette.PeachSherbet,   -- Normal function calls
                -- fun        = palette.BrightYellow,   -- Normal function calls
                -- fun        = palette.OrchidPink,   -- Normal function calls
                fun        = palette.Custard,   -- Normal function calls
                statement  = palette.PalePink,
                keyword    = palette.AmberBlaze,  -- Keywords (if, function, while)
                operator   = palette.PaleBlue,
                preproc    = palette.AshenGrey,
                type       = palette.AquaBreeze,
                regex      = palette.PaleGreen,
                deprecated = palette.Steel,
                directory  = palette.SnowWhite,
                comment    = palette.SereneSky,
                punct      = palette.PaleBlue,
                special1   = palette.BlushPink,      -- E.g. assert(), require(), table., NULL ---@param
                special2   = palette.OrchidPink,     -- Builtins, e.g. excepection types
                special3   = palette.PeachSherbet,   -- E.g. 'code' formatting in markdown, keywords like `return`
            },
            vcs = {                                  -- gitsigns text and status line
                added   = palette.MossGreen,
                removed = palette.Salmon,
                changed = palette.Steel,
            },
            diff = {                                 -- gitsigns background
                add    = palette.Lawn,
                delete = palette.Burgundy,
                change = palette.NightShade,
                text   = palette.Steel,
            },
            diag = {
                ok      = palette.Steel,
                error   = palette.Steel,
                warning = palette.Steel,
                info    = palette.Steel,
                hint    = palette.Steel,
            },
            term = {
                palette.Silver1,
                palette.Salmon,
                palette.Custard,
                palette.PaleYellow1,
                palette.PastelBlue1,
                palette.PastelBlue2,
                palette.PastelBlue3,
                palette.OffWhite,
                palette.Silver2,
                palette.PalePink,
                palette.PaleOrange,
                palette.PaleYellow2,
                palette.PastelBlue4,
                palette.PastelBlue5,
                palette.PastelBlue6,
                palette.SnowWhite,
                palette.DeepBlack,
                palette.ElectricBlue,
            },
        }
    end,
}
