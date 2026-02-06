return {
  "numToStr/Comment.nvim",
  keys = {
    { "<leader>/", mode = { "n", "v" }, desc = "Toggle comment" },
  },
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<leader>/",
      },
      opleader = {
        line = "<leader>/",
      },
    })
    
    -- Make it work in visual mode too
    vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })
  end,
}
