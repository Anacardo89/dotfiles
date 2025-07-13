SSH_ENV="$HOME/.ssh/agent-environment"

function start_ssh_agent {
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    source "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

function load_ssh_agent {
    if [ -f "${SSH_ENV}" ]; then
        source "${SSH_ENV}" > /dev/null
        if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
            start_ssh_agent
        else
            if ! ssh-add -l &>/dev/null; then
                /usr/bin/ssh-add
            fi
        fi
    else
        start_ssh_agent
    fi
}
