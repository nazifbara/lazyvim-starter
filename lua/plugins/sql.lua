return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      -- the dialect comes from ~/.sqlfluff or the project's .sqlfluff, so
      -- don't force LazyVim's --dialect=ansi or require a project config
      opts.formatters.sqlfluff = {
        args = { "format", "-" },
        require_cwd = false,
      }
    end,
  },
}
