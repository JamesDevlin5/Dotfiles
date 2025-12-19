--Create an autocommand group with automatic clearing
---@param name string
---@return integer
local function augroup(name)
	return vim.api.nvim_create_augroup("my_" .. name, { clear = true })
end

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(ev)
--         require('keys').lsp_attach_keys(ev)

--         vim.api.nvim_create_autocmd("CursorHold", {
--             callback = function()
--                 vim.diagnostic.open_float(nil, {
--                     focusable = false
--                 })
--             end
--         })
--         --vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])
--     end,
-- })

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

-- removes trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 100,
		})
	end,
})

--[[
-- Dim inactive windows
vim.cmd("highlight default DimInactiveWindows guifg=#555555")

-- When leaving a window, set all highlight groups to a "dimmed" hl_group
vim.api.nvim_create_autocmd({ "WinLeave" }, {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "telescope" then
            return
        end
        local highlights = {}
        for hl, _ in pairs(vim.api.nvim_get_hl(0, {})) do
            table.insert(highlights, hl .. ":DimInactiveWindows")
        end
        vim.wo.winhighlight = table.concat(highlights, ",")
    end,
})

-- When entering a window, restore all highlight groups to original
vim.api.nvim_create_autocmd({ "WinEnter" }, {
    callback = function()
        vim.wo.winhighlight = ""
    end,
})
--]]

-- Keep the cursor position when yanking
local cursorPreYank

vim.keymap.set({ "n", "x" }, "y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "y"
end, { expr = true })

vim.keymap.set("n", "Y", function()
	cursorPreYank = vim.api.nvim_win_get_cursor(0)
	return "yg_"
end, { expr = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		if vim.v.event.operator == "y" and cursorPreYank then
			vim.api.nvim_win_set_cursor(0, cursorPreYank)
		end
	end,
})

-- Auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
	desc = "Auto-resizes splits when the terminal window is resized",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("SplitHelpBufRight", { clear = true }),
	pattern = { "help" },
	desc = "Automatically split help buffers to the right",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("QAutoQuitWindows_ft", { clear = true }),
	pattern = { "help", "qf", "telescope", "buvvers" },
	desc = "Auto-close the window with `q`",
	command = "nnoremap <buffer> <silent> q :close<CR>",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("AutoCreateDirOnSave", { clear = true }),
	desc = "Auto-create directory when saving a file",
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Set nowrap if window is left than textwidth
vim.api.nvim_create_autocmd("WinResized", {
	pattern = "*",
	callback = function()
		local win_width = vim.api.nvim_win_get_width(0)
		local text_width = vim.opt.textwidth._value
		local wide_enough = win_width < text_width + 1
		vim.api.nvim_set_option_value("wrap", wide_enough, {})
	end,
})

-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		if vim.opt.buftype:get() == "terminal" then
			local set = vim.opt_local
			set.number = false -- Don't show numbers
			set.relativenumber = false -- Don't show relativenumbers
			set.scrolloff = 0 -- Don't scroll when at the top or bottom of the terminal buffer
			vim.opt.filetype = "terminal"

			vim.cmd.startinsert() -- Start in insert mode
		end
	end,
})

-- Set nowrap if window is left than textwidth
vim.api.nvim_create_autocmd("WinResized", {
	pattern = "*",
	callback = function()
		local win_width = vim.api.nvim_win_get_width(0)
		local text_width = vim.opt.textwidth._value
		local wide_enough = win_width < text_width + 1
		vim.api.nvim_set_option_value("wrap", wide_enough, {})
	end,
})

-- Highlight visually-selected lines (via the line number)
local ns = vim.api.nvim_create_namespace("visual_line")
vim.api.nvim_create_autocmd({ "ModeChanged", "CursorMoved" }, {
	callback = function(args)
		local mode = vim.fn.mode()
		if args.event == "ModeChanged" and args.match:match("[vV]:.*") then
			-- track when visual mode is canceled and clear the namespace
			vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
		elseif args.event == "CursorMoved" and mode == "v" or mode == "V" or mode == "" then
			-- clear namespace and re-highlight the range
			vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
			local start_line = vim.fn.line("v")
			local end_line = vim.fn.line(".")
			if start_line > end_line then
				start_line, end_line = end_line, start_line
			end
			vim.api.nvim_buf_set_extmark(0, ns, start_line - 1, 0, {
				end_line = end_line - 1,
				-- number_hl_group = "CursorLineNr",
				number_hl_group = "Question",
			})
		end
	end,
})

-- always open quickfix window automatically.
-- this uses cwindows which will open it only if there are entries.
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = vim.api.nvim_create_augroup("AutoOpenQuickfix", { clear = true }),
	pattern = { "[^l]*" },
	command = "cwindow",
})

-- COMMIT_EDITMSG is the filename that Git uses for commit messages when you run
-- commands like `git commit` without `-m`. The commit message is temporarily
-- stored in a file named .git/COMMIT_EDITMSG. Once you save and close the file,
-- Git reads its contents as the commit message. This approach avoids issue with
-- using `FileType` which is an event that editorconfig overrides.
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = "COMMIT_EDITMSG",
	callback = function()
		vim.schedule(function()
			vim.opt_local.textwidth = 80
		end)
	end,
})

-- Markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("markdown"),
	pattern = "markdown",
	desc = "Set markdown textwidth/wrap/spell",
	callback = function()
		vim.bo.textwidth = 80
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Git commit message settings
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("gitcommit"),
	pattern = "gitcommit",
	desc = "Set gitcommit formatting",
	callback = function()
		vim.bo.textwidth = 72
		vim.wo.colorcolumn = "50,73"
		vim.schedule(function()
			vim.wo.spell = true
			vim.wo.wrap = true
		end)
	end,
})

-- Clean old undo files (older than 14 days) with delayed startup
vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("undo_cleanup"),
	desc = "Clean old undo files after delay",
	callback = function()
		vim.defer_fn(function()
			local undodir = vim.fn.expand(vim.o.undodir)

			-- Safety: only proceed if undodir looks like a valid undo directory
			if not undodir:match("undo") then
				return
			end
			if vim.fn.isdirectory(undodir) == 0 then
				return
			end

			local max_age_days = 14
			local max_age_seconds = max_age_days * 24 * 60 * 60
			local now = os.time()
			local deleted = 0

			local handle = vim.uv.fs_scandir(undodir)
			if not handle then
				return
			end

			while true do
				local name, type = vim.uv.fs_scandir_next(handle)
				if not name then
					break
				end

				-- Safety: only delete files that look like undo files (path-encoded with %)
				if type == "file" and name:match("%%") then
					local filepath = vim.fs.joinpath(undodir, name)
					local stat = vim.uv.fs_stat(filepath)
					if stat and (now - stat.mtime.sec) > max_age_seconds then
						if vim.uv.fs_unlink(filepath) then
							deleted = deleted + 1
						end
					end
				end
			end

			if deleted > 0 then
				vim.notify(string.format("Cleaned %d old undo file(s)", deleted), vim.log.levels.INFO)
			end
		end, 5000) -- 5 second delay after startup
	end,
})
