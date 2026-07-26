return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal", mode = { "n", "t" } },
    { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle floating terminal" },
  },
  opts = {
    open_mapping = [[<C-\>]],
    direction = "horizontal",
    size = 15,
    shade_terminals = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)
    -- Easier navigation out of the terminal
    local function set_terminal_keymaps()
      local o = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], o)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
    end
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*toggleterm#*",
      callback = set_terminal_keymaps,
    })
  end,
}
