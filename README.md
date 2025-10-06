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

## Acknowledgements

The implementation of this plugin is based on
[kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) by [Tommaso
Laurenzi](https://github.com/rebelot).

## See also

*   [lalitmee/cobalt2.nvim](https://github.com/lalitmee/cobalt2.nvim)
*   [visimatch.nvim](https://github.com/wurli/visimatch.nvim)
*   [split.nvim](https://github.com/wurli/split.nvim)

