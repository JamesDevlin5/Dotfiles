#!/usr/bin/env zsh

### Set custom prompt

# Allow for variable/function substitution in prompt
setopt prompt_subst

# Current directory, truncated to 3 path elements (or 4 when one of them is "~")
# The number of elements to keep can be specified as ${1}
function PR_DIR() {
    local sub=${1:=3}
    local len="$((${sub} + 1))"
    local full="$(print -P "%d")"
    local relfull="$(print -P "%~")"
    local shorter="$(print -P "%${len}~")"
    local current="$(print -P "%${len}(~:.../:)%${sub}~")"
    local last="$(print -P "%1~")"

    # Longer path for '~/...'
    if [[ "${shorter}" == \~/* ]]; then
        current=${shorter}
    fi

    local truncated="$(echo "${current%/*}/")"

    # Handle special case of directory '/' or '~something'
    if [[ "${truncated}" == "/" || "${relfull[1,-2]}" != */* ]]; then
        truncated=""
    fi

    # Handle special case of last being '/...' one directory down
    if [[ "${full[2,-1]}" != "" && "${full[2,-1]}" != */* ]]; then
        truncated="/"
        last=${last[2,-1]} # take substring
    fi

    echo "%F{BLUE}${truncated}%F{RED}${last}%f"
}

# An exclamation point if the previous command did not complete successfully
function PR_ERROR() {
    local LAST_EXIT_CODE=$?
    if [[ $LAST_EXIT_CODE -ne 0 ]]; then
        echo "%F{RED}${LAST_EXIT_CODE}%f "
    fi
}

# The arrow symbol that is used in the prompt
# ⇒ ⇥ ↦⧴ᗍ
PR_ARROW_CHAR="ᗌ"



# The arrow in red (for root) or violet (for regular user)
function PR_ARROW() {
    echo "%(!.%F{RED}.%F{MAGENTA})${PR_ARROW_CHAR}%f"
}

# Set custom rhs prompt
# User in red (for root) or violet (for regular user)
RPR_SHOW_USER=true # Set to false to disable user in rhs prompt
function RPR_USER() {
    if [[ "${RPR_SHOW_USER}" == "true" ]]; then
        echo "%(!.%F{RED}.%F{MAGENTA})%n%f"
    fi
}

function machine_name() {
    if [[ -f $HOME/.hostname ]]; then
        cat $HOME/.hostname
    else
        hostname
    fi
}

# Set RHS prompt for git repositories
GIT_PROMPT_SYMBOL="${BOLD_WHITE}  ⎋ ${RESET}"
GIT_PROMPT_PREFIX="${BOLD_MAGENTA} ◀｜${RESET}"
GIT_PROMPT_SUFFIX="${BOLD_MAGENTA}｜▶ ${RESET}"
GIT_PROMPT_AHEAD="${BOLD_CYAN}+NUM ⇧ ${RESET}"
GIT_PROMPT_BEHIND="${BOLD_YELLOW}-NUM ⇩ ${RESET}"
GIT_PROMPT_MERGING="${BOLD_CYAN} ⟺ ${RESET}"
GIT_PROMPT_UNTRACKED="${BOLD_RED} ⦰ ${RESET}"
GIT_PROMPT_MODIFIED="${BOLD_YELLOW} ∓ ${RESET}"
GIT_PROMPT_STAGED="${GREEN} ⿴ ${RESET}"
GIT_PROMPT_DETACHED="${BOLD_MAGENTA} !? ${RESET}"

# Show Git branch/tag, or name-rev if on detached head
function parse_git_branch() {
    (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

function parse_git_detached() {
    if ! git symbolic-ref HEAD >/dev/null 2>&1; then
        echo "${GIT_PROMPT_DETACHED}"
    fi
}

# Show different symbols as appropriate for various Git repository states
function parse_git_state() {
    # Compose this value via multiple conditional appends.
    local GIT_STATE="" GIT_DIFF=""

    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
    fi

    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$NUM_BEHIND" -gt 0 ]; then
        if [[ -n $GIT_STATE ]]; then
            GIT_STATE="$GIT_STATE "
        fi
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
    fi

    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
        if [[ -n $GIT_STATE ]]; then
            # Seperate ahead/behind from local state
            DIVIDER="${BOLD_WHITE} ∣ ${RESET}"
            GIT_STATE=$GIT_STATE$DIVIDER
        fi
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
    fi

    if [[ -n $(git ls-files --other --exclude-standard :/ 2> /dev/null) ]]; then
    GIT_DIFF=$GIT_PROMPT_UNTRACKED
    fi

    if ! git diff --quiet 2> /dev/null; then
    GIT_DIFF=$GIT_DIFF$GIT_PROMPT_MODIFIED
    fi

    if ! git diff --cached --quiet 2> /dev/null; then
    GIT_DIFF=$GIT_DIFF$GIT_PROMPT_STAGED
    fi

    if [[ -n $GIT_STATE && -n $GIT_DIFF ]]; then
        GIT_STATE="$GIT_STATE "
    fi
    GIT_STATE="$GIT_STATE$GIT_DIFF"

    if [[ -n $GIT_STATE ]]; then
    echo "$GIT_STATE "
    fi
}

# If inside a Git repository, print its branch and state
RPR_SHOW_GIT=true # Set to false to disable git status in rhs prompt
function git_prompt_string() {
    if [[ "${RPR_SHOW_GIT}" == "true" ]]; then
        local git_where="$(parse_git_branch)"
        local git_detached="$(parse_git_detached)"
        [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$GIT_PROMPT_PREFIX $(parse_git_state)${BOLD_MAGENTA}${git_where#(refs/heads/|tags/)}${RESET}$git_detached $GIT_PROMPT_SUFFIX"
    fi
}

# Current Time
function RPR_TIME() {
    echo "${BLUE}[${RESET} ${GREEN}%t${RESET} ${BLUE}]${RESET}"
}

# Prompt
function PCMD() {
    echo "$(RPR_TIME) $(PR_ERROR)$(PR_DIR)$(git_prompt_string)$(PR_ARROW) "
}

function RCMD() {
    echo "$(RPR_INFO)"
}

PROMPT='$(PCMD)' # single quotes to prevent immediate execution
RPROMPT='$(RCMD)'
PS2='${BOLD_YELLOW}%_${RESET} ${MAGENTA}⇥ ${RESET} '
