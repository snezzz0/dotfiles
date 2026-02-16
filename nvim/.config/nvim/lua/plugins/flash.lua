return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = true, -- Keep for / search integration
			},
			char = {
				enabled = false, -- Disabled - using mini.jump2d instead
			},
			treesitter = {
				enabled = false, -- Disable R keybind
			},
		},
	},
	keys = {},
}
