vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        require('keys').lsp_attach_keys(ev)

        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.diagnostic.open_float(nil, {
                    focusable = false
                })
            end
        })
        --vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])
    end,
})

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
})

vim.cmd[[
"autocmd("FileType", {
"    pattern = "help",
"	desc = "Automatically Split help Buffers to the right",
"	pattern = "help",
"	command = "wincmd L",
"})

" autocmd("BufWritePre", {
" 	desc = "Autocreate a dir when saving a file",
" 	group = augroup("auto_create_dir", { clear = true }),
" 	callback = function(event)
" 		if event.match:match("^%w%w+:[\\/][\\/]") then
" 			return
" 		end
" 		local file = vim.uv.fs_realpath(event.match) or event.match
" 		fn.mkdir(fn.fnamemodify(file, ":p:h"), "p")
" 	end,
" })
]]

-- Set nowrap if window is left than textwidth
vim.api.nvim_create_autocmd('WinResized', {
  pattern = '*',
  callback = function()
    local win_width = vim.api.nvim_win_get_width(0)
    local text_width = vim.opt.textwidth._value
    local wide_enough = win_width < text_width + 1
    vim.api.nvim_set_option_value('wrap', wide_enough, {})
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
vim.api.nvim_create_autocmd('WinResized', {
  pattern = '*',
  callback = function()
    local win_width = vim.api.nvim_win_get_width(0)
    local text_width = vim.opt.textwidth._value
    local wide_enough = win_width < text_width + 1
    vim.api.nvim_set_option_value('wrap', wide_enough, {})
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
            elseif args.event == "CursorMoved" and mode == 'v' or mode == 'V' or mode == "" then
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
        end
    })
