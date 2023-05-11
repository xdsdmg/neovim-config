require('osc52').setup {
    max_length = 0,     -- Maximum length of selection (0 for no limit)
    silent     = false, -- Disable message on successful copy
    trim       = false, -- Trim surrounding whitespaces before copy
}

vim.keymap.set('n', '<C-c>', require('osc52').copy_operator, { expr = true })
vim.keymap.set('n', '<C-c>c', '<leader>c_', { remap = true })
vim.keymap.set('v', '<C-c>', require('osc52').copy_visual)

function copy()
    if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
        require('osc52').copy_register('+')
    end
end

vim.api.nvim_create_autocmd('TextYankPost', { callback = copy })


local function copy(lines, _)
    require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
    return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end

vim.g.clipboard = {
    name = 'osc52',
    copy = { ['+'] = copy, ['*'] = copy },
    paste = { ['+'] = paste, ['*'] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<C-c>', '"+y')
vim.keymap.set('n', '<C-c>c', '"+yy')
