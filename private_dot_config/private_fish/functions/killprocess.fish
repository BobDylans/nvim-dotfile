function killprocess --description 'Kill one or more processes selected in fzf'
    if not type -q fzf
        echo "killprocess: fzf is required" >&2
        return 1
    end

    set -l pids (ps aux | fzf -m --header-lines=1 | awk '{print $2}')

    if test -n "$pids"
        echo "Killing processes: $pids"
        kill -9 $pids
    end
end
