require("snacks").setup {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  terminal = { enabled = false },
  picker = {
    enabled = true,
    layout = { preset = "narrow_list_wide_preview" },
    layouts = {
      narrow_list_wide_preview = {
        fullscreen = true,
        layout = {
          box = "horizontal",
          {
            box = "vertical",
            border = true,
            title = "{title} {live} {flags}",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none", width = 100 },
          },
          { win = "preview", title = "{preview}", border = true, width = 0.75 },
        },
      },
    },
    win = {
      input = { height = 1 },
    },
  },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}
