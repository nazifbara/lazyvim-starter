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
    opts = function()
      -- nvim-lint lints the lone file when `go env GOMOD` finds no go.mod in
      -- nvim's cwd, as in a go.work repo with no root module, so the rest of
      -- the package goes missing. Always lint the buffer's package directory.
      local args = require("lint").linters.golangcilint.args
      args[#args] = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
      end
    end,
  },
}
