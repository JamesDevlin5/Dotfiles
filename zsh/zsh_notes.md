The golden rule for inserting any such escape sequences into prompts is to surround them with `%{' at the start and `%}' at the end. Otherwise, the shell will be confused about the length of the line.

---

Prompts or parts of prompts, not just bits showing the directory, can be truncated to any length you choose. To truncate a path on the left, use something like `%10<...<%~'. That works like this: the `%<<' is the basic form for truncation. The 10 after the `%' says that anything following is limited to 10 characters, and the characters `...' are to be displayed whenever the prompt would otherwise be longer than that (you can leave this empty).

---

if [[ -o login ]]; then
    print yes
  else
    print no
  fi

---

The basic idea is simple, since any parameter can be a named directory:

  dir=/tmp/mydir
  print ~dir

prints `/tmp/mydir'. So far, this isn't any different from using the parameter as $dir. The difference comes if you use the `%~' construct, described above, in your prompt. Then when you change into that directory, instead of seeing the message `/tmp/mydir', you will see the abbreviation `~dir'.

The shell will not register the name of the directory until you force it to by using `~dir' yourself at least once. You can do the following in your .zshrc:

  dir=/tmp/mydir
  bin=~/myprogs/bin
  : ~dir ~bin

where `:' is a command that does nothing --- but its arguments are checked for parameters and so on in the usual way, so that the shell can put dir and bin into its list of named directories. A more simple way of doing this is to set the option AUTO_NAME_DIRS; then any parameter created which refers to a directory will automatically be turned into a name.

---

`whence`
`bindkey`
`zle`
`zmodload`

---

```zsh
testopts() {
  # $opt will hold the current option
  local opt
  while getopts ab: opt; do
    # loop continues till options finished
    # see which pattern $opt matches...
    case $opt in
      (a)
          print Option a set
          ;;
      (b)
          print Option b set to $OPTARG
          ;;
	# matches a question mark
	# (and nothing else, see text)
      (\?)
          print Bad option, aborting.
          return 1
          ;;
    esac
  done
  (( OPTIND > 1 )) && shift $(( OPTIND - 1 ))
  print Remaining arguments are: $*
}
```

---

One pair (using `#' and `##') removes a given pattern from the head of the string, returning the rest, while the other pair (using `%' and `%%') removes a pattern from the tail of the string. In each case, the form with one symbol removes the shortest matching pattern, while the one with two symbols removes the longest matching pattern.

---

### ZLE Style

:completion:<func>:<completer>:<command>:<argument>:<tag>


func
: is the name of a function from which completion is called --- this is blank if it was started from the standard completion system, and only appears in a few special cases, listed in section six of this chapter.

completer
: is called `complete' in this case: this refers to the fact that the completion system can do more than just simple completion; for example, it can do a more controlled form of expansion, spelling correction, and completing words with spelling mistakes.

command
:  is the name of a command or other similar context.

argument
: is most useful when <command> is the name of a real command; it describes where in the arguments to that command we are. Many of the simpler completions don't use this; only the ones with complicated option and argument combinations. You just have to find out with ^Xh if you need to know.

tag
: describes the type of a completion, essentially a way of discriminating between the different things which can be completed at the same point on the command line.


**ALSO**

- The literal string completion, saying that this style is used by the completion system. This distinguishes the context from those used by, for example, zle widgets and ZFTP functions.
- The function, if completion is called from a named widget rather than through the normal completion system. Typically this is blank, but it is set by special widgets such as predict-on and the various functions in the Widget directory of the distribution to the name of that function, often in an abbreviated form.
- The completer currently active, the name of the function without the leading underscore and with other underscores converted to hyphens. A ‘completer’ is in overall control of how completion is to be performed; ‘complete’ is the simplest, but other completers exist to perform related tasks such as correction, or to modify the behaviour of a later completer. See Control Functions for more information.
- The command or a special -context-, just at it appears following the #compdef tag or the compdef function. Completion functions for commands that have sub-commands usually modify this field to contain the name of the command followed by a minus sign and the sub-command. For example, the completion function for the cvs command sets this field to cvs-add when completing arguments to the add subcommand.
- The argument; this indicates which command line or option argument we are completing. For command arguments this generally takes the form argument-n, where n is the number of the argument, and for arguments to options the form option-opt-n where n is the number of the argument to option opt. However, this is only the case if the command line is parsed with standard UNIX-style options and arguments, so many completions do not set this.
- The tag. As described previously, tags are used to discriminate between the types of matches a completion function can generate in a certain context. Any completion function may use any tag name it likes


#### defs

Taggs describe what the completion objects are, and style describes how they are to be completed.

---

zstyle <context> <style> <value...>

---

bindkey:

If the `-a' option is specified, bind the in-strings in the alternative keymap instead of the standard one. The alternative keymap is used in vi command mode.

---


`whence -mpv`

---

 There are some special effects allowed. You can use patterns to tell how filenames are matched: that's part of the default behaviour, in fact, for example '*.tar=01;31' forces tar files to be coloured red. In that case, you are limited to `*' followed by a string. However, there's a way of specifying colouring for any match, not just files, and for any pattern: use =<pat>=<col>. Here are two ways of getting jobs coloured red in process listings for the `kill' command.

  zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'

This uses the method just described; jobs begin with `%'.

  zstyle ':completion:*:*:kill:*:jobs' list-colors 'no=01;31'

This uses the tag, rather than the pattern, to match the jobs lines.

---


