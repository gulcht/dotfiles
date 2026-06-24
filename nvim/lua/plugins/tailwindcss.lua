return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = {
            user_default_options = {
                RGB = true,      -- Highlight RGB colors
                RRGGBB = true,   -- Highlight RRGGBB colors
                names = true,    -- Highlight named colors (e.g., "red", "blue")
                tailwind = true, -- Enable Tailwind CSS color highlighting
            },
        },
    }
}
