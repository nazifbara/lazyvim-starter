return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,

    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},

        transparent = false,
        dimInactive = true,
        terminalColors = true,

        colors = {
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = { bg_gutter = "none" },
            },
          },
        },

        overrides = function(colors)
          local theme = colors.theme
          return {
            -- transparent floats with default borders
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            FloatTitle = { bg = "none" },

            -- dark background and dimmed foreground, for windows you still want darker
            -- e.g. autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- explorer tree lines keep the shaded gutter strip
            SnacksPickerTree = { fg = theme.ui.nontext, bg = theme.ui.bg_p1 },

            -- Lazy and Mason: same transparent float style as everything else
            LazyNormal = { link = "NormalFloat" },
            MasonNormal = { link = "NormalFloat" },

            -- completion menu: transparent like the floats, same border
            Pmenu = { fg = theme.ui.shade0, bg = "none" },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = "none" },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            BlinkCmpMenuBorder = { link = "FloatBorder" },
            BlinkCmpDocBorder = { link = "FloatBorder" },
            BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
          }
        end,

        theme = "wave",

        background = {
          dark = "wave",
          light = "lotus",
        },
      })
    end,
  },
}
