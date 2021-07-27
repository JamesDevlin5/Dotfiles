
# Options

# Changing Directories {{{1
setopt auto_cd

# Dirstack {{{1
setopt auto_pushd
setopt pushd_ignore_dups

# Completion {{{1
setopt always_to_end
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt glob_complete
setopt list_ambiguous
setopt list_types
setopt menu_complete

# Expansion and globbing {{{1
## Glob transformations: **  ===  (*/)#  ===  Files in current directory or any subdirectories
##   **  --> **/*    (Doesn't follow symlinks)
##   *** --> **/*    (Follows symlinks)
setopt glob_star_short
setopt mark_dirs
setopt numeric_glob_sort
setopt rc_expand_param
#setopt rematch_pcre

# History {{{1
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks
setopt inc_append_history

# Input/Output {{{1
setopt correct
setopt correct_all
setopt ignore_eof
# Comments {{{2
setopt interactive_comments

# Job Control {{{1
setopt check_jobs
setopt check_running_jobs
setopt hup
setopt long_list_jobs
# Notify immediately when a process changes state {{{2
setopt notify

# Prompting {{{1
setopt prompt_CR
setopt prompt_percent
setopt transient_Rprompt

# Scripts and Functions {{{1
setopt multios

# Shell Emulation {{{1
setopt append_create

# vim:foldmethod=marker
