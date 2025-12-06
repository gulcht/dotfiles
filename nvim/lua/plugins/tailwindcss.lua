return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        RGB = true, -- Highlight RGB colors
        RRGGBB = true, -- Highlight RRGGBB colors
        tailwind = true, -- Enable Tailwind CSS color highlighting
      },
    },
  },
}
