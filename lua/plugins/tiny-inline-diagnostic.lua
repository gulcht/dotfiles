return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Load the plugin only when needed
    priority = 1000, -- Ensure it loads early enough to override default diagnostics
    config = function()
      -- Setup the plugin with options
      require("tiny-inline-diagnostic").setup({
        preset = "modern", -- "modern", "classic", "minimal", "powerline" etc.
      })
    end,
  },
  -- Disable default virtual_text in LazyVim's LSP config to avoid duplicate messages
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },
}

