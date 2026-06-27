function mkvenv --description 'Create a new virtual environment in ~/.venvs'
    if test (count $argv) -eq 0
        echo "Usage: mkvenv <name>"
        return 1
    end
    set venv_path ~/.venvs/$argv[1]
    if test -d $venv_path
        echo "venv '$argv[1]' already exists. Use 'venv $argv[1]' to activate it."
        return 1
    end
    mkdir -p ~/.venvs
    python3 -m venv $venv_path
    and echo "Created venv '$argv[1]'. Run 'venv $argv[1]' to activate."
end
