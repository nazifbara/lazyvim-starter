return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svelte = {
          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = false },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
            },
          },
        },
        vtsls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayVariableTypeHints = false, -- the ": number" after `const x = 5` — the redundant one
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayParameterNameHints = "all", -- keep this one — genuinely useful, shows arg names at call sites
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              },
            },
          },
        },
      },
    },
  },
}
