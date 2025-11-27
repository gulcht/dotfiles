return {

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                bacon_ls = {
                    enabled = diagnostics == "bacon-ls",
                },
                rust_analyzer = { enabled = false },
            },
        },
    },

    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        ft = "rust",
        config = function()
            local mason_root    = vim.fn.stdpath("data") .. "/mason"
            local ext_root      = mason_root .. "/packages/codelldb/extension/"
            local codelldb_path = ext_root .. "adapter/codelldb"
            local liblldb_path  = ext_root .. "lldb/lib/liblldb.dylib"

            local cfg           = require("rustaceanvim.config")
            vim.g.rustaceanvim  = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                },
            }
        end
    },

    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
}
