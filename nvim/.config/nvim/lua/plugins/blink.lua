return {
	{
		"saghen/blink.cmp",
		-- Note: This requires a Nerd Font for the icons in the menu
		dependencies = "rafamadriz/friendly-snippets",

		version = "*", -- Use a release tag to download pre-built binaries

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrows to navigate)
			keymap = { preset = "super-tab" },

			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for maintaining your colorscheme's look
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "mono",
			},

			-- Default list of enabled providers
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- Experimental signature help support (shows parameter hints as you type)
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
