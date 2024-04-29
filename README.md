<p align="center">
  <h2 align="center">cobalt.nvim</h2>
</p>

This is a **work in progress** port of the classic blue theme from TextMate. 
There are many great themes for Neovim out there, but I've not yet found
one as easy on the eyes as this.

![](preview.png)

## Features

- Extensive support for `TreeSitter` syntax highlighting, and _many_ popular plugins
- Compilation to lua byte code for super fast startup times

## Installation/usage:

Download with your favorite package manager:

#### lazy.nvim:
```lua
 {
     "wurli/cobalt.nvim"
     config = function()
         vim.cmd[[colorscheme cobalt]]
     end
 }
```

```lua
use "wurli/cobalt.nvim"
vim.cmd[[colorscheme cobalt]]
```

## Requirements

- neovim latest
- truecolor terminal support
- undercurl terminal support (optional)

## Configuration

There is no need to call setup if you are ok with the defaults.

```lua
-- Default options:
require('cobalt').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { classic = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "classic",           -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "classic",        -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme cobalt")
```

**_NOTE 1:_** If you enable compilation, make sure to run `:CobaltCompile` command every time you make changes to your config.

```vim
" 1. Modify your config
" 2. Restart nvim
" 3. Run this command:
:CobaltCompile
```

**_NOTE 2:_** Cobalt adjusts to the value of some options. Make sure that the options `'laststatus'` and `'cmdheight'` are set **_before_** calling `setup`.

## Themes

Cobalt comes in three variants:

- `classic` the default heart-warming theme,
- `dragon` for those late-night sessions
- `lotus` for when you're out in the open.

Themes can be changed in three ways:

- Setting `config.theme` to the desired theme. Note that `vim.o.background` **must** be unset.
- Using the `background` option:
  Any change to the value of `vim.o.background` will select the theme mapped by `config.background`.
  Use `vim.o.background = ""` to unset this option.
- Loading the colorscheme directly with:
  ```lua
  vim.cmd("colorscheme cobalt-classic")
  vim.cmd("colorscheme cobalt-dragon")
  vim.cmd("colorscheme cobalt-lotus")
  ```
  or
  ```lua
  require("cobalt").load("classic")
  ```

## Customization

In cobalt, there are _two_ kinds of colors: `PaletteColors` and `ThemeColors`;
`PaletteColors` are defined directly as RGB Hex strings, and have arbitrary names
that recall their actual color. Conversely, `ThemeColors` are named and grouped _semantically_
on the basis of their actual function.

In short, a `palette` defines all the available colors, while a `theme` maps the `PaletteColors`
to specific `ThemeColors` and the same palette color may be assigned to multiple theme colors.

You can change _both_ theme or palette colors using `config.colors`.
All the palette color names can be found [here](lua/cobalt/colors.lua),
while their usage by each theme can be found [here](lua/cobalt/themes.lua).

```lua
require('cobalt').setup({
    ...,
    colors = {
        palette = {
            -- change all usages of these colors
            sumiInk0 = "#000000",
            fujiWhite = "#FFFFFF",
        },
        theme = {
            -- change specific usages for a certain theme, or for all of them
            classic = {
                ui = {
                    float = {
                        bg = "none",
                    },
                },
            },
            dragon = {
                syn = {
                    parameter = "yellow",
                },
            },
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    ...
})
```

You can also conveniently add/modify `hlgroups` using the `config.overrides` option.
Supported keywords are the same for `:h nvim_set_hl` `{val}` parameter.

```lua
require('cobalt').setup({
    ...,
    overrides = function(colors)
        return {
            -- Assign a static color to strings
            String = { fg = colors.palette.carpYellow, italic = true },
            -- theme colors will update dynamically when you change theme!
            SomePluginHl = { fg = colors.theme.syn.type, bold = true },
        }
    end,
    ...
})
```

### Common customizations

#### Remove _gutter_ background

Remove the background of `LineNr`, `{Sign,Fold}Column` and friends

