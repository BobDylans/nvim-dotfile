function yazi
    set -l cwd_file (mktemp -t yazi-cwd.XXXXXX)

    if test -z "$cwd_file"
        command yazi $argv
        return $status
    end

    command yazi $argv --cwd-file="$cwd_file"
    set -l yazi_status $status

    if test -f "$cwd_file"
        set -l new_dir (string trim -- (cat "$cwd_file"))

        if test -n "$new_dir"
            and test "$new_dir" != "$PWD"
            cd -- "$new_dir"
        end

        rm -f -- "$cwd_file"
    end

    return $yazi_status
end
