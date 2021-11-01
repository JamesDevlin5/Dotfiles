
-- https://rrethy.github.io/book/write_a_plugin_manager.html

require('options')

require('plugins')

-- Disable unused stuff
do
	-- :help provider.txt
	vim.tbl_map(
	function(p)
		vim.g["loaded_" .. p] = vim.endswith(p, "provider") and 0 or 1
	end,
	{
					"2html_plugin",
					"gzip",
					"matchit",
					"netrw",
					"netrwPlugin",
					"ruby_provider",
					"perl_provider",
					"python_provider",
					"tar",
					"tarPlugin",
					"vimball",
					"vimballPlugin",
					"zip",
					"zipPlugin",
	})
end

require('autocmds')
require('cmds')
require('keys')

vim.cmd 'source ~/.config/nvim/helpme.vim'

vim.cmd 'colorscheme lvim'

