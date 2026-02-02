-- Customize Treesitter

---@type LazySpec
return {
  "nvim-teesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "markdown",
      "markdown_inline",
      "typescript",
      "astro",
    },
  },
}
