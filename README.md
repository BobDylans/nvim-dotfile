# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each subdirectory is a self-contained **stow package** mirroring the `$HOME` directory structure:

```
dotfiles/
├── shell/          → .bashrc, .bash_profile, .bash_logout
├── git/            → .gitconfig
├── vim/            → .vimrc
├── X11/            → .Xresources
├── nvim/           → .config/nvim/
├── tmux/           → .config/tmux/ + .tmux/plugins/
├── fish/           → .config/fish/
├── kitty/          → .config/kitty/
├── ghostty/        → .config/ghostty/
├── hypr/           → .config/hypr/
├── niri/           → .config/niri/
├── waybar/         → .config/waybar/
├── rofi/           → .config/rofi/
├── dunst/          → .config/dunst/
├── btop/           → .config/btop/
├── yazi/           → .config/yazi/
├── starship/       → .config/starship.toml
├── gtk/            → .gtkrc-2.0 + .config/gtk-3.0/
├── qt/             → .config/qt5ct/ + .config/qt6ct/
├── systemd/        → .config/systemd/user/
├── …               (50+ packages total)
└── .gitignore      (sensitive/cache/backup exclusions)
```

## Quick Start

```bash
# Clone to ~/Projects/dotfiles (or wherever you keep it)
git clone https://github.com/BobDylans/nvim-dotfile ~/Projects/dotfiles

# Stow all packages
cd ~/Projects/dotfiles
for pkg in */; do
  pkgname=${pkg%/}
  [ "$pkgname" = ".git" ] && continue
  stow -t "$HOME" "$pkgname"
done
```

Or stow only specific packages:

```bash
stow -t "$HOME" nvim        # Neovim config only
stow -t "$HOME" fish tmux   # Shell + tmux only
```

## Package List

| Package | Targets | Description |
|---------|---------|-------------|
| `shell` | `.bashrc` `.bash_profile` `.bash_logout` | Bash config |
| `git` | `.gitconfig` | Git config |
| `vim` | `.vimrc` | Vim config |
| `X11` | `.Xresources` | X resources |
| `nvim` | `.config/nvim/` | Neovim (LazyVim) |
| `tmux` | `.config/tmux/` `.tmux/` | Tmux + TPM |
| `fish` | `.config/fish/` | Fish shell |
| `kitty` | `.config/kitty/` | Kitty terminal |
| `ghostty` | `.config/ghostty/` | Ghostty terminal |
| `starship` | `.config/starship.toml` | Starship prompt |
| `hypr` | `.config/hypr/` | Hyprland WM |
| `niri` | `.config/niri/` | Niri compositor |
| `waybar` | `.config/waybar/` | Waybar status bar |
| `rofi` | `.config/rofi/` | Rofi launcher |
| `dunst` | `.config/dunst/` | Dunst notifications |
| `btop` | `.config/btop/` | Btop system monitor |
| `fastfetch` | `.config/fastfetch/` | Fastfetch system info |
| `yazi` | `.config/yazi/` | Yazi file manager |
| `gtk` | `.gtkrc-2.0` `.config/gtk-3.0/` | GTK config |
| `qt` | `.config/qt5ct/` `.config/qt6ct/` `.config/QtProject.conf` | Qt config |
| `systemd` | `.config/systemd/user/` | Systemd user services |
| `wireplumber` | `.config/wireplumber/` | PipeWire audio config |
| … | … | 50+ packages total |

## Excluded

The following are excluded via `.gitignore`:

- **Sensitive**: `.ssh/keys/`, `.gnupg/`, `.claude/`, `.pi/`, `.config/gh/` etc.
- **Large/auto**: `.config/Code/`, `.config/google-chrome/`, `.config/hyde/`, `.config/mozilla/`
- **Cache/temp**: `.cache/`, `.local/`, `.npm/`, `.bun/`, `.cargo/`
- **History**: `.bash_history`, `.viminfo`, etc.
- **Backups**: `*.backup*`, `*.bak`
- **Runtime**: cmus, dconf, `__pycache__/`, `aria2.session`

## Migration

This repo was converted from a Neovim-only repository to a multi-package dotfiles
repo. Original git history is preserved.
