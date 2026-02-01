---@type ChadrcConfig
local M = {}

M.plugins = "user"

M.base46 = {
  theme = "doomchad",

  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = false },
    ["@keyword"] = { italic = true },
    ["@keyword.function"] = { italic = true },
    ["@conditional"] = { italic = true },
  },
}

-- M.nvdash = { load_on_startup = true }

return M
