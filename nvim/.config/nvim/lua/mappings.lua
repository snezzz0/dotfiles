require "nvchad.mappings"

local map = vim.keymap.set

local function safe_del(mode, key)
  pcall(vim.keymap.del, mode, key)
end

-----------------------------------------------------------
-- 1. DELETIONS (Cleaning up the remaining menus)
-----------------------------------------------------------
safe_del("n", "<C-n>")
safe_del("n", "<leader>b")
safe_del("n", "<leader>e")
safe_del("n", "<leader>h")
safe_del("n", "<leader>v")
safe_del("n", "<leader>n")
safe_del("n", "<leader>pt")
safe_del("n", "<leader>t")  
safe_del("n", "<leader>th") 
safe_del("n", "<leader>ma") 
safe_del("n", "<leader>m")  

-- Unbundle 'f' and 'g'
safe_del("n", "<leader>fa")
safe_del("n", "<leader>fb")
safe_del("n", "<leader>fh")
safe_del("n", "<leader>fm")
safe_del("n", "<leader>fo")
safe_del("n", "<leader>fz")
safe_del("n", "<leader>gg")

-----------------------------------------------------------
-- 2. YOUR CUSTOM MAPPINGS (Direct Binds)
-----------------------------------------------------------

-- Helix-style line motions
map({ "n", "v" }, "gh", "^", { desc = "Start of line (Helix)", nowait = true })
map({ "n", "v" }, "gl", "$", { desc = "End of line (Helix)", nowait = true })
map("n", "x", "V", { desc = "Select line (Helix style)" })
map("n", "x", "V", { desc = "Select line (Helix)" })
map("v", "x", "j", { desc = "Extend selection (Helix)" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "<C-f>", "<C-f>zz", { desc = "Page forward and center" })
map("n", "<C-b>", "<C-b>zz", { desc = "Page backward and center" })

-- Tmux keybinds --
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate Left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate Down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate Up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate Right" })
-- Top-level Direct Binds
map("n", "<leader>c", "<cmd>NvCheatsheet<cr>", { desc = "" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "LSP Diagnostic" })
map("n", "<leader>g", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
map("n", "<leader>r", "<cmd>set rnu!<cr>", { desc = "Toggle Relative Number" })

-- Your New Direct Telescope Binds
map("n", "<leader>m", "<cmd>Telescope marks<cr>", { desc = "Find Marks" })
map("n", "<leader>t", "<cmd>Telescope themes<cr>", { desc = "NvChad Themes" })

-- Search (The 'f' group)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy Find" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })

-- Essentials & Terminals (Alt-keys)
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggle" }
end, { desc = "Toggle Horizontal Terminal" })

map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggle" }
end, { desc = "Toggle Vertical Terminal" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Toggle Floating Terminal" })
