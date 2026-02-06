return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	-- event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	event = "VeryLazy",
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.opt.timeoutlen
		delay = 0,
		preset = "helix",
		triggers = {
			{ "<leader>", mode = "n" },
			{ "<c-w>", mode = "n" },
			{ "<c-r>", mode = "n" },
			{ "g", mode = "n" },
			{ "s", mode = "n" },
			{ "z", mode = "n" },
			{ "[", mode = "n" },
			{ "]", mode = "n" },
		},
		icons = {
			-- set icon mappings to true if you have a Nerd Font
			mappings = vim.g.have_nerd_font,
			-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
			-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
			keys = vim.g.have_nerd_font and {} or {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				BS = "<BS> ",
				Space = "<Space> ",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},

		-- Document existing key chains
		spec = {
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>l", group = "[L]azy Git" },
			{ "<leader>f", group = "[F]ind" },
		},
	},
	-- keys = {
	--   {
	--     "<leader>?",
	--     function()
	--       require("which-key").show({ global = false })
	--     end,
	--     desc = "Buffer Local Keymaps (which-key)",
	--   },
	-- },
}
