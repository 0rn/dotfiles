-- General init (no settings)


-- packer auto install
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
end
vim.cmd [[packadd packer.nvim]]

local ftmodule="ftplugin.%s"
local function loadftmodule(ft,action)
   local modname = ftmodule:format(ft)
   local _, res = pcall(require,modname)
   if type(res)  == "table" then
      if type(res[action]) == "function" then
         res[action]()
      end
   elseif type(res) == "string"
      and not res:match("Module '"..modname.."' not found")
      and not res:match("	no file")
   then print(res) end
end

-- :To create ftplugin files in Lua format put your files into:
-- ~/.config/nvim/lua/ftplugin/FILETYPE/init.lua  //OR//
-- ~/.config/nvim/lua/ftplugin/FILETYPE.lua
vim.api.nvim_create_autocmd({"FileType"}, {
   pattern = {"*"},
   callback = function() loadftmodule(vim.bo.filetype,"ftplugin") end
})

vim.api.nvim_create_autocmd({"FileType"}, {
   pattern = {"*"},
   callback = function() loadftmodule(vim.bo.filetype,"newfile") end
})

vim.api.nvim_create_autocmd({"VimEnter","BufWinEnter","Colorscheme"}, {
   pattern = {"*"},
   callback = function() loadftmodule(vim.bo.filetype,"syntax") end
})
