return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			overrides = function(colors)
				return {
					Normal = { bg = "#000000" },
					NormalFloat = { bg = "#000000" },
					FloatBorder = { bg = "#000000" },
					NvimTreeNormal = { bg = "#000000" },
					StatusLine = { bg = "#000000" },
					ColorColumn = { bg = "#000000" },
					SignColumn = { bg = "#000000" },
					Folded = { bg = "#000000" },
					-- Gutter / line number area
					LineNr = { bg = "#000000" },
					LineNrAbove = { bg = "#000000" },
					LineNrBelow = { bg = "#000000" },
					CursorLineNr = { bg = "#000000" },
					FoldColumn = { bg = "#000000" },
					-- Diff indicators (the ~ + - markers on the left)
					DiffAdd = { bg = "#000000" },
					DiffChange = { bg = "#000000" },
					DiffDelete = { bg = "#000000" },
					DiffText = { bg = "#000000" },
					-- Git sign column highlights (if using gitsigns.nvim)
					GitSignsAdd = { bg = "#000000" },
					GitSignsChange = { bg = "#000000" },
					GitSignsDelete = { bg = "#000000" },
					DiagnosticSignWarn = { bg = "#000000" },
					DiagnosticSignHint = { bg = "#000000" },
					DiagnosticSignError = { bg = "#000000" },
					DiagnosticSignInfo = { bg = "#000000" },
				}
			end,
		})
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
