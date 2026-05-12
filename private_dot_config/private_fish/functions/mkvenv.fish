function mkvenv
    set -l venv_dir "$HOME/.venvs"
    set -l python_cmd "python3"
    set -l name ""

    # Parse arguments
    if test (count $argv) -eq 0
        # Default name: current directory name
        set name (basename (pwd))
    else if test (count $argv) -eq 1
        # One argument: could be name or version
        if string match -qr '^[0-9]+(\.[0-9]+)*$' "$argv[1]"
            # It's a version number
            set python_cmd "python$argv[1]"
            set name (basename (pwd))
        else
            # It's a name
            set name "$argv[1]"
        end
    else if test (count $argv) -eq 2
        # Two arguments: name and version
        set name "$argv[1]"
        set python_cmd "python$argv[2]"
    else
        echo "Usage: mkvenv [name] [python_version]"
        echo "Examples:"
        echo "  mkvenv              # Create venv with current dir name, default python"
        echo "  mkvenv myproject    # Create venv named 'myproject'"
        echo "  mkvenv 3.11         # Create venv with current dir name, python3.11"
        echo "  mkvenv myproject 3.10  # Create venv 'myproject' with python3.10"
        return 1
    end

    # Check if python command exists
    if not type -q "$python_cmd"
        echo "Error: '$python_cmd' not found. Please install it first."
        return 1
    end

    # Create venv directory if not exists
    if not test -d "$venv_dir"
        mkdir -p "$venv_dir"
    end

    set -l target "$venv_dir/$name"

    # Check if venv already exists
    if test -d "$target"
        echo "Error: Virtual environment '$name' already exists."
        return 1
    end

    echo "Creating virtual environment '$name' with $python_cmd..."
    "$python_cmd" -m venv "$target"

    if test $status -eq 0
        echo "Created: $target"
        echo "Activate with: venv $name"
    else
        echo "Error: Failed to create virtual environment."
        return 1
    end
end
