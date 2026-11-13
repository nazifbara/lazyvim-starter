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
      -- nvim-lint runs `go env GOMOD` once, in nvim's cwd, to pick between
      -- linting the package directory and the lone file. In a go.work repo
      -- with no root module it finds no go.mod and lints the lone file, so
      -- the rest of the package goes missing. Ask from the buffer's own
      -- directory instead, on every lint: lone files outside a module still
      -- get linted on their own.
      local args = require("lint").linters.golangcilint.args
      args[#args] = function()
        local file = vim.api.nvim_buf_get_name(0)
        local dir = vim.fn.fnamemodify(file, ":h")
        local gomod = vim.trim(vim.system({ "go", "env", "GOMOD" }, { cwd = dir }):wait().stdout or "")
        local in_module = gomod ~= "" and gomod ~= "/dev/null"
        return in_module and dir or vim.fn.fnamemodify(file, ":p")
      end
    end,
  },
}
