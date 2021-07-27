local g = vim.g

-- Show line numbers in search rusults
g.any_jump_list_numbers = true

-- Auto search references
g.any_jump_references_enabled = false

-- Auto group results by filename
g.any_jump_grouping_enabled = true

-- Amount of preview lines for each search result
g.any_jump_preview_lines_count = 5

-- Max search results, other results can be opened via [a]
g.any_jump_max_search_results = 10

-- Prefered search engine: rg or ag
g.any_jump_search_prefered_engine = "rg"

-- Search results list styles:
-- - 'filename_first'
-- - 'filename_last'
g.any_jump_results_ui_style = "filename_first"

-- Any-jump window size & position options
g.any_jump_window_width_ratio = 0.6
g.any_jump_window_height_ratio = 0.6
g.any_jump_window_top_offset = 4

-- Customize any-jump colors with extending default color scheme:
-- g.any_jump_colors = { "help": "Comment" }

-- Or override all default colors
--[[
g.any_jump_colors = {
  "plain_text"=         "Comment",
  "preview"=            "Comment",
  "preview_keyword"=    "Operator",
  "heading_text"=       "Function",
  "heading_keyword"=    "Identifier",
  "group_text"=         "Comment",
  "group_name"=         "Function",
  "more_button"=        "Operator",
  "more_explain"=       "Comment",
  "result_line_number"= "Comment",
  "result_text"=        "Statement",
  "result_path"=        "String",
  "help"=               "Comment"
}
]]

-- Disable default any-jump keybindings
-- g.any_jump_disable_default_keybindings = false

-- Remove comments line from search results
-- g.any_jump_remove_comments_from_results = 1

-- Custom ignore files
-- default is: ['*.tmp', '*.temp']
-- g.any_jump_ignored_files:append({})

-- Search references only for current file type
-- (default: false, so will find keyword in all filetypes)
-- g.any_jump_references_only_for_current_filetype = 0

-- Disable search engine ignore vcs untracked files
-- (default: false, search engine will ignore vcs untracked files)
-- g.any_jump_disable_vcs_ignore = 0

