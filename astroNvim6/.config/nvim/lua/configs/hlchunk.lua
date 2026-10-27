require("hlchunk").setup {
  chunk = {
    enable = true,
    use_treesitter = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "╭",
      left_bottom = "╰",
      right_arrow = ">",
    },
    style = { "#00FFFF", "#c21f30" },
    duration = 0,
    delay = 0,
  },
  indent = { enable = false },
}
