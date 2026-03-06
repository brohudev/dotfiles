# Dotfiles :3  

Config files for my daily workflow. Feel free to use them however you like.  

## 🖥️ System Setup  
- **OS:** [Fedora Workstation](https://getfedora.org/workstation/)  
- **DE/WM:** [GNOME](https://www.gnome.org/) & [Hyprland](https://hyprland.org/)  

## 📦 Included Configs  
### 🖥️ Terminal  
- **[Kitty](https://sw.kovidgoyal.net/kitty/)** – Better than GNOME Terminal (until [Ghostty](https://ghostty.io/) releases).  
- **[Ghostty](https://ghostty.io/)** – Minimal terminal with only 15 lines of config.  

### ✍️ Editor  
- **[Neovim](https://neovim.io/)** – VS Code replacement. Config will be trimmed down over time.  
#### 🔌 Plugins Breakdown  
- **Themeing** – Status bar, colorscheme, and UI elements.  
- **Editor Core** – Essential plugins for a smooth transition from VS Code.  
  - LSP, debugger, tree-sitter, linter, syntax highlighter  
  - Session management, project bookmarks  
- **Quality of Life** –  
  - `mini.nvim`, auto-format on save, bracket closing, blankline  
  - `telescope.nvim` fuzzy finder  
- **Version Control** – Git UI replacement (`vim-fugitive`, `gitsigns.nvim`)  

### 🖥️ Shell  
- **Bash** – Used after a short stint with Nushell.  

## 🛠 Installation with Stow  
```sh
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -t ~/.config kitty nvim ghostty tmux
```

### tmux sessionizer
```sh
# symlink sessionizer into PATH
ln -s ~/.config/tmux/sessionizer ~/.local/bin/tmux-sessionizer

# install fzf (required by sessionizer)
sudo dnf install fzf tmux
```

## ✅ TODO  

## 📝 License  
This project is licensed under the [MIT License](LICENSE).  

lol (lots of love) ❤️  
