vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ruby" },
  callback = function()
    vim.b.autoformat = false
  end,
})
