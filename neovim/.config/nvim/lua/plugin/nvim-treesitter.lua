require'nvim-treesitter.configs'.setup {
    highlight = {enable = true},
    ensure_installed = {"python", "latex", "bash", "html", "lua", "yaml", "dockerfile", "json", "r"},
    indent = {enable = true},
    autopairs = {enable = true},
    rainbow = {enable = true},
    autotag = {enable = true},
    context_commentstring = {enable = true},
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["as"] = "@statement.outer",
                ["is"] = "@statement.inner",
            },
        },
    },
}
