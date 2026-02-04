require("neotest").setup {
  adapters = {
    require "neotest-jest" {
      jestCommand = "npm test --",
      jestArguments = function(defaultArguments, context) return defaultArguments end,
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      cwd = function(path) return vim.fn.getcwd() end,
      isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
    },
  },
}
