local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then return end
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH
    if herdr == nil or herdr == "" then herdr = "herdr" end
    vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--current" })
  elseif vim.env.TMUX and vim.env.TMUX ~= "" then
    local tmux = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "TmuxNavigate" .. tmux[dir])
  end
end

return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function() vim.g.tmux_navigator_no_mappings = 1 end,
    config = function() end,
  },
  {
    -- Override smart-splits keymaps with herdr-aware navigation
    "mrjones2014/smart-splits.nvim",
    specs = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<C-H>"] = { function() nav("h", "left") end, desc = "Navigate left (herdr)" }
          maps.n["<C-J>"] = { function() nav("j", "down") end, desc = "Navigate down (herdr)" }
          maps.n["<C-K>"] = { function() nav("k", "up") end, desc = "Navigate up (herdr)" }
          maps.n["<C-L>"] = { function() nav("l", "right") end, desc = "Navigate right (herdr)" }
        end,
      },
    },
  },
}
