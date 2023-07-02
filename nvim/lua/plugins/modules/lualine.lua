return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "onedark",
                icons_enabled = true,
                section_separators = "",
                component_separators = "",
                disabled_filetypes = {
                    statusline = {
                        -- "help",
                        -- "startify",
                        -- "dashboard",
                        -- "neo-tree",
                        -- "packer",
                        -- "neogitstatus",
                        "Trouble",
                        -- "lir",
                        -- "Outline",
                        -- "spectre_panel",
                        -- "toggleterm",
                        -- "qf",
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "filetype",
                        icon_only = true,
                        separator = " ",
                        padding = {
                            left = 1,
                            right = 0,
                        },
                    },
                    {
                        "filename",
                        path = 1,
                        symbols = { modified = "[+]", readonly = "[RO]", unnamed = "" },
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = { error = " ", warn = " ", info = " " },
                    },
                },
                lualine_x = {
                    "diff",
                    "encoding",
                    "fileformat",
                    "location",
                },
                lualine_y = { "progress" },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "neo-tree", "lazy" },
        })
    end,
}
