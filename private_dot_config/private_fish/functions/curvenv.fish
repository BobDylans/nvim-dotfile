function curvenv
    if test -n "$VIRTUAL_ENV"
        set -l name (basename "$VIRTUAL_ENV")
        echo "Active virtual environment: $name"
        echo "Path: $VIRTUAL_ENV"

        # Show Python version
        if type -q python
            printf "Python: "
            python --version
        end
    else
        echo "No virtual environment is currently active."
        return 1
    end
end
