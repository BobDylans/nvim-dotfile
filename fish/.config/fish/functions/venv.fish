function venv --description 'Activate a virtual environment from ~/.venvs'
    if test (count $argv) -eq 0
        echo "Usage: venv <name>"
        echo "       venvs  to list available venvs"
        return 1
    end
    set venv_path ~/.venvs/$argv[1]
    if not test -d $venv_path
        echo "venv '$argv[1]' not found. Use 'mkvenv $argv[1]' to create it."
        return 1
    end
    source $venv_path/bin/activate.fish
end
