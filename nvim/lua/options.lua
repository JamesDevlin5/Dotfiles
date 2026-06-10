local opt = vim.opt
local set_g = vim.api.nvim_set_var

-- opt.bg = dark
-- vim.cmd [[colorscheme evening]]

set_g("mapleader", " ")

set_g("have_nerd_font", true)

vim.diagnostic.config { virtual_lines = true, severity_sort = true, float = { border = "single" } }

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

opt.path:append { "**" }
opt.wildignore:append {
    "*.o",
    "*.obj",
    "*.dll",
    "*.exe",
    "*.pyc",
    "*.class",
    "*.swp",
    "*.swo",
    "*.DS_Store",
    "*/node_modules/*",
    "*/target/*",
    "*/build/*",
    "*/dist/*",
    "*/.git/*",
    "*/.svn/*",
    "*/.venv/*",
    "*/venv/*",
}

-- Sync clipboard between OS and Neovim
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

--local hostname_handle = io.popen("hostname")
--local hostname_output = hostname_handle:read('*a')
--local laptop_hostname = 'james-Latitude-7490\n'

-- if (hostname_output == laptop_hostname) then
-- else
-- vim.cmd([[
--     ]])
-- end

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
opt.timeoutlen = 400
opt.updatetime = 300

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
--- LSP Folding
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
--]]
--- Indent-based folding
-- opt.foldmethod = "indent"
--- Tree Sitter Folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false -- open by default

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
    nbsp = "␣",
}

opt.fillchars = {
    foldopen = "▾",
    foldclose = "›",
}

vim.o.inccommand = "split"

opt.pyxversion = 3

opt.grepprg = "rg --vimgrep --smart-case --hidden --glob '!.git'"
vim.opt.grepformat = "%f:%l:%c:%m"

-- Partial title rewriting
vim.o.titlestring = "%<%F - nvim"
vim.o.title = true

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
        [vim.fn.expand("~/.config/i3blocks/config")] = "dosini",
    },
    pattern = {
        ["~/.zfunc/*"] = "zsh",
        ["~/.config/kitty/*.conf"] = "kitty",
    },
}
