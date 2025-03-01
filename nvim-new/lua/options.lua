local opt = vim.opt
local set_g = vim.api.nvim_set_var

-- opt.bg = dark
-- vim.cmd [[colorscheme evening]]

set_g("mapleader", " ")

-- Disable unused stuff {{{
-- :help provider.txt
vim.tbl_map(function(p)
    set_g("loaded_" .. p, vim.endswith(p, "provider") and 0 or 1)
    -- vim.g["loaded_" .. p] = vim.endswith(p, "provider") and 0 or 1
end, {
    "2html_plugin",
    "gzip",
    "matchit",
    "matchparen",
    "netrw",
    "netrwPlugin",
    "node_provider",
    "perl_provider",
    "python_provider",
    "rplugin",
    "ruby_provider",
    "tar",
    "tarPlugin",
    "tohtml",
    "tutor",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
})
-- }}}

-- Options {{{
opt.startofline = true
opt.autochdir = true
opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 6
opt.linebreak = true
opt.breakindent = true
opt.showbreak = " >> "
opt.sidescrolloff = 8
opt.number = true
opt.numberwidth = 3
opt.signcolumn = "yes:1"
opt.statuscolumn = "%l%s"
opt.clipboard = "unnamedplus"
vim.cmd([[
let g:clipboard = {
\    'name': 'gpaste',
\    'copy': {
\       '+': ['gpaste-client', '-'],
\       '*': ['gpaste-client', '-'],
\    },
\    'paste': {
\       '+': ['gpaste-client', 'get', '0'],
\       '*': ['gpaste-client', 'get', '0'],
\    },
\    'cache_enabled': 1,
\}
]])

-- opt.cursorline = true
opt.cursorline = false

opt.termguicolors = true
opt.splitbelow = true
opt.splitright = true

opt.splitkeep = "screen"

opt.confirm = true
opt.visualbell = true

opt.undofile = true

opt.infercase = true
opt.showmatch = true
opt.matchtime = 5
opt.timeoutlen = 450
opt.updatetime = 550

opt.spelloptions = "camel,noplainbuffer"
opt.spelllang = { "en_us" }

-- opt.jumpoptions = "stack"

opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumblend = 7
opt.cmdheight = 0
opt.shortmess = "finxoOtTF"
opt.formatoptions = "jcrql1p"

-- opt.iskeyword:remove("_")
-- opt.iskeyword:append("-")

opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true

opt.foldlevelstart = 99
opt.foldcolumn = "2"
opt.foldopen:remove("hor")
--[[TODO: move to when LSP has started
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
--]]
opt.foldmethod = "indent"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.signcolumn = "auto:2-4"
opt.backupdir:remove(".")
opt.conceallevel = 2
opt.virtualedit = "block"
opt.diffopt = "internal,filler,closeoff,algorithm:histogram,context:5,linematch:60"

opt.listchars = {
    tab = "‣ ",
    trail = "·",
    precedes = "«",
    extends = "»",
    eol = "¬",
}

opt.fillchars = {
    foldopen = "▾",
    foldclose = "›",
}

opt.pyxversion = 3

-- }}}

set_g("python3_host_prog", "/usr/bin/python3")
set_g("is_bash", 1)
set_g("sh_fold_enabled", 3)
set_g("zsh_fold_enable", 1)

vim.filetype.add {
    extension = {
        asm = "riscv",
        s = "riscv",
        h = "c", -- hpp is cpp
    },
    filename = {
        [".zshrc"] = "zsh",
        [".bashrc"] = "bash",
    },
    pattern = {
        ["~/.zfunc/*"] = "zsh",
        ["~/.config/kitty/*.conf"] = "kitty",
    },
}

