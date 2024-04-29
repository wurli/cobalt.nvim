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
                fg         = palette.SnowWhite,
                fg_dim     = palette.AshenGrey,
                fg_reverse = palette.PolarWhite,

                bg_dim     = palette.DeepAzure, -- ?
                bg_gutter  = palette.MidnightNavy,

                bg_m3      = palette.DeepAzure,      -- Status line, etc
                bg_m2      = palette.DarkLavender,   -- Status line, etc
                bg_m1      = palette.TangerineBurst, -- Status line, etc
                bg         = palette.MarineBlue,     -- Normal background
                bg_p1      = palette.PolarWhite,     -- col indicator line
                bg_p2      = palette.DeepAzure,      -- col indicator line

                special    = palette.DeepAzure,
                nontext    = palette.PolarWhite, -- Line numbers
                whitespace = palette.DeepAzure,

                bg_search  = palette.DeepAzure,
                bg_visual  = palette.RustyBrown,

                pmenu      = {
                    fg       = palette.SnowWhite,
                    fg_sel   = "none", -- This is important to make highlights pass-through
                    bg       = palette.MidnightNavy,
                    bg_sel   = palette.DeepAzure,
                    bg_sbar  = palette.MarineBlue,
                    bg_thumb = palette.MarineBlue,
                },
                float      = {
                    fg        = palette.SnowWhite,
                    bg        = palette.MarineBlue,
                    fg_border = palette.SnowWhite,
                    bg_border = palette.MarineBlue,
                },
            },
            syn = {
                string     = palette.MintyFresh,
                variable   = "none",
                number     = palette.BlushPink,
                constant   = palette.BlushPink,
                identifier = palette.SnowWhite,   -- E.g. class fields
                parameter  = palette.SnowWhite,   -- E.g. function args
                fun        = palette.SnowWhite,   -- Normal function calls
                statement  = palette.LemonZest,
                keyword    = palette.AmberBlaze,  -- Keywords (if, function, while)
                operator   = palette.PaleBlue,
                preproc    = palette.AshenGrey,
                type       = palette.AquaBreeze,
                regex      = palette.PaleGreen,
                deprecated = palette.PearlWhite,
                comment    = palette.SereneSky,
                punct      = palette.PaleBlue,
                special1   = palette.AshenGrey,      -- E.g. assert(), require(), table., ---@param
                special2   = palette.MossGreen,      -- ??
                special3   = palette.PeachSherbet,   -- E.g. some markdown like ``` Lua
            },
            vcs = {
                added   = palette.AshenGrey,
                removed = palette.AshenGrey,
                changed = palette.AshenGrey,
            },
            diff = {
                add    = palette.AshenGrey,
                delete = palette.AshenGrey,
                change = palette.AshenGrey,
                text   = palette.AshenGrey,
            },
            diag = {
                ok      = palette.AshenGrey,
                error   = palette.AshenGrey,
                warning = palette.AshenGrey,
                info    = palette.AshenGrey,
                hint    = palette.AshenGrey,
            },
            term = {
                palette.Silver1,
                palette.DeepOrange,
                palette.BrightYellow,
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
