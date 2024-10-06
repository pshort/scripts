return {
  "catppuccin/nvim",
  name = "catpuccin",
  config = function()
    require("catppuccin").setup {
      flavour = "mocha",
      transparent_background = true,
    }
  end,
}
