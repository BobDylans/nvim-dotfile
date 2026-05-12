set -g fish_greeting
set -gx LANG C.UTF-8
set -gx LC_ALL C.UTF-8
set -gx JAVA_HOME /usr/lib/jvm/java-21-openjdk

if status is-interactive
    # Some terminals reopen fish in an unreadable directory such as /root.
    if not pwd >/dev/null 2>/dev/null
        cd $HOME
    end

    if type -q eza
        # Tune eza colors through LS_COLORS so the aliases keep working.
        set -gx LS_COLORS 'fi=38;5;188:di=1;38;5;75:ln=1;38;5;73:ex=1;38;5;114:or=1;38;5;203:mi=38;5;244:pi=38;5;180:so=1;38;5;176:bd=1;38;5;180:cd=1;38;5;180:su=37;41:sg=30;43:tw=30;42:ow=30;43:st=37;44:*.md=38;5;180:*.txt=38;5;188:*.json=38;5;179:*.yaml=38;5;179:*.yml=38;5;179:*.toml=38;5;180:*.js=38;5;221:*.jsx=38;5;215:*.ts=38;5;75:*.tsx=38;5;81:*.py=38;5;114:*.rs=38;5;216:*.go=38;5;75:*.sh=38;5;114:*.png=38;5;176:*.jpg=38;5;176:*.jpeg=38;5;176:*.svg=38;5;176:*.zip=1;38;5;203:*.tar=1;38;5;203:*.gz=1;38;5;203'
        alias ll='eza -lh --group-directories-first --icons=always'
        alias la='eza -lah --group-directories-first --icons=always'
        alias lt='eza --tree --level=2 --group-directories-first --icons=always'
        alias l='eza --group-directories-first --icons=always'
    else
        alias ll='ls -lah'
        alias la='ls -A'
        alias lt='tree -L 2'
        alias l='ls'
    end

    if type -q bat
        abbr -a bb 'bat --style=plain --paging=never'
        alias cat='bat --style=plain --paging=never'
        alias less='bat --paging=always'
        alias more='bat --paging=always'
    end

    if type -q rg
        abbr -a rg rg
    end

    if type -q fd
        abbr -a fd fd
    end

    if type -q fastfetch
        fastfetch
    end

    if type -q oh-my-posh
        oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/amro.omp.json | source
    end

    if type -q direnv
        direnv hook fish | source
    end

    if type -q zoxide
        zoxide init fish --cmd cdz | source
    end
end

function tx
    if test "$argv[1]" = "ll"
        command tmux ls
    else
        command tmux $argv
    end
end

# opencode
fish_add_path /home/ivan/.opencode/bin
