local rocks_config = {
    rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
    vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
    -- Remove the dylib and dll paths if you do not need macos or windows support
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
    vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))

vim.opt.number = true          -- show current line number
vim.opt.relativenumber = true  -- relative numbers for other lines

-- Theme
vim.cmd("colorscheme kanagawa-wave")

-- Setting relative line numbers colors
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "red" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "orange" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "green" })

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Show window number in statusline
vim.opt.statusline = "[%{winnr()}] %f %m%r%=%l:%c"

-- Leader
vim.g.mapleader = " "

-- Which-key
require("which-key").setup()

local wk = require("which-key")
wk.add({
    -- Window management (SPC w)
    { "<leader>w", group = "window" },
    { "<leader>wh", "<C-w>h", desc = "Window left" },
    { "<leader>wj", "<C-w>j", desc = "Window down" },
    { "<leader>wk", "<C-w>k", desc = "Window up" },
    { "<leader>wl", "<C-w>l", desc = "Window right" },
    { "<leader>ws", "<C-w>s", desc = "Split horizontal" },
    { "<leader>wv", "<C-w>v", desc = "Split vertical" },
    { "<leader>wq", "<C-w>q", desc = "Close window" },
    { "<leader>wo", "<C-w>o", desc = "Close others" },
    { "<leader>w1", "1<C-w>w", desc = "Window 1" },
    { "<leader>w2", "2<C-w>w", desc = "Window 2" },
    { "<leader>w3", "3<C-w>w", desc = "Window 3" },
    { "<leader>w4", "4<C-w>w", desc = "Window 4" },
    { "<leader>wp", function()
        local nr = vim.fn.input("Jump to window: ")
        if nr ~= "" then
            vim.cmd(nr .. "wincmd w")
        end
    end, desc = "Pick window" },

    -- File tree
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File tree" },

    -- Find (telescope)
    { "<leader>f", group = "find" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find file" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },

    -- Buffer management
    { "<leader>b", group = "buffer" },
    { "<leader>bq", "<cmd>bd<cr>", desc = "Close buffer" },
    { "<leader>bn", "<cmd>bn<cr>", desc = "Next buffer" },
    { "<leader>bp", "<cmd>bp<cr>", desc = "Prev buffer" },
})
