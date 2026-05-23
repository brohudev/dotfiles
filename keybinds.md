---
tags:
  - cheatsheet
  - keybinds
  - tmux
  - neovim
aliases:
  - Keybind Mnemonics
---

# Keybind Mnemonics

> [!abstract] Prefixes
> - **tmux** → `Ctrl+Space` (then key). `Alt+*` works with no prefix.
> - **Neovim** → `Space` = leader · `,` = local leader (LaTeX only)
> - **Forgot?** → `Space` + `?` fuzzy-finds every map

---

## tmux — the map in your head

> [!tip] Core mnemonic
> **s** sessions · **w** windows · **c** create · **|** side · **-** bottom · **hjkl** move · **n/p** next/prev · **x/X** e**X**it pane/window · **f** find project · **t/T** terminal

### No prefix

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **hjkl** | `Alt+h/j/k/l` | move panes (vim directions) |
| **p/n** | `Alt+p` / `Alt+n` | **p**revious / **n**ext window |

### `Ctrl+Space` then…

| Mnemonic | Key | Meaning |
| -------- | --- | ------- |
| **c**reate | `c` | new window (same path) |
| **w**indows | `w` | window picker |
| **s**essions | `s` | session picker |
| **f**ind | `f` | sessionizer → fuzzy project |
| side **\|** | `\|` | split vertical |
| bottom **-** | `-` | split horizontal |
| e**X**it pane | `x` | kill pane |
| e**X**it window | `X` | kill window |
| **z**oom | `z` | zoom pane |
| **t**emp | `t` | popup shell |
| **T** scratch | `T` | persistent scratch popup |
| **HJKL** | `H/J/K/L` | resize (shift = bigger steps) |
| **r**eload | `r` | reload config |

### Copy mode (vi)

| Mnemonic | Key | Meaning |
| -------- | --- | ------- |
| **v**isual | `v` | start select |
| **y**ank | `y` | copy & exit |

---

## Neovim — leader = `Space`

> [!tip] Leader letter = category
> **e/n** tree · **w*** window · **b*** buffer · **s*** search · **g*** git · **c*** code · **d** document · **r** run/rename · **t** toggle · **a** agent · **q** quickfix

### Windows — `Space w*`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **w** + **v**ertical | `wv` | split vertical |
| **w** + **h**orizontal | `wh` | split horizontal |
| **w** + **e**qual | `we` | balance splits |
| **w** + e**x**it | `wx` | close split |

Also: `Ctrl+h/j/k/l` — move focus (vim directions, no leader)

### Buffers — `Space b*`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **b** + **n**ext | `bn` | next buffer |
| **b** + **p**rev | `bp` | previous buffer |
| **b** + **d**elete | `bd` | close buffer |
| **Space Space** | `Space` ×2 | fuzzy buffer list |

### Tree — `Space e` / `Space n`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **e**xplorer | `e` | toggle Neo-tree |
| **n**eotree | `n` | focus Neo-tree |

### Search — `Space s*`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **f**ind (alt) | `f` | find files |
| **s** + **g**rep | `sg` | live grep project |
| **s** + **w**ord | `sw` | grep under cursor |
| **s** + **d**iagnostics | `sd` | diagnostics picker |
| **s** + **.** recent | `s.` | recent files |
| in buffer | `/` | fuzzy current buffer |
| cheat sheet | `?` | all keymaps |

### LSP — `g*` goto · `Space r*` rename · `Space c*` code · `Space d*` document

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **g**oto **d**ef | `gd` | definition |
| **g**oto **r**efs | `gr` | references |
| **g**oto **I**mpl | `gI` | implementation |
| **r**e**n**ame | `rn` | rename symbol |
| **c**ode **a**ction | `ca` | code action |
| **c**ode **f**ormat | `cf` | format buffer |
| **d**ocument **s**ymbols | `ds` | symbols in file |
| **w**orkspace **s**ymbols | `ws` | symbols in project |
| **t**oggle **h**ints | `th` | inlay hints |
| **q**uickfix | `q` | diagnostic list |

Jump back from definition: `Ctrl+t`

### Git — `Space g*`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **g** + **g** (lazy) | `gg` | LazyGit UI |
| **g** + **s**tage | `gs` | stage hunk |
| **g** + **r**eset | `gr` | reset hunk |
| **g** + **p**review | `gp` | preview hunk |
| **g** + **b**lame | `gb` | blame line |
| next/prev hunk | `]c` / `[c` | ] **c**hange forward · [ **c**hange back |

### Run & debug

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **r**un **r**un | `rr` | run command picker |
| **b**reakpoint | `b` | toggle breakpoint |
| **F** keys | `F5`–`F12`, `F6` | debug start/step/UI |

### Agent — `Space a*`

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **a** + **g** | `ag` | toggle Pi agent |
| **a** + **C**ontinue | `aC` | continue session |
| **a** + **R**esume | `aR` | resume picker |

### Surround (mini.nvim defaults)

| Mnemonic | Pattern | Meaning |
| -------- | ------- | ------- |
| **y**ou **s**urround | `ys` + motion + char | add surround |
| **d**elete **s**urround | `ds` + char | remove |
| **c**hange **s**urround | `cs` + old + new | swap |

### LaTeX — `,` local leader

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **l** compile **l** | `,ll` | compile |
| **l** **v**iew | `,lv` | open PDF |
| **l** **t**op | `,lt` | stop compiler |

### Insert mode (completion)

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **Tab** cycle | `Tab` / `S-Tab` | next / prev item |
| **l** jump forward | `Ctrl+l` | snippet expand/jump |
| **h** jump back | `Ctrl+h` | snippet jump back |

### Terminal

| Mnemonic | Keys | Meaning |
| -------- | ---- | ------- |
| **Esc** ×2 | `Esc Esc` | leave terminal → normal mode |

---

## Stack mnemonic

```
Ghostty
  └── tmux  (Ctrl+Space f → project)
        └── pane  (Alt+hjkl)
              └── Neovim  (Space = leader)
```

---

## Memorize in this order

1. `Ctrl+Space` **f** · **\|** **-** · `Alt+hjkl` · `Alt+n/p`
2. `Space` **e** · **f** · **sg** · **Space Space**
3. **gd** · **ca** · **rn**
4. `Space` **?** when stuck
