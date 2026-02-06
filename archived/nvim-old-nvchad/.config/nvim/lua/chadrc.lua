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
    St_NormalMode  = { bg = "#7E9CD8", fg = "#1F1F28", bold = true },
    St_InsertMode  = { bg = "#98BB6C", fg = "#1F1F28", bold = true }, 
    St_VisualMode  = { bg = "#957FB8", fg = "#1F1F28", bold = true }, 
    St_ReplaceMode = { bg = "#E82424", fg = "#1F1F28", bold = true }, 
    St_CommandMode = { bg = "#FFA066", fg = "#1F1F28", bold = true }, 
    St_TerminalMode = { bg = "#7AA89F", fg = "#1F1F28", bold = true }, 
  },
}

M.nvdash = { 
  load_on_startup = true;
    header = {
    "▄▄    ▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ",
    "█  █  █ █  █ █  █       █  █  █ █       █       █",
    "█   █▄█ █  █▄█  █  ▄▄▄▄▄█   █▄█ █    ▄▄▄█▄▄▄▄   █",
    "█       █       █ █▄▄▄▄▄█       █   █▄▄▄ ▄▄▄▄█  █",
    "█  ▄    █       █▄▄▄▄▄  █  ▄    █    ▄▄▄█ ▄▄▄▄▄▄█",
    "█ █ █   ██     █ ▄▄▄▄▄█ █ █ █   █   █▄▄▄█ █▄▄▄▄▄ ",
    "█▄█  █▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█",
    " ",
    " ",
  },
}

M.ui = {
  statusline = {
    theme = "minimal",
    modules = {
      mode = function()
        local modes = {
          ["n"]  = { "NORMAL", "St_NormalMode" },
          ["i"]  = { "INSERT", "St_InsertMode" },
          ["v"]  = { "VISUAL", "St_VisualMode" },
          ["V"]  = { "V-LINE", "St_VisualMode" },
          [""] = { "V-BLOCK", "St_VisualMode" },
          ["c"]  = { "COMMAND", "St_CommandMode" },
          ["R"]  = { "REPLACE", "St_ReplaceMode" },
          ["t"]  = { "TERMINAL", "St_TerminalMode" },
        }

        local m = vim.api.nvim_get_mode().mode
        local current_mode = modes[m] or { "UNKNOWN", "St_NormalMode" }
        
        -- This returns the color + the mode name (no icon)
        return "%#" .. current_mode[2] .. "#" .. " " .. current_mode[1] .. " "
      end,

      cwd = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        return "%#St_cwd# " .. dir_name .. " "
      end,
    },
  },
}

return M
