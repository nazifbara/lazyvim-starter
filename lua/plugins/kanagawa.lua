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

            -- plugins whose floats link to NormalFloat; keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            -- darker completion menu
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
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
