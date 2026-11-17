return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false, -- this plugin does not support lazy-loading
  config = function()
    local ensure_installed = {
      "lua", "vim", "vimdoc", "query",
      "bash", "markdown", "markdown_inline",
      "json", "yaml", "toml",
      "html", "css", "javascript", "typescript", "tsx",
      "python", "go", "rust", "c",
    }
    -- Parsers are compiled locally with the tree-sitter CLI. Without it every
    -- parser fails with its own error on each start, so warn once instead.
    if vim.fn.executable("tree-sitter") == 1 then
      require("nvim-treesitter").install(ensure_installed)
    else
      vim.notify("tree-sitter CLI not found, so no parsers were installed (brew install tree-sitter-cli)", vim.log.levels.WARN)
    end

    -- Enable highlighting, folding and indent for any filetype with an
    -- installed (or installable) parser
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match) or args.match
        local ok, added = pcall(vim.treesitter.language.add, lang)
        if not ok or not added then
          return
        end
        vim.treesitter.start(args.buf, lang)
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
