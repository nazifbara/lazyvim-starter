return {
  {
    "nvim-mini/mini.icons",
    opts = {
      style = "glyph",
      extension = {
        odin = { glyph = "󰟢", hl = "MiniIconsBlue" },
      },
      file = {
        [".env"] = { glyph = "", hl = "MiniIconsYellow" },
        [".env.local"] = { glyph = "", hl = "MiniIconsYellow" },
        [".prettierrc"] = { glyph = "", hl = "MiniIconsPurple" },
        [".eslintrc.js"] = { glyph = "󰱺", hl = "MiniIconsYellow" },
        ["go.mod"] = { glyph = "", hl = "MiniIconsAzure" },
        ["go.sum"] = { glyph = "", hl = "MiniIconsCyan" },
        ["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["package.json"] = { glyph = "", hl = "MiniIconsGreen" },
        ["svelte.config.js"] = { glyph = "", hl = "MiniIconsOrange" },
      },
    },
  },
}
