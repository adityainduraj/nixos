-- if true then return {} end  -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        features = {
            large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
            autopairs = true,                                 -- enable autopairs at start
            cmp = true,                                       -- enable completion at start
            diagnostics_mode = 3,                             -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
            highlighturl = true,                              -- highlight URLs at start
            notifications = true,                             -- enable notifications at start
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
            virtual_text = true,
            underline = true,
        },
        -- vim options can be configured here
        options = {
            opt = {                    -- vim.opt.<key>
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true,         -- sets vim.opt.number
                spell = false,         -- sets vim.opt.spell
                signcolumn = "yes",    -- sets vim.opt.signcolumn to yes
                wrap = false,          -- sets vim.opt.wrap
            },
            g = {                      -- vim.g.<key>
                -- configure global vim variables (vim.g)
                -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
                -- This can be found in the `lua/lazy_setup.lua` file
            },
        },
        -- Mappings can be configured through AstroCore as well.
        -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
        -- Previous configurations remain the same...
        mappings = {
            n = {
                -- Previous mappings remain the same...
                ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
                ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
                ["<Leader>bd"] = {
                    function()
                        require("astroui.status.heirline").buffer_picker(
                            function(bufnr) require("astrocore.buffer").close(bufnr) end
                        )
                    end,
                    desc = "Close buffer from tabline",
                },

                -- LeetCode mappings with <Leader>k prefix
                ["<Leader>k"] = { desc = "LeetCode" },
                ["<Leader>K"] = { "<cmd>Leet<cr>", desc = "Leetcode Dashboard" },
                ["<Leader>kc"] = { "<cmd>Leet console<cr>", desc = "Open Console" },
                ["<Leader>ky"] = { "<cmd>Leet yank<cr>", desc = "Yank Solution" },
                ["<Leader>kt"] = { "<cmd>Leet tabs<cr>", desc = "Show Open Tabs" },
                ["<Leader>kC"] = { "<cmd>Leet cookie<cr>", desc = "Manage Cookies" },
                ["<Leader>kL"] = { "<cmd>Leet list<cr>", desc = "List Questions" },
                ["<Leader>kD"] = { "<cmd>Leet desc<cr>", desc = "Toggle Description" },
                ["<Leader>kR"] = { "<cmd>Leet random<cr>", desc = "Open Random Question" },
                ["<Leader>kS"] = { "<cmd>Leet session<cr>", desc = "Manage Sessions" },
                ["<Leader>ks"] = { "<cmd>Leet submit<cr>", desc = "Submit Code" },
                ["<Leader>ko"] = { "<cmd>Leet open<cr>", desc = "Open in Browser" },
                ["<Leader>ke"] = { "<cmd>Leet exit<cr>", desc = "Exit LeetCode" },
                ["<Leader>kd"] = { "<cmd>Leet daily<cr>", desc = "Open Daily Question" },
                ["<Leader>kr"] = { "<cmd>Leet run<cr>", desc = "Run Code" },
                ["<Leader>ki"] = { "<cmd>Leet info<cr>", desc = "Show Question Info" },
                ["<Leader>km"] = { "<cmd>Leet menu<cr>", desc = "Open LeetCode Menu" },
                ["<Leader>kl"] = { "<cmd>Leet lang<cr>", desc = "Change Language" },
                ["<Leader>kU"] = { "<cmd>Leet cache update<cr>", desc = "Update Cache" },
            },
        },
    },
}
