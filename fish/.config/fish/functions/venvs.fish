function venvs --description 'List all virtual environments in ~/.venvs'
    set venv_dir ~/.venvs
    if not test -d $venv_dir
        echo "No venvs directory at $venv_dir"
        return 1
    end
    set dirs $venv_dir/*/
    if test (count $dirs) -eq 0
        echo "No venvs found. Use 'mkvenv <name>' to create one."
        return 0
    end
    for d in $dirs
        set name (basename $d)
        if set -q VIRTUAL_ENV; and test (basename $VIRTUAL_ENV) = $name
            echo "* $name  (active)"
        else
            echo "  $name"
        end
    end
end
