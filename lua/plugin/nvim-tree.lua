return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "❯",
            arrow_open = "",
          },
        },
      },
    }
  }
}
