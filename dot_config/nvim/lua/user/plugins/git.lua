return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewFileHistory",
      "DiffviewOpen",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh"
    },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed"
        }
      },
      hooks = {
        view_enter = function(_)
          vim.api.nvim_set_var("golden_size_off", 1)
        end,
        view_leave = function(_)
          vim.api.nvim_set_var("golden_size_off", 0)
        end
      }
    }
  },
  {
    "linrongbin16/gitlinker.nvim",
    cmd = {
      "GitLink"
    },
    opts = {}
  },
  {
    "rhysd/git-messenger.vim",
    cmd = {
      "GitMessenger"
    }
  }
}
