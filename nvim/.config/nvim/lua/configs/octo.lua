require("octo").setup {
  enable_builtin = true,
  default_remote = { "upstream", "origin" },
  picker = "telescope",
  picker_config = {
    use_emojis = false,
  },
  suppress_missing_scope = {
    projects_v2 = true,
  },
}
