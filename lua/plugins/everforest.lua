-- same tweaks as kanagawa.lua, so floats, the completion menu and the
-- explorer look the same in both themes
return {
  {
    "neanias/everforest-nvim",

    config = function()
      require("everforest").setup({
        background = "medium",
        dim_inactive_windows = true,
        sign_column_background = "none",

        on_highlights = function(hl, palette)
          -- transparent floats with default borders
          hl.NormalFloat = { fg = palette.fg, bg = "none" }
          hl.FloatBorder = { fg = palette.grey1, bg = "none" }
          hl.FloatTitle = { fg = palette.grey1, bg = "none" }

          -- dark background and dimmed foreground, for windows you still want darker
          -- e.g. autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          hl.NormalDark = { fg = palette.grey1, bg = palette.bg_dim }

          -- explorer tree lines keep the shaded gutter strip
          hl.SnacksPickerTree = { fg = palette.bg4, bg = palette.bg1 }

          -- Lazy and Mason: same transparent float style as everything else
          hl.LazyNormal = { link = "NormalFloat" }
          hl.MasonNormal = { link = "NormalFloat" }

          -- completion menu: transparent like the floats, same border
          hl.Pmenu = { fg = palette.fg, bg = "none" }
          hl.PmenuSel = { bg = palette.bg2 }
          hl.PmenuSbar = { bg = "none" }
          hl.PmenuThumb = { bg = palette.bg2 }
          hl.BlinkCmpMenuBorder = { link = "FloatBorder" }
          hl.BlinkCmpDocBorder = { link = "FloatBorder" }
          hl.BlinkCmpSignatureHelpBorder = { link = "FloatBorder" }
        end,
      })
    end,
  },
}
