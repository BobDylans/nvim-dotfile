function devenv
    if test -n "$VIRTUAL_ENV"
        deactivate
        echo "Virtual environment deactivated."
    else
        echo "No virtual environment is currently active."
        return 1
    end
end
