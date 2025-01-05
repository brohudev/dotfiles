# Dotfiles :3

them be the config files for the most used programs in my day to day workflow:
- kitty
    - purely there because it is better than gnome terminal... until ghostty releases. 
- neovim
    - current replacement for vscode, will pair down the config in the future as I need fewer and fewer things. 
    - list of plugins and what they do: 
        - themeing contains the status bar, the colorscheme, and other such ui elements. 
        - editorcorecore contains the core editor functionality that makes my switch easier: (as you can see by the line count of this file it is already due for a breakup into smaller chunks)
            - an lsp
            - a debugger
            - tree-parser
            - linter
            - autohighlighter
            - session management and project bookmarks
        - editorcore contains qol plugins for the overall experience
            - mini.nvim
            - auto formatter that auto formats on write
            - blankline and auto bracket closer
            - telescope fuzzy finder. 
        - vcscore contains git and its plugins that replace the builtin vs code git ui. 
- nushell:
    - moving over from bash. this is a years long process but for now i have the file so i can easily make changes to it. 
- [coming soon] ghostty
    - better terminal editor. its multiplexing combined with nvim session management will effectively fully replace my past vsc workflow. 

feel free to use them for whatever you wish?



lol (lots of love)




---
this scratchpad is for me to keep track of the todos in one spot heehee

- [ ] fix vale its giving exit code 2
- [ ] read and configure the lsp properly
- [ ] implement code folding
- [ ] read and implement the linters for everything
- [ ] configure the auto formatter to work with all the languages. 
- [ ] auto session is broken :(. fix it somehow?
 - [ ] ghostty also needs some twweakin:
    - [ ] split management keybinds. 
    - [ ] tab management keybinds.
- [ ] nushell needs the tweakin.
