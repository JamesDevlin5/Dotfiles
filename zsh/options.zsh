#!/usr/bin/env zsh

opts=()

# Changing Locations {{{
opts+=(auto_cd)
opts+=(chase_links)
# }}}

# Completion {{{
#opts+=(always_to_end)
opts+=(complete_in_word)
opts+=(glob_complete)
# }}}

# Expansion + Globbing {{{
opts+=(no_case_glob)
opts+=(no_case_match)
opts+=(glob_star_short)
opts+=(mark_dirs)
# }}}

# History {{{
opts+=(hist_ignore_all_dups)
opts+=(hist_reduce_blanks)
opts+=(inc_append_history)
opts+=(share_history)
# }}}

# I/O {{{
opts+=(correct_all)
opts+=(path_dirs)
# }}}

# Zle {{{
opts+=(vi)
# }}}

for OPTION in ${opts}
do
    setopt "$OPTION"
done

# vim:foldmethod=marker
