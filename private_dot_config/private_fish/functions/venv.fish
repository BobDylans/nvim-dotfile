function venv
    set -l venv_dir "$HOME/.venvs"

    if test (count $argv) -eq 0
        echo "Usage: venv <name>"
        echo "Available virtual environments:"
        venvs
        return 1
    end

    set -l name "$argv[1]"
    set -l target "$venv_dir/$name"

    if not test -d "$target"
        echo "Error: Virtual environment '$name' not found."
        echo "Available virtual environments:"
        venvs
        return 1
    end

    # Check if already in this venv
    if test "$VIRTUAL_ENV" = "$target"
        echo "Virtual environment '$name' is already active."
        return 0
    end

    # Deactivate current venv if active
    if test -n "$VIRTUAL_ENV"
        deactivate
    end

    # Activate the new venv
    source "$target/bin/activate.fish"
    echo "Activated virtual environment: $name"
end
