local ok, wk = pcall(require, "which-key")
if not ok then return end

local n_opts = {mode="n",prefix="",noremap=true,silent=true,nowait=true}
wk.register({
    ["D"] = {"diw", "Delete entire word"},
    ["C"] = {"ciw", "Change entire word"},

    -- leader commands
    ["<leader>"] = {
        name = "Leader commands",
        q = { "<cmd>bd<cr>", "[BUFFER] Close current buffer" },
        ["]"] = { "<cmd>bn<cr>", "[BUFFER] Go previous buffer" },
        ["["] = { "<cmd>bp<cr>", "[BUFFER] Go next buffer" },
        -- lsp labels
        -- TODO: finish this
        -- change to only enable when lsp is enabled?
        e = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Open diaginostics"},
        l = {
            name = "LSP extended",
            p = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic"},
            n = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic"},
            r = "Rename buffer",
            c = "Code action",
            f = "Format",
        },
    },
     -- Telescope
    ["\\f"] = {"<cmd>Telescope find_files<CR>", "[TELESCOPE] Find files"},
    ["\\g"] = {"<cmd>Telescope live_grep<CR>", "[TELESCOPE] Live grep"},
    ["\\m"] = {"<cmd>Telescope marks<CR>", "[TELESCOPE] Marks"},
    ["\\b"] = {"<cmd>Telescope buffers<CR>", "[TELESCOPE] Buffers"},
    ["\\<Space>"] = {"<cmd>Telescope buffers<CR>", "[TELESCOPE] Buffers"},
    ["<S-Left>"] = "<Home>",
    ["<S-Right>"] = "<End>",

    -- LSP and cmp

-- what is this?
--vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    -- just labels, defined in cmp
    -- TODO: find a way to do this there??
    --["<C-f>"] = "Scroll docs down",
    ["<C-Space>"] = "Open completion window",
    --["<C-q>"] = "Close completion window",

    ["gd"] = "Go to definition",
    ["gD"] = "Get declaration",

}, n_opts)

i_opts = {mode="n",prefix="",noremap=true,silent=true,nowait=true}
wk.register({
    ["<S-Left>"] = "<Home>",
    ["<S-Right>"] = "<End>",
}, i_opts)

-- auto change to insert mode in term
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {silent = true, noremap = true})

-- TODO: somehow get wk to work with LSP-lazy load
wk.setup {}


-- Manage tabs
--map("n", "tn",       "<cmd>tabnew %<CR>",   opt)
--map("n", "tq",       "<cmd>tabclose<CR>", opt)
--map("n", "t<Left>",  "<cmd>tabprev<CR>",  opt)
--map("n", "t<Right>", "<cmd>tabnext<CR>",  opt)

-- Line Navigation


-- just use <C-w>v and <C-w>s
--map("n", "\\v",       "<cmd>:vs<CR>", opt)
--map("n", "\\h",       "<cmd>:sp<CR>", opt)

-- Smart manual identation
--map("v", ">",       ">gv", opt)
--map("v", "<lt>",    "<gv", opt)
--map("v", "<Tab>",   ">gv", opt)
--map("v", "<S-Tab>", "<gv", opt)
--map("n", "<Tab>",   ">>",  opt) -- isnt this what it already does?
--map("n", "<S-Tab>", "<<",  opt)

-- The system clipboard
--map("v", "<C-y>",   '"+yy', opt)
--map("n", "<C-y>",   '<cmd>"+yy', opt)

--map("n", "<C-p>",   '"+p', opt)
--map("i", "<C-p>",   '<cmd>"+p', opt)
