require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Helix-style line motions
map({ "n", "v" }, "gh", "^", { desc = "Start of line (Helix)" })
map({ "n", "v" }, "gl", "$", { desc = "End of line (Helix)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
