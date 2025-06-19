return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    -- event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs", -- Sets main module to use for opts
    opts = {
        highlight = {
            enable = true,
            -- additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true },
        auto_install = true,
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "php",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<c-s>",
                node_incremental = "<c-s>",
                scope_incremental = "<c-x>",
                node_decremental = "<M-s>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
            },
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[a"] = "@parameter.inner",
                },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
            },
        },
    },

    { "nvim-treesitter/nvim-treesitter-context", opts = {} },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
}
