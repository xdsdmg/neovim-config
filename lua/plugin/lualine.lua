return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = 'ayu_dark',
      icons_enabled = true,
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      disabled_filetypes = {},
    },
    tabline = {
      lualine_a = { { 'buffers', mode = 4 } },
      lualine_b = {},
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 3
        }
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
    sections = {
      lualine_c = { { 'filename' } }
    }
  }
}
