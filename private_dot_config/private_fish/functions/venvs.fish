function venvs
    set -l venv_dir "$HOME/.venvs"

    if not test -d "$venv_dir"
        echo "No virtual environments found. (~/.venvs does not exist)"
        return 1
    end

    set -l count 0
    for dir in "$venv_dir"/*/
        if test -d "$dir"
            set count (math $count + 1)
            set -l name (basename "$dir")

            # Check if this venv is currently active
            if test "$VIRTUAL_ENV" = "$dir"
                printf "  * %s (active)\n" "$name"
            else
                printf "    %s\n" "$name"
            end
        end
    end

    if test $count -eq 0
        echo "No virtual environments found in ~/.venvs"
        return 1
    end

    printf "\nTotal: %d virtual environment(s)\n" $count
end
