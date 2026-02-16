return {
	"echasnovski/mini.jump2d",
	version = false,
	config = function()
		local jump2d = require("mini.jump2d")

		jump2d.setup({
			mappings = {
				start_jumping = "",
			},
			view = {
				dim = true,
				n_steps_ahead = 2, -- Two-character labels like Helix
			},
		})

		-- Kanagawa-themed colors
		-- Main jump labels - bright peach/orange
		vim.api.nvim_set_hl(0, "MiniJump2dSpot", {
			fg = "#FF9E3B", -- Kanagawa roninYellow
			bold = true,
			underline = true,
		})

		-- Dimmed background
		vim.api.nvim_set_hl(0, "MiniJump2dDim", {
			fg = "#54546D", -- Kanagawa fujiGray
		})

		-- Ahead labels (first char of 2-char sequences)
		vim.api.nvim_set_hl(0, "MiniJump2dSpotAhead", {
			fg = "#7FB4CA", -- Kanagawa crystalBlue
			bold = true,
		})

		vim.keymap.set({ "n", "x", "o" }, "f", function()
			jump2d.start(jump2d.builtin_opts.word_start)
		end)
	end,
}
