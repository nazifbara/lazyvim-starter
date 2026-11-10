-- Make Ghostty and tuios follow the Neovim colorscheme. Each reads a theme
-- file Neovim writes: Ghostty includes ~/.config/ghostty/nvim-theme, tuios
-- reads config.d/theme.toml. Both files are gitignored in the dotfiles repo.
local M = {}

local is_mac = vim.uv.os_uname().sysname == "Darwin"
local ghostty_file = vim.fn.expand("~/.config/ghostty/nvim-theme")
local tuios_dir = is_mac and vim.fn.expand("~/Library/Application Support/tuios")
  or (vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")) .. "/tuios"

-- colorscheme -> { ghostty theme, tuios theme }. tuios has a single, dark
-- kanagawa, so the kanagawa variants all map to it. The kanso tuios themes are
-- imported from kanso.nvim's Ghostty files into tuios/themes.
local function themes(name)
  local light = vim.o.background == "light"
  local map = {
    ["kanagawa"] = { "dark:Kanagawa Wave,light:Kanagawa Lotus", "kanagawa" },
    ["kanagawa-wave"] = { "Kanagawa Wave", "kanagawa" },
    ["kanagawa-dragon"] = { "Kanagawa Dragon", "kanagawa" },
    ["kanagawa-lotus"] = { "Kanagawa Lotus", "kanagawa" },
    ["kanso"] = { "dark:Kanso Ink,light:Kanso Pearl", light and "kanso_pearl" or "kanso_ink" },
    ["kanso-ink"] = { "Kanso Ink", "kanso_ink" },
    ["kanso-zen"] = { "Kanso Zen", "kanso_zen" },
    ["kanso-mist"] = { "Kanso Mist", "kanso_mist" },
    ["kanso-pearl"] = { "Kanso Pearl", "kanso_pearl" },
  }
  local t = map[name]
  if t then
    return t[1], t[2]
  end
end

-- returns true when the file's content changed
local function write(path, lines)
  local ok, old = pcall(vim.fn.readfile, path)
  if ok and vim.deep_equal(old, lines) then
    return false
  end
  vim.fn.mkdir(vim.fs.dirname(path), "p")
  vim.fn.writefile(lines, path)
  return true
end

local function reload_ghostty()
  if not is_mac then
    return
  end
  vim.system({
    "osascript",
    "-e",
    'if application "Ghostty" is running then tell application "Ghostty" to try\n'
      .. 'perform action "reload_config" on (focused terminal of selected tab of front window)\n'
      .. "end try",
  })
end

function M.sync(name)
  local ghostty, tuios = themes(name)
  if not ghostty then
    return
  end

  if vim.uv.fs_stat(vim.fs.dirname(ghostty_file)) then
    if write(ghostty_file, { "theme = " .. ghostty }) then
      reload_ghostty()
    end
  end

  -- tuios watches its config files and applies the change itself
  if vim.uv.fs_stat(tuios_dir) then
    write(tuios_dir .. "/config.d/theme.toml", {
      "# written by Neovim when the colorscheme changes (gitignored)",
      "[appearance]",
      ('theme = "%s"'):format(tuios),
    })
  end
end

return M
