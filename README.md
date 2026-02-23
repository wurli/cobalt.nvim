<p align="center">
  <h2 align="center">cobalt.nvim</h2>
</p>

A (mostly) faithful port of the classic blue theme from TextMate. There are
many great themes for Neovim out there, but I've not yet found one as easy on
the eyes as this.

![cobalt.nvim in action](https://github.com/user-attachments/assets/3422936f-1849-47c5-8136-16f76546f3c0)

## Features

- Extensive support for `TreeSitter` syntax highlighting, and _many_ popular plugins
- Compilation to lua byte code for super fast startup times

## Installation/usage:

Install with your favorite package manager:

### lazy.nvim:
``` lua
{
    "wurli/cobalt.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
}
```

### Usage
``` lua
vim.cmd[[colorscheme cobalt]]
```

## Configuration

Options can be passed via the `opts` table (lazy.nvim) or by calling `require("cobalt").setup(opts)`:

``` lua
require("cobalt").setup({
    -- Use undercurl for spell/diagnostic underlines instead of a straight underline
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    -- Make the editor background transparent, allowing your terminal/compositor
    -- background to show through
    transparent = false,
    -- Dim non-focused windows
    dimInactive = false,
    -- Set terminal colors (used by plugins like toggleterm)
    terminalColors = true,
    -- Override specific highlight groups. Receives the resolved colors table.
    overrides = function(colors)
        return {}
    end,
    -- Compile highlights to lua byte code for faster startup
    compile = false,
})
```

## Testimonials
> Just wanted to say thanks - it's become my default dark theme that remains amazingly easy to read even
> in bright spaces. I wish the iterm2 cobalt2 theme was closer to your version!

\- [@kylesnowschwartz](https://github.com/kylesnowschwartz)

> This is a great theme. Very difficult to find a good, high contrast theme
> that works day and night.

\- [@lebenna](https://github.com/kylesnowschwartz)

## Acknowledgements

The implementation of this plugin is based on
[kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) by [Tommaso
Laurenzi](https://github.com/rebelot).

## See also

*   [lalitmee/cobalt2.nvim](https://github.com/lalitmee/cobalt2.nvim)
*   [visimatch.nvim](https://github.com/wurli/visimatch.nvim)
*   [split.nvim](https://github.com/wurli/split.nvim)

