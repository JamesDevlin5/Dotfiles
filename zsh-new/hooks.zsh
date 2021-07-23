

periodic
If the parameter PERIOD is set, this function is executed every $PERIOD seconds, just  before
a  prompt.   Note  that  if multiple functions are defined using the array periodic_functions
only one period is applied to the complete set of functions, and the scheduled  time  is  not
reset  if  the  list  of  functions  is altered.  Hence the set of functions is always called
together.

precmd Executed before each prompt.  Note that  precommand  functions  are  not  re-executed  simply
because  the  command  line is redrawn, as happens, for example, when a notification about an
exiting job is displayed.

preexec
Executed just after a command has been read and is about to  be  executed.   If  the  history
mechanism  is  active (regardless of whether the line was discarded from the history buffer),
the string that the user typed is passed as the first argument,  otherwise  it  is  an  empty
string.   The  actual command that will be executed (including expanded aliases) is passed in
two different forms: the second argument is a single-line, size-limited version of  the  com-
mand  (with  things  like  function bodies elided); the third argument contains the full text
that is being executed.

zshaddhistory
Executed when a history line has been read interactively, but before  it  is  executed.   The
sole  argument  is  the  complete history line (so that any terminating newline will still be
    present).

If any of the hook functions returns status 1 (or any non-zero value  other  than  2,  though
    this  is not guaranteed for future versions of the shell) the history line will not be saved,
although it lingers in the history until the next line is executed, allowing you to reuse  or
edit it immediately.

If  any of the hook functions returns status 2 the history line will be saved on the internal
history list, but not written to the history file.  In case of a conflict, the first non-zero
status value is taken.

A  hook  function  may  call `fc -p ...' to switch the history context so that the history is
saved in a different file from the that in the global HISTFILE parameter.   This  is  handled
specially:  the history context is automatically restored after the processing of the history
line is finished.

The following example function works with one of the options INC_APPEND_HISTORY or SHARE_HIS-
TORY set, in order that the line is written out immediately after the history entry is added.
It first adds the history line to the normal history with the newline stripped, which is usu-
ally  the  correct  behaviour.  Then it switches the history context so that the line will be
written to a history file in the current directory.

zshaddhistory() {
  print -sr -- ${1%%$'\n'}
  fc -p .zsh_local_history
}

zshexit
Executed at the point where the main shell is about to exit normally.  This is not called  by
exiting  subshells, nor when the exec precommand modifier is used before an external command.
Also, unlike TRAPEXIT, it is not called when functions exit.

