return {
  "mrjones2014/smart-splits.nvim",
  lazy = false, -- required: @pane-is-vim must be set as soon as Neovim starts
  config = function()
    local smart_splits = require("smart-splits")

    smart_splits.setup({
      ignored_filetypes = { "nofile", "quickfix", "prompt" },
      ignored_buftypes = { "nofile" },
    })

    -- Matches the C-h/j/k/l bindings already in your tmux config
    vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left, { desc = "Move to left split/pane" })
    vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down, { desc = "Move to lower split/pane" })
    vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up, { desc = "Move to upper split/pane" })
    vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right, { desc = "Move to right split/pane" })

    -- Matches the M-h/j/k/l resize bindings already in your tmux config
    vim.keymap.set("n", "<A-h>", smart_splits.resize_left, { desc = "Resize split left" })
    vim.keymap.set("n", "<A-j>", smart_splits.resize_down, { desc = "Resize split down" })
    vim.keymap.set("n", "<A-k>", smart_splits.resize_up, { desc = "Resize split up" })
    vim.keymap.set("n", "<A-l>", smart_splits.resize_right, { desc = "Resize split right" })
  end,
}
