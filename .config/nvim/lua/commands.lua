-- custom nvim commands
function cmd(name, func, opts)
    opts = opts or {}
    vim.api.nvim_create_user_command(name, func, opts)
end

function ReloadConfig()
    for name,_ in pairs(package.loaded) do
    --if name:match('^user') and not name:match('nvim-tree') then
        package.loaded[name] = nil
    --end
    end

    dofile(vim.env.MYVIMRC)
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

cmd("SourceConfig", ReloadConfig)
cmd("EditConfig", "cd ~/.config/nvim/lua | edit ~/.config/nvim/init.lua")
cmd("SourceFile", "luafile %")
