return function()
  require("notify").setup {
    background_colour = "#000000",
  }

  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", {})
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })
end
