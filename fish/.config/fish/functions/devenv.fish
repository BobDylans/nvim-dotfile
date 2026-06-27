function devenv --description 'Deactivate the current virtual environment'
    if not set -q VIRTUAL_ENV
        echo "No active venv"
        return 1
    end
    deactivate
end
