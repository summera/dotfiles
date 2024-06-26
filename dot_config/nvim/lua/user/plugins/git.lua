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
          vim.cmd("GoldenRatioDisable")
        end,
        view_leave = function(_)
          vim.cmd("GoldenRatioEnable")
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
