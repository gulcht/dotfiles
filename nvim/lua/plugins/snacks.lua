return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true, -- ค้นหา hidden files ด้วย
            ignored = false, -- หากต้องการหาไฟล์ใน .gitignore ให้เปลี่ยนเป็น true
          },
          explorer = {
            hidden = true, -- แสดง hidden files ใน explorer ด้วย
            ignored = false, -- หากต้องการแสดงไฟล์ใน .gitignore ให้เปลี่ยนเป็น true
          },
        },
      },
    },
  },
}
