return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    require("codecompanion").setup({
      adapters = {
        ollama = {
          url = "http://localhost:1234", -- адрес сервера Ollama
          model = "qwen2.5-coder:3b",
        },
      },
      --on_complete = cmp,
      strategies = {
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        agent = { adapter = "ollama" },
      },
    })
  end,
}
