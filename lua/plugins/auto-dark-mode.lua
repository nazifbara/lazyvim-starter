-- switch 'background' and reapply the theme that was picked, so it moves to its
-- light/dark variant. The name is read first: changing 'background' reloads the
-- theme under its colors_name, which can differ (kanagawa-dragon -> kanagawa).
local function set(background)
  local name = vim.g.picked_colorscheme or vim.g.colors_name or "kanagawa"
  vim.o.background = background
  vim.cmd.colorscheme(name)
end

return {
  "f-person/auto-dark-mode.nvim",
  lazy = false,
  priority = 1001,

  opts = {
    update_interval = 1000,

    set_dark_mode = function()
      set("dark")
    end,

    set_light_mode = function()
      set("light")
    end,
  },
}
