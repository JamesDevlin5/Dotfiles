-- Sign Column Symbols {{{
--[[
local signs = {
    Error = " ",
    Warn = " ",
    Info = " ",
    Hint = " ",
}
--]]
local signs = {
	Error = "",
	Warn = "‣",
	Info = "•",
	Hint = "•",
}
--[[ local signs = {
    Error = "•",
    Warn = "•",
    Info = "",
    Hint = "",
} ]]

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
	severity_sort = true, --[[ signs = { severity = vim.diagnostic.severity.WARN } ]]
	-- virtual_text = false
	virtual_text = {
		severity = vim.diagnostic.severity.WARN,
		source = "if_many",
		spacing = 3,
		prefix = " ",
	},
	underline = true,
	float = {
		border = "rounded",
		style = "minimal",
		--source = "always",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = false,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", max_width = 250 })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

vim.cmd([[
" make hover window"s background transparent
highlight! link FloatBorder Normal
highlight! link NormalFloat Normal
]])

-- }}}
