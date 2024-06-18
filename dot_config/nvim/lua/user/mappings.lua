return {
  n = {
    [";"] = { ":", desc = "Ex mode" },
    ["<leader>fw"] = {
      function()
        require("fzf-lua").grep_project()
      end,
      desc="Find words"
    },
    ["<leader>fW"] = {
      function()
        require("fzf-lua").grep_project({
          rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
        })
      end,
      desc = "Find words in all files",
    }
  },
  v = {
    [";"] = { ":", desc = "Ex mode" }
  },
  i = {
    ["<C-l>"] = { "<Right>", desc = "Arrow right" },
    ["<C-h>"] = { "<Left>", desc = "Arrow left" },
    ["<C-k>"] = { "<Up>", desc = "Arrow up" },
    ["<C-j>"] = { "<Down>", desc = "Arrow down" }
  }
}
