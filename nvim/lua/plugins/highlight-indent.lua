return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({

      chunk = {
        enable = true,
        use_treesitter = true,
      },
      indent = {
        use_treesitter = true,
        enable = true,
      },
    })
  end,
}
