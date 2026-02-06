require "nvchad.options"
vim.opt.number = true
vim.opt.relativenumber = true
-- add yours here!
vim.opt.timeoutlen = 400
vim.opt.ttimeoutlen = 10
vim.api.nvim_set_hl(0, "Normal",       { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "NormalNC",     { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "SignColumn",   { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "EndOfBuffer",  { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "MsgArea",      { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "StatusLine",   { bg = "#0f0f14" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#0f0f14" })

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
