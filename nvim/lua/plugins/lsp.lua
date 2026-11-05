return {
  {
    -- Provides the actual per-server configs (lsp/*.lua) that vim.lsp.config
    -- picks up. The require('lspconfig') API itself is deprecated in favor
    -- of Neovim's native vim.lsp.config()/vim.lsp.enable() (0.11+).
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Diagnostic UI
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        severity_sort = true,
        float = { border = "rounded" },
      })

      -- Keymaps set only when an LSP actually attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            vim.keymap.set(mode or "n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          -- nowait: otherwise gr waits timeoutlen for the built-in grr/grn/gra/gri
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf, nowait = true, desc = "LSP: Goto references" })
          map("gI", vim.lsp.buf.implementation, "Goto implementation")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename symbol")
          -- Signature help is Neovim's built-in <C-s> in insert mode
          -- Formatting is handled by conform.nvim's <leader>cf (falls back to LSP formatting)
        end,
      })

      -- Give every server the completion capabilities blink.cmp adds
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      -- Per-server overrides. Add more as you pick up languages, e.g.:
      --   vim.lsp.config('pyright', {})
      -- then add the server name to ensure_installed below — mason-lspconfig
      -- installs it and enables it automatically. Browse/install manually
      -- any time with :Mason
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
            },
          },
        },
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "basedpyright" },
        automatic_enable = true,
      })
    end,
  },
}
