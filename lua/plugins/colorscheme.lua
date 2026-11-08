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
