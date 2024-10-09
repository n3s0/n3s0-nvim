return {
  "mbbill/undotree",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = true,
  keys = {
    { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
