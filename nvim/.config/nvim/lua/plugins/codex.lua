-- Ensure codex CLI uses the migrated config location even when nvim is
-- launched outside an interactive shell (where .zshrc may not be sourced).
vim.env.CODEX_HOME = vim.env.CODEX_HOME or vim.fn.expand "~/.config/codex"

local function codex_send(text)
  local codex = require "codex"
  local state = require "codex.state"

  codex.open()
  if not state.job then
    vim.notify("Codex is not running", vim.log.levels.WARN)
    return
  end

  vim.fn.chansend(state.job, text .. "\n")
end

local function visual_selection()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local lines = vim.fn.getline(start_pos[2], end_pos[2])

  if #lines == 0 then return "" end

  lines[1] = string.sub(lines[1], start_pos[3], -1)
  lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  return table.concat(lines, "\n")
end

return {
  "johnseth97/codex.nvim",
  lazy = true,
  cmd = { "Codex", "CodexToggle" }, -- Optional: Load only on command execution
  keys = {
    {
      "<leader>al", -- Change this to your preferred keybinding
      function() require("codex").toggle() end,
      desc = "Toggle Codex popup or side-panel",
      mode = { "n" },
    },
    {
      "<leader>ab",
      function()
        local file = vim.fn.expand "%:p"
        if file == "" then
          vim.notify("No file in current buffer", vim.log.levels.WARN)
          return
        end
        local quoted = '"' .. file:gsub('"', '\\"') .. '"'
        codex_send("/mention " .. quoted)
      end,
      desc = "Codex mention current file",
      mode = "n",
    },
    {
      "<leader>av",
      function()
        local selection = visual_selection()
        if selection == "" then
          vim.notify("No visual selection found", vim.log.levels.WARN)
          return
        end
        codex_send("```\n" .. selection .. "\n```")
      end,
      desc = "Send visual selection to Codex",
      mode = "x",
    },
  },
  opts = {
    keymaps = {
      toggle = nil, -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
      quit = "<C-q>", -- Keybind to close the Codex window (default: Ctrl + q)
    }, -- Disable internal default keymap (<leader>cc -> :CodexToggle)
    border = "double", -- Options: 'single', 'double', or 'rounded'
    width = 0.3, -- Width of the floating window (0.0 to 1.0)
    height = 1, -- Height of the floating window (0.0 to 1.0)
    model = nil, -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
    autoinstall = true, -- Automatically install the Codex CLI if not found
    panel = true, -- Open Codex in a side-panel (vertical split) instead of floating window
    use_buffer = false, -- Capture Codex stdout into a normal buffer instead of a terminal buffer
  },
}
