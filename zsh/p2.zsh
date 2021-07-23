
precmd() {
  psvar[4]=$(wc -l <<<$(dirs -p))
}
RPROMPT="%u%4v dirs on stack    %{%F{110}%}%{%G%}%{%K{110}%F{124}%} %B%D{%R}%b %{%k%f%}"
