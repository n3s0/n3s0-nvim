return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup()

        -- set keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
    end,
}
