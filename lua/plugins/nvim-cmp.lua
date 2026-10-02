return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    -- сюда можно добавить другие источники по желанию
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")

    -- Подключаем источник от CodeCompanion
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "codecompanion" }, -- <-- это ключевой источник для CodeCompanion
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          -- Можно добавить иконки для источников
          vim_item.menu = ({
            codecompanion = "[CDC]",
            luasnip = "[SNP]",
            nvim_lsp = "[LSP]",
            buffer = "[BUF]",
            path = "[PATH]",
          })[entry.source.name] or ""
          return vim_item
        end,
      },
    })
  end,
}
