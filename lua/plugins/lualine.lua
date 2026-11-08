return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- no clock; tuios already shows the time
      opts.sections.lualine_z = {}
    end,
  },
}
