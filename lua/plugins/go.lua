return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {
                assignVariableTypes = false, -- the "int" after x := 5 — the redundant one
                compositeLiteralTypes = false,
                compositeLiteralFields = false,
                constantValues = false,
                rangeVariableTypes = false,
                functionTypeParameters = false,
                parameterNames = true, -- keep this one — genuinely useful, shows arg names at call sites
              },
            },
          },
        },
      },
    },
  },
}
