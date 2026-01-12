---@type ChadrcConfig
local M = {}

M.plugins = "user"

M.base46 = {
  theme = "tokyonight",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    ["@keyword"] = { italic = true },
    ["@keyword.function"] = { italic = true },
    ["@conditional"] = { italic = true },
  },
} 

-- M.nvdash = { load_on_startup = true }

return M
