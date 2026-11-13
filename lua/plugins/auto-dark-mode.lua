-- system dark mode uses kanagawa wave, light mode uses everforest. This runs
-- on startup and whenever the system appearance changes, so it wins over the
-- theme saved in colorscheme.lua. Only these switches update Ghostty, tuios
-- and Claude Code; a theme picked with <leader>uC stays in Neovim.
local function set(background, name)
  vim.o.background = background
  vim.cmd.colorscheme(name)
  require("config.terminal_theme").sync(name)
end

return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  priority = 1001,

  opts = {
    update_interval = 1000,

    set_dark_mode = function()
      set("dark", "kanagawa-wave")
    end,

    set_light_mode = function()
      set("light", "everforest")
    end,
  },
}
