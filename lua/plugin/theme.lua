local setup_theme = function(theme)
  if theme == 'neosolarized' then
    local status, n = pcall(require, "neosolarized")
    if (not status) then return end

    n.setup({
      comment_italics = true,
    })
  elseif theme == 'nordic' then
    require 'nordic'.setup {
      -- Available themes: 'nordic', 'onedark'.
      -- Onedark is WIP.
      theme = 'nordic',
      -- Enable bold keywords.
      bold_keywords = false,
      -- Enable italic comments.
      italic_comments = true,
      -- Enable general editor background transparency.
      transparent_bg = false,
      -- Enable brighter float border.
      bright_border = true,
      -- Nordic specific options.
      -- Set all to false to use original Nord colors.
      -- Adjusts some colors to make the theme a bit nicer (imo).
      nordic = {
        -- Reduce the overall amount of blue in the theme (diverges from base Nord).
        reduced_blue = true,
      },
      -- Onedark specific options.
      -- Set all to false to keep original onedark colors.
      -- Adjusts some colors to make the theme a bit nicer (imo).
      -- WIP.
      onedark = {
        -- Brighten the whites to fit the theme better.
        brighter_whites = true,
      },
      -- Override the styling of any highlight group.
      override = {},
      cursorline = {
        -- Enable bold font in cursorline.
        bold = false,
        -- Avialable styles: 'dark', 'light'.
        theme = 'light',
        -- Hide the cursorline when the window is not focused.
        hide_unfocused = true,
      },
      noice = {
        -- Available styles: `classic`, `flat`.
        style = 'classic',
      },
      telescope = {
        -- Available styles: `classic`, `flat`.
        style = 'flat',
      },
      leap = {
        -- Dims the backdrop when using leap.
        dim_backdrop = false,
      },
    }
  end
end

setup_theme('neosolarized')

local cb = require('colorbuddy.init')
local Color = cb.Color
local colors = cb.colors
local Group = cb.Group
local groups = cb.groups
local styles = cb.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.Warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cWarn:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cHint:dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlineError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlineWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlineInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlineHint", colors.none, colors.none, styles.undercurl, cHint)
