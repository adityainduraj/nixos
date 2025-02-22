-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
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
