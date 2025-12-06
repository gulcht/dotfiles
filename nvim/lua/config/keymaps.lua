-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- =============================================================================
-- General & Navigation
-- =============================================================================
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<Leader>a", "ggVG", { desc = "Select all" })

map({ "n", "v" }, "9", "0", { desc = "Go to start of line" })
map({ "n", "v" }, "0", "$", { desc = "Go to end of line" })
-- =============================================================================
-- Move Lines (Alt + j/k OR Alt + Arrow Keys)
-- =============================================================================
-- Move Down
for _, key in ipairs({ "<A-j>", "<A-Down>" }) do
    map("n", key, ":m .+1<CR>==", { silent = true, desc = "Move line down" })
    map("v", key, ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
end

-- Move Up
for _, key in ipairs({ "<A-k>", "<A-Up>" }) do
    map("n", key, ":m .-2<CR>==", { silent = true, desc = "Move line up" })
    map("v", key, ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })
end

-- =============================================================================
-- LSP Navigation
-- =============================================================================
map("n", "<Leader>fd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })

-- =============================================================================
-- Terminal Configuration
-- =============================================================================
pcall(vim.keymap.del, "n", "<C-/>")
pcall(vim.keymap.del, "t", "<C-/>")
pcall(vim.keymap.del, "n", "<C-_>")
pcall(vim.keymap.del, "t", "<C-_>")
-- Toggle Terminal with Ctrl+t
map({ "n", "t" }, "<c-t>", function()
    Snacks.terminal()
end, { desc = "Toggle Terminal" })

-- =============================================================================
-- Comments
-- =============================================================================
map("n", "<c-/>", "gcc", { remap = true, desc = "Toggle comment" })
map("v", "<c-/>", "gc", { remap = true, desc = "Toggle comment" })

-- =============================================================================
-- Debugging (DAP)
-- =============================================================================
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

map("n", "<Leader>dd", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debugger set conditional breakpoint" })

-- =============================================================================
-- Rustaceanvim
-- =============================================================================
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- =============================================================================
-- Autocomplete
-- =============================================================================
map("i", "<C-Space>", function()
    local ok, blink = pcall(require, "blink.cmp")
    if ok then
        blink.show()
    else
        vim.notify("blink.cmp not loaded", vim.log.levels.WARN)
    end
end, { desc = "Trigger autocomplete manually" })

vim.keymap.set("n", "<leader>dh", function()
    vim.diagnostic.disable()
end, { desc = "Hide diagnostics" })

vim.keymap.set("n", "<leader>ds", function()
    vim.diagnostic.enable()
end, { desc = "Show diagnostics" })
