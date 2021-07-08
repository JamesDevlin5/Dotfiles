#!/usr/bin/env zsh

# Changing Locations {{{
setopt auto_cd
setopt chase_links
setopt auto_remove_slash
# }}}

# Completion {{{
#setopt always_to_end
setopt complete_in_word
setopt glob_complete
setopt auto_menu
# }}}

# Expansion + Globbing {{{
setopt no_case_glob
setopt no_case_match
setopt glob_star_short
setopt mark_dirs
setopt aliases
# }}}

# History {{{
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt extended_history
# }}}

# I/O {{{
setopt correct
setopt path_dirs
# }}}

# Zle {{{
setopt vi
setopt ignore_eof
setopt no_beep
# }}}

# vim:foldmethod=marker
