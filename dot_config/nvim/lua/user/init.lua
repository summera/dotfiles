return {
  polish = function()
    local keymap = vim.api.nvim_set_keymap
    -- Changes the paste command in visual mode so
    -- that it doesn't overwrite whatever is in your paste buffer.
    keymap("v", "p", '"_dP', { noremap = true, silent = true })

    vim.api.nvim_set_var("golden_size_off", 0)
    local function golden_size_ignore()
      return vim.api.nvim_get_var("golden_size_off")
    end

    local golden_size = require("golden_size")
    golden_size.set_ignore_callbacks({
      { golden_size.ignore_float_windows }, -- default one, ignore float windows
      { golden_size.ignore_by_window_flag }, -- default one, ignore windows with w:ignore_gold_size=1
      { golden_size_ignore }
    })

    -- Prevent moving cursor on window focus
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        -- Wait 100ms before re-enabling to avoid
        -- unwanted cursor repositioning
        vim.fn.timer_start(100, function()
          vim.o.mouse = "a"
        end)
      end
    })
    vim.api.nvim_create_autocmd("FocusLost", {
      callback = function()
        vim.o.mouse = ""
      end
    })
  end,
}
