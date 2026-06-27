if status is-interactive
    # 每个 kitty 新 tab 自动跑一次 fastfetch(tmux 内不重复刷屏)
    if set -q KITTY_WINDOW_ID; and not set -q TMUX
        fastfetch
    end
end
alias tx tmux
alias cdz z
set fish_greeting ""
set -p PATH ~/.local/bin
oh-my-posh init fish --config /usr/share/oh-my-posh/themes/the-unnamed.omp.json | source
zoxide init fish --cmd cd | source
# 111
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function cat
    command bat $argv
end
function ls
    command eza --icons $argv
end

function lt
    command eza --icons --tree $argv
end
# grub
abbr grub 'LANGUAGE=en_US.UTF-8 LANG=en_US.UTF-8 sudo grub-mkconfig -o /boot/grub/grub.cfg'
# 小黄鸭补帧 需要steam安装正版小黄鸭
abbr lsfg 'LSFG_PROCESS="miyu"'
# fa运行fastfetch
abbr fa fastfetch
abbr ff fastfetch
abbr reboot 'systemctl reboot'
function sl
    command sl | lolcat
end
function 滚
    sysup
end
function raw
    command ~/.local/bin/random-anime-wallpaper-dms $argv
end

function 安装
    command yay -S $argv
end

function 卸载
    command yay -Rns $argv
end


fish_add_path ~/.cargo/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pi: 禁用启动时的网络检查，加速启动；延长 prompt cache 时效
set --export PI_OFFLINE 1
set --export PI_CACHE_RETENTION long

# 聚宽 JQData SDK
set -x JQ_USERNAME 15138009985
set -x JQ_PASSWORD "1362775750.+Czh"

# MotionPro VPN
function vpndStart
    if not pgrep vpnd >/dev/null
        LD_LIBRARY_PATH=/opt/MotionPro /usr/bin/vpnd &
        disown
        sleep 1
    end
end

function workVpnOn
    vpndStart
    set -l host (grep ^host= ~/.config/motionpro-creds | cut -d= -f2-)
    set -l user (grep ^user= ~/.config/motionpro-creds | cut -d= -f2-)
    set -l pass (grep ^pass= ~/.config/motionpro-creds | cut -d= -f2-)
    set -l method (grep ^method= ~/.config/motionpro-creds | cut -d= -f2-)
    LD_LIBRARY_PATH=/opt/MotionPro /opt/MotionPro/vpn_cmdline \
        -h $host -u $user -p $pass -m $method
end

function workVpnOff
    LD_LIBRARY_PATH=/opt/MotionPro /opt/MotionPro/vpn_cmdline -s
end
if test "$TERMINAL" = kitty
    set -x TERM xterm-kitty
end
function proxyoff
    set -ge http_proxy
    set -ge https_proxy
    set -ge all_proxy
    echo "代理已关闭"
end

function proxyon
    set -gx http_proxy http://127.0.0.1:7890
    set -gx https_proxy http://127.0.0.1:7890
    set -gx all_proxy socks5://127.0.0.1:7891
    echo "代理已开启"
end
