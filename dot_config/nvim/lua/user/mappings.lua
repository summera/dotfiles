return {
  n = {
    [";"] = { ":", desc = "Ex mode" },

    -- Files
    ["<leader>fs"] = {
      function()
        require("fzf-lua").grep_project()
      end,
      desc = "Find words"
    },
    ["<leader>fS"] = {
      function()
        require("fzf-lua").grep_project({
          rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e"
        })
      end,
      desc = "Find words in all files (including hidden)",
    },
    ["<leader>f/"] = { 
      function() 
        require("fzf-lua").grep_curbuf() 
      end, 
      desc = "Find words in current buffer" 
    },
    ["<leader>ff"] = {
      function()
        require("fzf-lua").files()
      end, 
      desc = "Find files"
    },
    ["<leader>fb"] = { 
      function() 
        require("fzf-lua").buffers()
      end, 
      desc = "Find buffers" 
    },
    ["<leader>fk"] = { 
      function() 
        require("fzf-lua").keymaps() 
      end, 
      desc = "Find keymaps" 
    },
    ["<leader>fc"] = {
      function()
        require("fzf-lua").commands()
      end,
      desc = "Find commands"
    },
    ["<leader>fh"] = { 
      function() 
        require("fzf-lua").helptags() 
      end, 
      desc = "Find help" 
    },
    ["<leader>f'"] = { 
      function() 
        require("fzf-lua").marks() 
      end, 
      desc = "Find marks" 
    },

    -- Git
    ["<leader>gb"] = { 
      function() 
        require("fzf-lua").git_branches({ preview = "git log --color {1}" })
      end, 
      desc = "Git branches" 
    },
    ["<leader>gt"] = { 
      function() 
        require("fzf-lua").git_tags() 
      end, 
      desc = "Git tags" 
    },
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
