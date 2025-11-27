return {
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "css-lsp",
                "emmet-ls",
                "html-lsp",
                "lua-language-server",
                "prettier",
                "shfmt",
                "stylua",
                "tailwindcss-language-server",
                "eslint-lsp",
                -- "typescript-language-server",
                "vtsls",
                "codelldb",
            })
        end,
    },
}
