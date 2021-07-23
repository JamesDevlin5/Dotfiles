#!/usr/bin/env zsh

# Changing Locations {{{
setopt auto_cd
setopt cdable_vars
setopt chase_links
setopt auto_remove_slash
setopt pushd_ignore_dups
# }}}

# Directory Stack {{{
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
# }}}

# Completion {{{
#setopt always_to_end
setopt complete_in_word
setopt glob_complete
setopt complete_aliases
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
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_no_functions
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_subst_pattern
setopt inc_append_history
setopt append_history
setopt extended_history
setopt no_hist_beep
# }}}

# I/O {{{
setopt correct
setopt path_dirs
# }}}

# Zle {{{
setopt vi
setopt ignore_eof
setopt no_beep
setopt interactive_comments
# }}}

# vim:foldmethod=marker
