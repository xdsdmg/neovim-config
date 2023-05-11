require("lspsaga").setup({
  symbol_in_winbar = {
    enable = true,
    separator = " ❯ ",
    ignore_patterns = {},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  preview = {
    lines_above = 0,
    lines_below = 10,
  },

  scroll_preview = {
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },

  request_timeout = 2000,

  ui = {
    -- This option only works in Neovim 0.9
    title = false,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "❯",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  }
})