```lua
colors = {
    theme = {
        all = {
            ui = {
                bg_gutter = "none"
            }
        }
    }
}
```

#### Transparent Floating Windows

This will make floating windows look nicer with default borders.

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
end,
```

If you'd like to keep the floating windows darker, but you're unhappy with how
borders are rendered, consider using characters that are drawn at the edges of
the box:

```lua
{ "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
```

#### Borderless Telescope

Block-like _modern_ Telescope UI

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    }
end,
```

#### Dark completion (popup) menu

More uniform colors for the popup menu.

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
    }
end,
```

## Integration

### Get palette and theme colors

```lua
-- Get the colors for the current theme
local colors = require("cobalt.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme

-- Get the colors for a specific theme
local classic_colors = require("cobalt.colors").setup({ theme = 'wave' })
```

### Terminal integration

The following example provides a snippet to automatically change the theme
for the Kitty terminal emulator.

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "cobalt",
    callback = function()
        if vim.o.background == "light" then
            vim.fn.system("kitty +kitten themes Cobalt_light")
        elseif vim.o.background == "dark" then
            vim.fn.system("kitty +kitten themes Cobalt_dragon")
        else
            vim.fn.system("kitty +kitten themes Cobalt")
        end
    end,
})
```

<details>
<summary><h2>Color palette</h2></summary>

|                                                         | Name          |    Hex    | Usage                                                                             |
| :-----------------------------------------------------: | :------------ | :-------: | :-------------------------------------------------------------------------------- |
|   <img src="assets/circles/fujiWhite.svg" width="40">   | fujiWhite     | `#DCD7BA` | Default foreground                                                                |
|   <img src="assets/circles/oldWhite.svg" width="40">    | oldWhite      | `#C8C093` | Dark foreground (statuslines)                                                     |
|   <img src="assets/circles/sumiInk0.svg" width="40">    | sumiInk0      | `#16161D` | Dark background (statuslines and floating windows)                                |
|   <img src="assets/circles/sumiInk1.svg" width="40">    | sumiInk1      | `#1F1F28` | Default background                                                                |
|   <img src="assets/circles/sumiInk2.svg" width="40">    | sumiInk2      | `#2A2A37` | Lighter background (colorcolumn, folds)                                           |
|   <img src="assets/circles/sumiInk3.svg" width="40">    | sumiInk3      | `#363646` | Lighter background (cursorline)                                                   |
|   <img src="assets/circles/sumiInk4.svg" width="40">    | sumiInk4      | `#54546D` | Darker foreground (line numbers, fold column, non-text characters), float borders |
|   <img src="assets/circles/waveBlue1.svg" width="40">   | waveBlue1     | `#223249` | Popup background, visual selection background                                     |
|   <img src="assets/circles/waveBlue2.svg" width="40">   | waveBlue2     | `#2D4F67` | Popup selection background, search background                                     |
|  <img src="assets/circles/winterGreen.svg" width="40">  | winterGreen   | `#2B3328` | Diff Add (background)                                                             |
| <img src="assets/circles/winterYellow.svg" width="40">  | winterYellow  | `#49443C` | Diff Change (background)                                                          |
|   <img src="assets/circles/winterRed.svg" width="40">   | winterRed     | `#43242B` | Diff Deleted (background)                                                         |
|  <img src="assets/circles/winterBlue.svg" width="40">   | winterBlue    | `#252535` | Diff Line (background)                                                            |
|  <img src="assets/circles/autumnGreen.svg" width="40">  | autumnGreen   | `#76946A` | Git Add                                                                           |
|   <img src="assets/circles/autumnRed.svg" width="40">   | autumnRed     | `#C34043` | Git Delete                                                                        |
| <img src="assets/circles/autumnYellow.svg" width="40">  | autumnYellow  | `#DCA561` | Git Change                                                                        |
|  <img src="assets/circles/samuraiRed.svg" width="40">   | samuraiRed    | `#E82424` | Diagnostic Error                                                                  |
|  <img src="assets/circles/roninYellow.svg" width="40">  | roninYellow   | `#FF9E3B` | Diagnostic Warning                                                                |
|   <img src="assets/circles/waveAqua1.svg" width="40">   | waveAqua1     | `#6A9589` | Diagnostic Info                                                                   |
|  <img src="assets/circles/dragonBlue.svg" width="40">   | dragonBlue    | `#658594` | Diagnostic Hint                                                                   |
|   <img src="assets/circles/fujiGray.svg" width="40">    | fujiGray      | `#727169` | Comments                                                                          |
| <img src="assets/circles/springViolet1.svg" width="40"> | springViolet1 | `#938AA9` | Light foreground                                                                  |
|   <img src="assets/circles/oniViolet.svg" width="40">   | oniViolet     | `#957FB8` | Statements and Keywords                                                           |
|  <img src="assets/circles/crystalBlue.svg" width="40">  | crystalBlue   | `#7E9CD8` | Functions and Titles                                                              |
| <img src="assets/circles/springViolet2.svg" width="40"> | springViolet2 | `#9CABCA` | Brackets and punctuation                                                          |
|  <img src="assets/circles/springBlue.svg" width="40">   | springBlue    | `#7FB4CA` | Specials and builtin functions                                                    |
|   <img src="assets/circles/lightBlue.svg" width="40">   | lightBlue     | `#A3D4D5` | Not used                                                                          |
|   <img src="assets/circles/waveAqua2.svg" width="40">   | waveAqua2     | `#7AA89F` | Types                                                                             |
|  <img src="assets/circles/springGreen.svg" width="40">  | springGreen   | `#98BB6C` | Strings                                                                           |
|  <img src="assets/circles/boatYellow1.svg" width="40">  | boatYellow1   | `#938056` | Not used                                                                          |
|  <img src="assets/circles/boatYellow2.svg" width="40">  | boatYellow2   | `#C0A36E` | Operators, RegEx                                                                  |
|  <img src="assets/circles/carpYellow.svg" width="40">   | carpYellow    | `#E6C384` | Identifiers                                                                       |
|  <img src="assets/circles/sakuraPink.svg" width="40">   | sakuraPink    | `#D27E99` | Numbers                                                                           |
|    <img src="assets/circles/waveRed.svg" width="40">    | waveRed       | `#E46876` | Standout specials 1 (builtin variables)                                           |
|   <img src="assets/circles/peachRed.svg" width="40">    | peachRed      | `#FF5D62` | Standout specials 2 (exception handling, return)                                  |
| <img src="assets/circles/surimiOrange.svg" width="40">  | surimiOrange  | `#FFA066` | Constants, imports, booleans                                                      |
|  <img src="assets/circles/katanaGray.svg" width="40">   | katanaGray    | `#717C7C` | Deprecated                                                                        |

</details>

## Extras

- [alacritty](extras/alacritty_cobalt.yml)
- [Alfred](extra/alfred.md)
- [base16](extras/base16-theme.yaml)
- [broot](extras/broot_cobalt.toml)
- [emacs, doom emacs](extras/cobalt-theme.el)
- [fish](extras/cobalt.fish)
- [foot](extras/foot_cobalt.ini)
- [iTerm](extras/cobalt.itermcolors)
- [kitty](extras/cobalt.conf)
- [mintty](extras/cobalt.minttyrc)
- [pywal](extras/pywal-theme.json)
- [sway](extras/cobalt.sway)
- [wezterm](extras/wezterm.lua)
- [Windows Terminal](extras/windows_terminal.json)
- [Xresources](extras/.Xresources)
- [tmTheme (bat, delta and lazygit)](extras/cobalt.tmTheme)
- [JSON compatible with many terminals](extras/Cobalt.json) Check [Gogh](https://github.com/Gogh-Co/Gogh#-terminals) for the list of supported terminals.

## Acknowledgements

The implementation of this plugin is based on the [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
theme by [Tommaso Laurenzi](https://github.com/rebelot).

- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Tokyonight](https://github.com/folke/tokyonight.nvim)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Affinity Designer](https://affinity.serif.com/designer/)

