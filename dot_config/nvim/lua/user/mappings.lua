return {
  n = {
    [";"] = { ":", desc = "Ex mode" },
    ["<leader>fw"] = {
      function()
        require("telescope.builtin").grep_string {
          additional_args = function(args) 
            return vim.list_extend(args, { "--fixed-strings" }) 
          end,
        }
      end,
      desc="Find words"
    },
    ["<leader>fW"] = {
      function()
        require("telescope.builtin").grep_string {
          additional_args = function(args) 
            return vim.list_extend(args, { "--hidden", "--no-ignore", "--fixed-strings" }) 
          end,
        }
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
