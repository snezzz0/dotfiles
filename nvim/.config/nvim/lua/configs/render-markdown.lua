return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { 
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons" -- NvChad uses web-devicons
  },
  ft = "markdown", -- lazy load only for markdown files
  opts = {},
}
