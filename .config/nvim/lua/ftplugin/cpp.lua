ft = {}


function ft.ftplugin()
    local opt = vim.opt_local

    opt.expandtab = true
    opt.shiftwidth = 2
    opt.softtabstop = 2

    opt.autoindent = true
    opt.smartindent = true

    -- LSP Configuration
    -- Requires ccls
    require("lsp-config").setup("ccls", {})
end

function ft.syntax()

end

return ft
