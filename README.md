# Add new themes in neovim, tmux and wezterm
In neovim just install another theme.
To get the color values for wezterm and tmux:

- Set the theme in neovim
```vim
:colorscheme name
```
- Open the terminal in neovim and run a script like this:
```python
#!/usr/bin/env python3
for i in range(30, 37 + 1):
    print("\033[%dm█\033[%dm█" % (i, i + 60))
print("█")
```

- Use a color picker program and copy each color
- Set each color in [wezterm](wezterm/colors) and [tmux](tmux/themes)
