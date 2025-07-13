# Function to get the current Git branch name
function parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# Function to format the prompt
function set_prompt() {
    local NONE="\[\033[0m\]"
    local YELLOW="\[\033[0;33m\]"
    local CYAN="\[\033[0;36m\]"
    local GREEN="\[\033[0;32m\]"

    local branch=$(parse_git_branch)
    if [ ! -z "$branch" ]; then
        branch="${YELLOW}(${branch})${NONE}"
    fi

    PS1="${GREEN}\u@\h ${CYAN}\w ${branch}${NONE}$ "
}

# Apply the prompt setting function
PROMPT_COMMAND=set_prompt