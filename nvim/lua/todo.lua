
"folke/twilight.nvim",
"hrsh7th/vim-vsnip", -- Snippets
-- Lua
"rafcamlet/nvim-luapad", -- Tree Sitter!
-- Paren (+ Delimeter) Highlighting
-- Plug 'p00f/nvim-ts-rainbow'
"luochen1990/rainbow", -- let g:rainbow_active = 1
-- Moving and Selecting
-- 'nvim-treesitter/nvim-treesitter-textobjects'
-- " Pairings
"theHamsta/nvim-treesitter-pairs", "jiangmiao/auto-pairs",
"lewis6991/gitsigns.nvim", -- Git Gutter
-- Editing
"hrsh7th/nvim-compe", -- Completion

https://github.com/svermeulen/vimpeccable
https://github.com/glepnir/lspsaga.nvim

-- Colorschemes
-- TODO: Create function to embed `opt=true` into use for colorschemes
use{
  {
    "sainnhe/edge",
    config = function()
      vim.g.edge_enable_italic = true
      vim.g.edge_disable_italic_comment = true
      vim.g.edge_diagnostic_virtual_text = "colored"
      vim.g.edge_cursor = "blue"
      vim.g.edge_current_word = "underline"
    end,
    disable = true,
    opt = true,
  }, { { "lvim-tech/lvim-colorscheme", opt = true } },
  { { "arcticicestudio/nord-vim", disable = true, opt = true } },
  { { "jacoborus/tender.vim", opt = true } },
  { { "navarasu/onedark.nvim", opt = true } },
}

" TODO: Organize
Plug 'folke/trouble.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'tpope/vim-fugitive'
Plug 'sbdchd/neoformat'
Plug 'winston0410/range-highlight.nvim'
Plug 'matbme/JABS.nvim'

" Viewing the internals
Plug 'nvim-treesitter/playground'
" Dynamic comment string, even within the same file
Plug 'JoosepAlviste/nvim-ts-context-commentstring'


-----------------------
-- TEAL
use {{ 'neovim/nvim-lspconfig', config = function()
  local lspcfg = require("lspconfig")
  local configs = require('lspconfig/configs')
  if not lspcfg.teal then
    configs.teal = {
      default_config = {
        cmd = { 'teal-language-server', },
        filetypes = {'teal'},
        root_dir = lspcfg.util.root_pattern("tlconfig.lua", ".git"),
        settings = {},
      }
    }
  end
end }}

lspconfig.teal.setup{}
