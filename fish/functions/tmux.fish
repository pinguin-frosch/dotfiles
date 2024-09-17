function tmux
    if test (count $argv) -gt 0
        command tmux $argv
    else
        set name $(pwd | awk -F/ '{print $NF}')
        set sessions $(tmux list-sessions | awk -F: '{print $1}')
        if contains $name $sessions
            tmux attach -t $name
        end
        command tmux new-session -s $(pwd | awk -F/ '{print $NF}')
    end
end
