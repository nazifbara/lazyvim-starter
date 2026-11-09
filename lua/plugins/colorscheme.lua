return {
  { "rebelot/kanagawa.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- only list kanagawa and rose pine variants in <leader>uC
          colorschemes = {
            transform = function(item)
              return item.text:match("^kanagawa") ~= nil or item.text:match("^rose%-pine") ~= nil
            end,
          },
          -- explorer uses the editor background (dimmed when unfocused, like
          -- any split) instead of the transparent float style
          explorer = {
            on_show = function(picker)
              local wins = vim.list_extend(vim.tbl_values(picker.layout.wins), vim.tbl_values(picker.layout.box_wins))
              for _, win in ipairs(wins) do
                if win:valid() then
                  vim.wo[win.win].winhighlight = vim.wo[win.win].winhighlight
                    .. ",Normal:Normal,NormalNC:NormalNC,NormalFloat:Normal"
                end
              end
            end,
          },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- start with the last theme picked, saved by the ColorScheme autocmd below
      colorscheme = function()
        local file = vim.fn.stdpath("state") .. "/last-colorscheme"
        -- save the outermost name requested: loading rose-pine-moon changes
        -- 'background', which reloads the theme as plain rose-pine
        local depth, requested = 0, nil
        vim.api.nvim_create_autocmd("ColorSchemePre", {
          callback = function(ev)
            depth = depth + 1
            if depth == 1 then
              requested = ev.match
            end
          end,
        })
        vim.api.nvim_create_autocmd("ColorScheme", {
          callback = function(ev)
            depth = math.max(depth - 1, 0)
            if depth == 0 then
              vim.g.picked_colorscheme = requested or ev.match
              vim.fn.writefile({ vim.g.picked_colorscheme }, file)
            end
          end,
        })

        local ok, lines = pcall(vim.fn.readfile, file)
        local name = ok and lines[1] or nil
        if not (name and pcall(vim.cmd.colorscheme, name)) then
          depth = 0 -- a failed load can leave it raised
          vim.cmd.colorscheme("kanagawa")
        end
      end,
    },
  },
}
