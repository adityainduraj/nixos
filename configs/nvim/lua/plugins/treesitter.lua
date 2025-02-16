-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "lua",
            "vim",
            "nix",
            "typescript",
            "javascript",
            "tsx",
            "json",
            "yaml",
            "markdown",
            "markdown_inline",
            -- add more arguments for adding more treesitter parsers
        },
    },
}
