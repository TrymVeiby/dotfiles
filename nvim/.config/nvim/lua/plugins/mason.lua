-- Customize Mason plugins

-- Installed
--     ✓ astro-language-server astro
--     ✓ csharp-language-server csharp_ls
--     ✓ csharpier
--     ✓ css-lsp cssls
--     ✓ css-variables-language-server css_variables
--     ✓ debugpy
--     ✓ lua-language-server lua_ls
--     ✓ omnisharp
--     ✓ prettier
--     ✓ python-lsp-server pylsp
--     ✓ ruff
--     ✓ stylua
--     ✓ tailwindcss-language-server tailwindcss
--     ✓ typescript-language-server ts_ls
--     ✓ vue-language-server volar

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "lua_ls",
        "astro",
        "cssls",
        "css_variables",
        "lua_ls",
        "omnisharp",
        "pylsp",
        "tailwindcss",
        "ts_ls",
        "yamlls",
        -- "volar",
      },
    },
  },

  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        "stylua",
        "ruff",
        "prettier",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "python",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
