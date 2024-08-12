return {
  'ful1e5/onedark.nvim',
  'ellisonleao/gruvbox.nvim',
  'folke/tokyonight.nvim',
  'AlexvZyl/nordic.nvim',
  {
    "APZelos/blamer.nvim",
    init = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_delay = 500
    end
  }
}
