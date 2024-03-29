return {
  polish = function()
    local keymap = vim.api.nvim_set_keymap
    -- Changes the paste command in visual mode so
    -- that it doesn't overwrite whatever is in your paste buffer.
    keymap("v", "p", '"_dP', { noremap = true, silent = true })

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
