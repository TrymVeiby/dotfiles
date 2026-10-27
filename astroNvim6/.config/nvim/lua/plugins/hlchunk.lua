return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function() require "configs.hlchunk" end,
  },
  {
    "folke/snacks.nvim",
    opts = { indent = { enabled = false } },
  },
}
