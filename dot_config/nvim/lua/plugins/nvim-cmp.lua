return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local auto_select = false

      opts.preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None
      opts.completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        -- Tab and other mappings go here, etc.
      })

      -- opts.experimental.ghost_text = false
    end,
  },
}
