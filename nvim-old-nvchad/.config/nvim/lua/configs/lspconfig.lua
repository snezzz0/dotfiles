-- Use the new vim.lsp.config API (nvim 0.11+)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- Python LSP configuration
vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
}

-- HTML LSP
vim.lsp.config.html = {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
}

-- CSS LSP
vim.lsp.config.cssls = {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
}

-- Enable LSP servers
vim.lsp.enable({ "pyright", "html", "cssls" })
