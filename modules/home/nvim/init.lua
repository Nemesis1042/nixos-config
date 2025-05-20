local config_path = vim.fn.stdpath('config')
package.path = config_path .. '/?.lua;' .. config_path .. '/?/init.lua;' .. package.path


require("plugins")
require("lsp")
require("ui")
require("dap")     -- DAP-Konfiguration laden
require("test")
vim.cmd("colorscheme tokyonight")

