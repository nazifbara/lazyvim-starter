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
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      -- no golangci-lint while editing: gopls already runs staticcheck and the
      -- vet analyses, incrementally and go.work-aware, while golangci-lint
      -- relints the whole package from scratch and lints the lone file in a
      -- go.work repo with no root module. Run `golangci-lint run ./...` (or
      -- CI) for the rest, like errcheck.
      opts.linters_by_ft.go = {}
    end,
  },
}
