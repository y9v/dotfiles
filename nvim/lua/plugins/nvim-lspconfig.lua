return {
  {
    "neovim/nvim-lspconfig",
    version = "^1.0.0",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        },
        solargraph = {},
      },
    },
  },
}
