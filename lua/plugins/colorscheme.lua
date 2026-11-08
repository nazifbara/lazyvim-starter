return {
  { "rebelot/kanagawa.nvim" },
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          -- only list kanagawa variants in <leader>uC
          colorschemes = {
            transform = function(item)
              return item.text:match("^kanagawa") ~= nil
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
      colorscheme = "kanagawa",
    },
  },
}
