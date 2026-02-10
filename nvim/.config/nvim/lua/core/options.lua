vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- tabs
vim.opt.showtabline = 0
vim.opt.laststatus = 3

-- long text wrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 80

vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Always hard wrap at 80 characters in every file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	callback = function()
		vim.opt_local.textwidth = 80
		vim.opt_local.formatoptions:append("t") -- wrap text
		vim.opt_local.smartindent = false
	end,
})

-- backup and undo
vim.opt.ruler = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.inccommand = "split"

-- UI
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- folding (for nvim-ufo)
vim.o.foldenable = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 99
vim.o.foldcolumn = "0"

-- window splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- misc
vim.opt.updatetime = 50
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"
