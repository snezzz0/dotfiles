return {
  "neovim/nvim-lspconfig", -- Still useful as a "bag of configs"
  config = function()
    -- 1. Python (Pyright)
    vim.lsp.config("pyright", {
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
    })

    -- 2. Web (HTML/CSS)
    vim.lsp.config("html", { cmd = { "vscode-html-language-server", "--stdio" } })
    vim.lsp.config("cssls", { cmd = { "vscode-css-language-server", "--stdio" } })
    
    -- 3. Others (Using defaults from lspconfig)
    -- If you have nvim-lspconfig installed, you don't even need 
    -- to define cmd/root_markers for things like clangd or rust_analyzer.
    
    -- 4. Enable them all
    vim.lsp.enable({ "pyright", "html", "cssls", "clangd", "rust_analyzer", "astro" })
  end,
}
