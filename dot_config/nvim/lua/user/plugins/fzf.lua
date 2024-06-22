return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { 
    "nvim-tree/nvim-web-devicons" 
  },
  config = function()
    require("fzf-lua").setup({ 
      fzf_colors = true,
      winopts = { 
        width = 0.95, 
        height = 0.95,
        preview = { wrap = "wrap" }
      },
      previewers = {
        builtin = {
          hl_cursorline = "Search"
        }
      }
    })
  end
}
