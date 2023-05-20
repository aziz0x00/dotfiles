return {
    "nvim-lualine/lualine.nvim",
    -- enabled = false,
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local colors = {
            active = {
                bg = "#232728",
                fg = "#D4BE98",
            },
            inactive = {
                bg = "#232728",
                fg = "#4B4F51",
            },
        }
        local theme = {}
        for _, mode in ipairs({ "command", "insert", "normal", "replace", "terminal", "visual" }) do
            theme[mode] = {}
            for _, place in ipairs({ "a", "b", "c" }) do
                theme[mode][place] = colors.active
            end
        end
        theme.inactive = { c = colors.inactive }
        require("lualine").setup({
            options = {
                theme = theme,
                icons_enabled = true,
                section_separators = "",
                component_separators = "",
                disabled_filetypes = {
                    statusline = {
                        "help",
                        "startify",
                        "dashboard",
                        "neo-tree",
                        "packer",
                        "neogitstatus",
                        "Trouble",
                        "lir",
                        "Outline",
                        "spectre_panel",
                        "toggleterm",
                        "qf",
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = { "branch" },
                lualine_c = {
                    -- "filename",
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
                        symbols = { modified = "[+]", readonly = "", unnamed = "" },
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        symbols = { error = " ", warn = " ", info = " " },
                    },
                },
                lualine_x = { "encoding", "fileformat" },
                lualine_y = { "location" },
                lualine_z = { "progress" },
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
