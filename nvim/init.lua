require("config.options")
require("config.keymaps")

-- The plugins (nvim-treesitter main branch, native vim.lsp.config) need
-- Neovim 0.12+. On an older Neovim, skip them with one clear message
-- instead of a wall of errors.
if vim.fn.has("nvim-0.12") == 0 then
  local v = vim.version()
  vim.api.nvim_echo({
    { ("This config needs Neovim 0.12+ (found %d.%d). Plugins are disabled."):format(v.major, v.minor), "WarningMsg" },
  }, true, {})
  return
end

require("config.autocmds")
require("config.lazy")
