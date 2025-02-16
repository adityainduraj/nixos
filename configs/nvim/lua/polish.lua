-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
    extension = {
        foo = "fooscript",
    },
    filename = {
        ["Foofile"] = "fooscript",
    },
    pattern = {
        ["~/%.config/foo/.*"] = "fooscript",
    },
}
-- Solve deletion overwriting clipboard issue, this uses Blackhole registers.
vim.keymap.set({ 'n', 'v' }, 'd', '"_d') -- Normal/Visual mode deletion
vim.keymap.set('n', 'x', '"_x')          -- Single-character deletion

-- vim.g.python3_host_prog = '~/.venvs/neovim/bin/python'
