-- Make Ghostty, tuios and Claude Code follow the Neovim colorscheme. Each reads
-- a theme file Neovim writes: Ghostty includes ~/.config/ghostty/nvim-theme,
-- tuios reads config.d/theme.toml, and Claude Code uses
-- ~/.claude/themes/terminal.json ("theme": "custom:terminal" in its settings).
local M = {}

local is_mac = vim.uv.os_uname().sysname == "Darwin"
local ghostty_file = vim.fn.expand("~/.config/ghostty/nvim-theme")
local tuios_dir = is_mac and vim.fn.expand("~/Library/Application Support/tuios")
  or (vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")) .. "/tuios"
local claude_file = vim.fn.expand("~/.claude/themes/terminal.json")
-- the Claude Code themes live next to this config in the dotfiles repo
local claude_themes = vim.fs.dirname(vim.fn.resolve(vim.fn.stdpath("config"))) .. "/claude/themes"

-- colorscheme -> { ghostty theme, tuios theme, claude code theme }. tuios has a single, dark
-- kanagawa, so the kanagawa variants all map to it. everforest_light is
-- imported from Ghostty's Everforest Light Med into tuios/themes.
-- Claude Code has themes for wave and everforest light only; dragon uses
-- wave's, and the other colorschemes leave it as it is.
--
-- kanagawa-dragon and everforest are the pair auto-dark-mode switches between,
-- so Ghostty gets both and follows the system on its own, even with no Neovim open.
local function themes(name)
  local system_pair = "dark:Kanagawa Dragon,light:Everforest Light Med"
  local light = vim.o.background == "light"
  local map = {
    ["kanagawa"] = { "dark:Kanagawa Wave,light:Kanagawa Lotus", "kanagawa", not light and "kanagawa-wave" or nil },
    ["kanagawa-wave"] = { "Kanagawa Wave", "kanagawa", "kanagawa-wave" },
    ["everforest"] = {
      system_pair,
      light and "everforest_light" or "kanagawa",
      light and "everforest-light" or "kanagawa-wave",
    },
    ["kanagawa-dragon"] = { system_pair, "kanagawa", "kanagawa-wave" },
    ["kanagawa-lotus"] = { "Kanagawa Lotus", "kanagawa" },
  }
  local t = map[name]
  if t then
    return t[1], t[2], t[3]
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
  local ghostty, tuios, claude = themes(name)
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

  -- Claude Code watches its themes folder and applies the change itself
  local ok, theme = pcall(vim.fn.readfile, ("%s/%s.json"):format(claude_themes, claude))
  if claude and ok and vim.uv.fs_stat(vim.fn.expand("~/.claude")) then
    write(claude_file, theme)
  end
end

return M
