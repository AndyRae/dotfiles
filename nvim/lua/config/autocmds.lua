-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Restore cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Restore last cursor position",
  group = vim.api.nvim_create_augroup("restore-cursor", { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Close certain filetypes with just "q"
vim.api.nvim_create_autocmd("FileType", {
  desc = "Close with q",
  group = vim.api.nvim_create_augroup("close-with-q", { clear = true }),
  pattern = { "help", "qf", "lspinfo", "man", "notify", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Auto-quit if Neo-tree is the last window left
vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Quit if Neo-tree is the only window left",
  group = vim.api.nvim_create_augroup("neotree-last-window", { clear = true }),
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "neo-tree" then
      -- :quit on the last window behaves like :qall (checks every buffer,
      -- not just this one) and errors (E37) if any hidden buffer is
      -- unsaved. pcall so that just leaves neo-tree open instead of
      -- throwing a stack trace.
      pcall(vim.cmd, "quit")
    end
  end,
})
