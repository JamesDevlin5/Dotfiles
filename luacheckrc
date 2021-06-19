
--color = false
codes = true
ranges = true
-- Format program output
-- formatter
cache = "~/.cache/luacheck"
exclude_files = {"**/.*"} -- Ignore hidden files

globals = {
    "vim", -- Link vim library
}

-- STD path-dependent overrides
files["**/*luacheckrc"].std = "+luacheckrc"
files["**/*rockspec"].std = "+rockspec"

max_line_length = 90
max_code_line_length = 80
max_string_line_length = 70
max_comment_line_length = 90

