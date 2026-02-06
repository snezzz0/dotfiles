return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  -- Force load on startup so it doesn't wait for a keypress
  lazy = false, 
  priority = 1000, 
  
  init = function() 
    vim.g.barbar_auto_setup = false 
  end,
  keys = {
    { '<Tab>', '<Cmd>BufferNext<CR>', desc = 'Next Tab' },
    { '<S-Tab>', '<Cmd>BufferPrevious<CR>', desc = 'Previous Tab' },
    { '<leader>x', '<Cmd>BufferClose<CR>', desc = 'Close Tab' },
  },
  opts = {
    animation = true,
    auto_hide = false, -- Keep it visible even with 1 tab
    clickable = true,
    highlight_visible = true, -- Make sure you can tell which one is active
    insert_at_end = true,     -- New tabs go to the right
  },
}
