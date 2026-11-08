return {
  {
    "nvim-mini/mini.icons",
    opts = {
      style = "glyph",
      extension = {
        odin = { glyph = "󰟢", hl = "MiniIconsBlue" },
      },
      -- glyphs as \u{} escapes so they survive copy-paste
      file = {
        [".env"] = { glyph = "\u{f084}", hl = "MiniIconsYellow" },
        [".env.local"] = { glyph = "\u{f084}", hl = "MiniIconsYellow" },
        [".prettierrc"] = { glyph = "\u{e6b4}", hl = "MiniIconsPurple" },
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["go.mod"] = { glyph = "\u{e627}", hl = "MiniIconsAzure" },
        ["go.sum"] = { glyph = "\u{e627}", hl = "MiniIconsCyan" },
        ["tsconfig.json"] = { glyph = "\u{e69d}", hl = "MiniIconsAzure" },
        ["package.json"] = { glyph = "\u{e71e}", hl = "MiniIconsGreen" },
        ["svelte.config.js"] = { glyph = "\u{e697}", hl = "MiniIconsOrange" },
      },
    },
  },
}
