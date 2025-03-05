-- Prompt to set fold level
function FoldLvl()
    -- TODO: Create number range from 0 to 'foldnestmax'
    vim.ui.select({ 0, 1, 2, 3, 4, 5, 6 }, {
        prompt = "Set fold-level:",
    }, function(lvl)
        if lvl == nil then
            return
        end
        vim.wo.foldlevel = lvl
        vim.notify(
            "Fold level set to: " .. tostring(lvl),
            vim.log.levels.INFO,
            { title = "Config" }
        )
    end)
end

-- Prompt to set fold method
function FoldMeth()
    vim.ui.select({ "indent", "treesitter", "marker", "syntax" }, {
        prompt = "Set fold-method:",
    }, function(item)
        -- null check
        if not item then
            return
        end

        if item == "treesitter" then
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        else
            vim.opt.foldmethod = item
        end
    end)
end

-- range(start)               returns an iterator from 1 to *start* (step := 1)
-- range(start, stop)         returns an iterator from *start* to *stop* (step := 1)
-- range(start, stop, step)   returns an iterator from *start* to *stop* (step := *step*)
Range = function(start, stop, step)
    if start == nil then
        return
    end -- No args = failure

    if not stop then
        stop = start
        start = stop == 0 and 0 or (stop > 0 and 1 or -1)
    end

    step = step or (start < stop and 1 or -1)

    -- Step back once before starting
    start = start - step

    return function()
        if start == stop then
            return nil
        end
        start = start + step
        return start
    end
end

function RunFile()
    local fts = {
        rust = "cargo run",
        python = "python %",
        c = "make",
        cpp = "make",
        java = "java %",
    }

    local cmd = fts[vim.bo.ft]
    if cmd then
        vim.cmd([[w | TermExec cmd="]] .. cmd .. [["]])
    else
        vim.notify("No `run` command specified for filetype: " .. vim.bo.ft, vim.log.levels.ERROR, {
            title = "Run File",
            hide_from_history = true,
        })
    end
end
