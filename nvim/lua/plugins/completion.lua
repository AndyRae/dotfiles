return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      preset = "enter", -- <CR> accept, <C-Space> open, <C-e> close, <C-n>/<C-p> select
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-d>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      -- First item is highlighted, but nothing is inserted until accepted
      list = { selection = { preselect = true, auto_insert = false } },
      documentation = { auto_show = true },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- Pure Lua matcher: no prebuilt binary to download on install
    fuzzy = { implementation = "lua" },
  },
}
