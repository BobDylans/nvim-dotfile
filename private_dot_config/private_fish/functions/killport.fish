function killport --description 'Select a listening port and kill its process'
    if not type -q fzf
        echo "killport: fzf is required" >&2
        return 1
    end

    if not type -q lsof
        echo "killport: lsof is required" >&2
        return 1
    end

    function __killport_command --argument-names pid
        ps -p $pid | awk 'NR>1 {for (i=4; i<=NF; i++) {printf "%s ", $i}; print ""}'
    end

    set -l pid (
        lsof -iTCP -sTCP:LISTEN -P | awk '{print $2, $9}' | uniq | tail -n +2 | while read -l pid port
            set -l command (__killport_command $pid)
            set -l port (string pad -w 8 (string replace 'localhost' '' $port))
            set -l pid_padded (string pad --right -w 6 $pid)
            echo "$pid_padded $port $command"
        end | fzf --exact --tac --preview 'pstree -p (echo {} | awk "{print \$1}")' --preview-window=down,30% --header "Select a process to kill (PID Port Command):" | awk '{print $1}'
    )

    functions -e __killport_command

    if test -n "$pid"
        kill -9 $pid
    end
end
