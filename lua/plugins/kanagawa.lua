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
            -- borderless floats: solid darker background, border blended in
            NormalFloat = { bg = theme.ui.bg_m3 },
            FloatBorder = { fg = theme.ui.bg_m3, bg = theme.ui.bg_m3 },
            FloatTitle = { bg = theme.ui.bg_m3 },
            LazyNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            MasonNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

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
