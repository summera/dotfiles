return {
  {
    "windwp/nvim-autopairs",
    event = "User AstroFile",
    opts = {
      check_ts = true,
      ts_config = { java = false },
    },
    config = require "plugins.configs.nvim-autopairs",
  },
}
