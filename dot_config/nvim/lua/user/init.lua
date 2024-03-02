return {
  polish = function()
    -- Disable focus plugin on certain windows to avoid resizing splits
    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })   
    
    local ignore_buftypes = { "nofile", "prompt", "popup" }
    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for BufType",
    })
    
    local ignore_filetypes = { "neo-tree", "DiffviewFiles" }
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for FileType",
    })
  end, 
}
