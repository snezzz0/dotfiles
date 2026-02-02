---@type ChadrcConfig
local M = {}

M.plugins = "user"

M.base46 = {
  theme = "kanagawa-dragon",

  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = false },
    ["@keyword"] = { italic = true },
    ["@keyword.function"] = { italic = true },
    ["@conditional"] = { italic = true },
    Visual = { bg = "#3d352d" },
  },
}

-- M.nvdash = { load_on_startup = true }

return M
