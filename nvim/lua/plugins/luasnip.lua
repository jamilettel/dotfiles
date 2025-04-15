return {
  "L3MON4D3/LuaSnip",
  event = "LspAttach",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "v2.*",
  build = "make install_jsregexp",
  init = function()
    local ls = require("luasnip")
    -- require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets", "~/.config/nvim/snippets" } })

    ls.config.set_config({
      enable_autosnippets = true,
    })

    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })
  end,
}
